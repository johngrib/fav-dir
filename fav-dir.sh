function fav() {
    if [ "$1" = "" ]; then
        cd $(grep -e 'cd\s' ~/.vim/session/* ~/.fav-dir 2>/dev/null | sed "s/^.*:cd //" | sed "s,~,$HOME," | uniq | fzf )
        return
    elif [ "$1" = "add" ]; then
        echo "add!!! $(pwd)"
        echo "cd $(pwd)" >> ~/.fav-dir
    fi
}
