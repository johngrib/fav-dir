function fav() {
    if [ "$1" = "" ]; then

        FAV_TARGET_PATH=$(grep -e 'cd\s' ~/.vim/session/* ~/.fav-dir 2>/dev/null | sed "s/^.*:cd //" | sed "s,~,$HOME," | uniq | fzf )

        if [ "$FAV_TARGET_PATH" != "" ]; then
            cd $FAV_TARGET_PATH
        fi

        return

    elif [ "$1" = "add" ]; then

        echo "added : $(pwd)"
        echo "cd $(pwd)" >> ~/.fav-dir

    elif [ "$1" = "list" ]; then

        FAV_TMP_FILE="/tmp/fav-dir-tempfile"
        echo '' > $FAV_TMP_FILE

        grep -e 'cd\s' ~/.vim/session/* | sed "s/^.*:cd /[VimSession] /" > $FAV_TMP_FILE 2>/dev/null
        echo '------------' >> $FAV_TMP_FILE

        cat ~/.fav-dir | sed -e "s/^/[ Favorite ] /" >> $FAV_TMP_FILE 2>/dev/null

        cat $FAV_TMP_FILE

        echo '' > $FAV_TMP_FILE
    fi
}

