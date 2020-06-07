#!/usr/bin/env bash

FAV_DIRECTORY="$HOME/.config/fav-dir"
INDEX="$FAV_DIRECTORY/index"
PREVIEW="ls -alh"

function __fav_help() {
    printf "
[ fav ] - directory favorites

usage: fav [add | rm | list | clean | help]
short: fav [a   | rm | l    | c     | help]

Examples
fav add     => Add pwd to fav index file.
fav rm      => Remove selected directories in index file.
fav list    => Print index file.
fav clean   => Remove invalid directories in index file.
fav help    => Show help.

Code repository: https://github.com/johngrib/fav-dir
\n"
}

function __fav_main() {
    # create_index
    if [ ! -d "$FAV_DIRECTORY" ]; then
        mkdir -p $FAV_DIRECTORY
    fi
    if [ ! -f "$INDEX" ]; then
        touch $INDEX
    fi

    # controller
    case $1 in
        "add"|"a"|"--add"|"-a")
            __fav_add_directory;;
        "rm"|"--rm")
            _fav_remove_directory;;
        "list"|"l"|"-l")
            __fav_get_list;;
        "clean"|"c"|"-c")
            __fav_remove_invalid_directories;;
        "help"|"-h")
            __fav_help;;
        *)
            local TARGET_PATH=$(__fav_get_target_path)
            if [ ! "$TARGET_PATH" = "" ]; then
                cd $TARGET_PATH
            fi
            ;;
    esac
}

function __fav_add_directory() {
    pwd > $INDEX.temp
    cat $INDEX >> $INDEX.temp
    __fav_save_temp_to_index
    echo "Added => $(pwd)"
}

function _fav_remove_directory() {
    echo -n '' > $INDEX.temp
    echo $(
        for directory in `__fav_get_list | fzf -m` ; do
            grep -v "$directory" $INDEX >> $INDEX.temp
            echo "Removed => $directory"
        done
    )
    __fav_save_temp_to_index
}

function __fav_get_list() {
    grep -v '^ *$' $INDEX
}

function __fav_get_target_path() {
    local TARGET_PATH=$( \
        (printParentsRecursive ; echo '' ; __fav_get_list) \
        | cat \
        | fzf --preview="echo {} | xargs $PREVIEW" \
    );
    echo $TARGET_PATH
}

function printParentsRecursive() {
    echo "$(
        local pre=""
        for loc in $(echo $PWD | sed 's,/,\'$'\n/,g'); do
            local pre="$pre$loc"
            echo $pre
        done | sort -r
    )"
}

function __fav_remove_invalid_directories() {
    echo $(
        echo -n '' > $INDEX.temp
        for target in $(__fav_get_list) ; do
            if [ -d "$target" ]; then
                echo "$target" >> $INDEX.temp
            else
                echo "Removed invalid path => $target"
            fi
        done
    )
    __fav_save_temp_to_index
}

function __fav_save_temp_to_index() {
    sort $INDEX.temp | uniq > $INDEX
}

__fav_main $@

