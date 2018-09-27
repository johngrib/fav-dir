# fav-dir

[![asciicast](https://asciinema.org/a/kk1QBvFFLT8K7Kev5N3EZYVlq.png)](https://asciinema.org/a/kk1QBvFFLT8K7Kev5N3EZYVlq)

English | [한국어](README-ko.md)

* `fav` is a shell script that helps you save and jump to your favorite directories and vim session directories.

## How to use

* `fav` : Jumps to the selected path.
* `fav add` : Add the current path to your favorites list.
* `fav rm` : Removes the selected path from your favorites list.
* `fav list` : View your favorites list and Vim session directory list.

## Install

* `fav` is dependent on [fzf](https://github.com/junegunn/fzf ).

1. [install fzf](https://github.com/junegunn/fzf#installation )
2. `git clone https://github.com/johngrib/fav-dir.git`
3. `cd fav-dir`
4. `./install.sh`
5. Add `[ -f ~/.local/bin/fav-dir.sh ] && source ~/.local/bin/fav-dir.sh` to your `.bashrc` or `.bash_profile`

