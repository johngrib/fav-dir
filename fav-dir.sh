function fav() {
    if [ "$1" = "" ]; then

        FAV_TMP_FILE="/tmp/fav-dir-tempfile"

        fav_create_list

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
        cat $FAV_TMP_FILE
        echo '' > $FAV_TMP_FILE
    fi
}

function fav_create_list() {
    echo '' > $FAV_TMP_FILE

    grep -e 'cd\s' ~/.vim/session/* | sed "s/^.*:cd /[VimSession] /" > $FAV_TMP_FILE 2>/dev/null
    echo '------------' >> $FAV_TMP_FILE
    cat ~/.fav-dir | sed -e "s/^/[ Favorite ] /" >> $FAV_TMP_FILE 2>/dev/null
}
