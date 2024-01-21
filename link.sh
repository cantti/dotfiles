#!/bin/bash

link=0
adopt=0
deps=0
no=0

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "--link --deps --adopt"
      exit 0
      ;;
    --link)
      link=1
      shift
      ;;
    --no)
      no=1
      shift
      ;;
    --adopt)
      adopt=1
      shift
      ;;
    --deps)
      deps=1
      shift
      ;;
    *)
      break
      ;;
  esac
done

if [[ $link -eq 1 ]]; then
  stow --target=$HOME --verbose --no-folding $([ $adopt -eq 1 ] && echo "--adopt") $([ $no -eq 1 ] && echo "--no") */
  if [[ $adopt -eq 1 ]]; then
    git restore .
  fi
fi

if [[ $deps -eq 1 ]]; then
  # install or update pure
  git -C "$HOME/.zsh/plugins/pure" pull || git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/plugins/pure"

  # install zsh-syntax-highlighting
  git -C "$HOME/.zsh/plugins/zsh-syntax-highlighting" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/plugins/zsh-syntax-highlighting"

  # install fzf
  git -C "$HOME/.fzf" pull || git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  $HOME/.fzf/install --bin
fi
