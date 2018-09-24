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
        echo "cd $(pwd)" >> ~/.fav-dir

    elif [ "$1" = "list" ]; then

        fav_create_list
        fav_create_vim_session_dir_list
        fav_create_separate_line
        fav_create_favorite_list
        cat $FAV_TMP_FILE
        echo '' > $FAV_TMP_FILE
    fi
}

function fav_create_list() {
    echo '' > $FAV_TMP_FILE
}

function fav_create_vim_session_dir_list() {
    grep -e 'cd\s' ~/.vim/session/* | uniq | sed "s/^.*:cd /[VimSession] /" | sort >> $FAV_TMP_FILE 2>/dev/null
}

function fav_create_separate_line() {
    echo '------------' >> $FAV_TMP_FILE
}

function fav_create_favorite_list() {
    cat ~/.fav-dir | uniq | sed -e "s/^/[ Favorite ] /" >> $FAV_TMP_FILE | sort 2>/dev/null
}
