function fav() {
    if [ "$1" = "" ]; then

        FAV_TARGET_PATH=$(grep -e 'cd\s' ~/.vim/session/* ~/.fav-dir 2>/dev/null | sed "s/^.*:cd //" | sed "s,~,$HOME," | uniq | fzf )

        if [ "$FAV_TARGET_PATH" != "" ]; then
            cd $FAV_TARGET_PATH
        fi

        return

    elif [ "$1" = "add" ]; then

        echo "add!!! $(pwd)"
        echo "cd $(pwd)" >> ~/.fav-dir

    fi
}
