# fav-dir

![image](https://user-images.githubusercontent.com/1855714/83960676-8d8c6200-a8c6-11ea-9ce0-cddcc84b5b20.gif)

[English](README.md) | 한국어

* `fav`는 즐겨 찾는 디렉토리 경로를 저장하고, 쉽게 이동하도록 돕는 셸 스크립트입니다(vim session 경로도 포함).

## 사용법

* `fav` : 선택한 경로로 이동합니다.
* `fav add`, `fav a` : 현재 경로를 즐겨찾기에 추가합니다.
* `fav rm`, `fav r` : 선택한 경로를 즐겨찾기에서 삭제합니다.
* `fav list`, `fav l` : 즐겨찾기 목록을 봅니다.
* `fav clean`, `fav c` : 디스크에 존재하지 않는 경로를 즐겨찾기 목록에서 삭제합니다.

## 설치 방법

```sh
brew tap johngrib/homebrew-johngrib
brew install fav
```

이후 `.bashrc`에 다음 라인을 추가합니다.

```sh
source $(which fav.sh)
```
