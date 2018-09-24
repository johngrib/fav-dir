function fav() {
    if [ "$1" = "" ]; then

        FAV_TMP_FILE="/tmp/fav-dir-tempfile"

        fav_create_list
        fav_create_vim_session_dir_list
        fav_create_separate_line
        fav_create_favorite_list

        FAV_TARGET_PATH=$(cat $FAV_TMP_FILE | grep -v '\-\-\-' | fzf )
        FAV_TARGET_PATH=$(echo $FAV_TARGET_PATH | sed "s/\[.*\] //" | sed "s,^~,$HOME,")

        if [ "$FAV_TARGET_PATH" != "" ]; then
            cd $FAV_TARGET_PATH
        fi

        return

    elif [ "$1" = "add" ]; then

        echo "added : $(pwd)"
        echo "$(pwd)" >> ~/.fav-dir

    elif [ "$1" = "list" ]; then

        fav_create_list
        fav_create_vim_session_dir_list
        fav_create_separate_line
        fav_create_favorite_list
        cat $FAV_TMP_FILE
        echo '' > $FAV_TMP_FILE

    elif [ "$1" = "rm" ]; then

        fav_create_list
        fav_create_favorite_list

        FAV_TARGET_PATH=$(cat $FAV_TMP_FILE | grep -v '\-\-\-' | fzf )
        FAV_TARGET_PATH=$(echo $FAV_TARGET_PATH | sed "s/\[.*\] //" | sed "s,^~,$HOME,")

        if [ "$FAV_TARGET_PATH" != "" ]; then
            FAV_TMP_FILE="/tmp/fav-dir-tempfile"
            grep -v -e "$FAV_TARGET_PATH\s*$" ~/.fav-dir | uniq > $FAV_TMP_FILE
            cat $FAV_TMP_FILE > ~/.fav-dir
            echo "removed : $FAV_TARGET_PATH"
            return
        fi
    fi
}

function fav_create_list() {
    echo '' > $FAV_TMP_FILE
}

function fav_create_vim_session_dir_list() {
    grep -e 'cd\s' ~/.vim/session/* | sed "s/^.*:cd /[VimSession] /" | sort | uniq >> $FAV_TMP_FILE 2>/dev/null
}

function fav_create_separate_line() {
    echo '------------' >> $FAV_TMP_FILE
}

function fav_create_favorite_list() {
    cat ~/.fav-dir | sed -e "s/^/[ Favorite ] /" | sort | uniq >> $FAV_TMP_FILE 2>/dev/null
}
