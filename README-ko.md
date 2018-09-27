# fav-dir

[![asciicast](https://asciinema.org/a/kk1QBvFFLT8K7Kev5N3EZYVlq.png)](https://asciinema.org/a/kk1QBvFFLT8K7Kev5N3EZYVlq)

[English](README.md) | 한국어

* `fav`는 즐겨 찾는 디렉토리 경로를 저장하고, 쉽게 이동하도록 돕는 셸 스크립트입니다(vim session 경로도 포함).

## 사용법

* `fav` : 선택한 경로로 이동합니다.
* `fav add` : 현재 경로를 즐겨찾기에 추가합니다.
* `fav rm` : 선택한 경로를 즐겨찾기에서 삭제합니다.
* `fav list` : 즐겨찾기 목록과 Vim session 경로 목록을 봅니다.

## 설치 방법

* `fav`는 [fzf](https://github.com/junegunn/fzf )에 의존성이 있습니다.

1. [fzf 설치](https://github.com/junegunn/fzf#installation )
2. `git clone https://github.com/johngrib/fav-dir.git`
3. `cd fav-dir`
4. `./install.sh`
5. `.bashrc`나 `.bash_profile`에 `[ -f ~/.local/bin/fav-dir.sh ] && source ~/.local/bin/fav-dir.sh`를 추가하세요.

