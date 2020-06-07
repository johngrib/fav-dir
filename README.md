# fav-dir

![image](https://user-images.githubusercontent.com/1855714/83960676-8d8c6200-a8c6-11ea-9ce0-cddcc84b5b20.gif)

English | [한국어](README-ko.md)

* `fav` is a shell script that helps you save and jump to your favorite directories and vim session directories.

## How to use

* `fav` : Jumps to the selected path.
* `fav add`, `fav a` : Add the current path to your favorites list.
* `fav rm`, `fav r` : Removes the selected path from your favorites list.
* `fav list`, `fav l` : View your favorites list.
* `fav clean`, `fav c` : Removes paths that do not exist on the disk from the favorites list.

## Install

```sh
brew tap johngrib/homebrew-johngrib
brew install fav
```

And add this line to `.bashrc`.

```sh
source $(which fav.sh)
```
