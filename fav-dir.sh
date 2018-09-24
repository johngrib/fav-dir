function fav() {
    if [ "$1" = "" ]; then
        cd $(grep -e 'cd\s' ~/.vim/session/* ~/.fav-dir | sed "s/^.*:cd //" | sed "s,~,$HOME," | fzf )
        return
    fi
}
