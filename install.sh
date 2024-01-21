#!/bin/bash

stow=1
restow=1
adopt=0
deps=0
no=0
dir="*/"

distro=""
if [[ -n "$(uname -a | grep -i ubuntu)" ]]; then
  distro="ubuntu"
elif [[ -n "$(uname -a | grep -i arch)" ]]; then
  distro="arch"
fi

# colors
green="\033[0;32m"
red="\033[0;31m"
orange="\033[0;33m"
nc="\033[0m"

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "--stow --restow --deps --adopt --dir"
      exit 0
      ;;
    --stow)
      stow=1
      shift
      ;;
    --restow)
      restow=1
      shift
      ;;
    --dir*)
      dir=`echo $1 | sed -e 's/^[^=]*=//g'`
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

if [[ $stow -eq 1 ]]; then
  echo -e "${green}Run stow${nc}"
  stow --target=$HOME --verbose $([ $restow -eq 1 ] && echo "--restow") --no-folding $([ $adopt -eq 1 ] && echo "--adopt") $([ $no -eq 1 ] && echo "--no") $dir
  if [[ $adopt -eq 1 ]]; then
    echo -e "${green}Run git restore .${nc}"
    git restore .
  fi
fi

if [[ $deps -eq 1 ]]; then
  echo -e "${green}Distro=${nc}$distro\n"

  # pure
  echo -e "${green}Installing pure${nc}"
  git -C "$HOME/.zsh/plugins/pure" pull || git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/plugins/pure"
  echo

  # zsh-syntax-highlighting
  echo -e "${green}Installing zsh-syntax-highlighting${nc}"
  git -C "$HOME/.zsh/plugins/zsh-syntax-highlighting" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/plugins/zsh-syntax-highlighting"
  echo

  # install fzf
  echo -e "${green}Installing fzf${nc}"
  git -C "$HOME/.fzf" pull || git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  $HOME/.fzf/install --bin
  echo
  
  # install fd
  echo -e "${green}Installing fd${nc}"
  if [[ "$distro" == "ubuntu" ]]; then
    sudo apt install fd-find
    mkdir -p ~/.local/bin
    ln -s $(which fdfind) ~/.local/bin/fd
  elif [[ "$distro" == "arch" ]]; then
    sudo pacman -S --needed fd
  fi  
  echo

# install ripgrep
  echo -e "${green}Installing ripgrep${nc}"
  if [[ "$distro" == "ubuntu" ]]; then
    sudo apt install ripgrep
  elif [[ "$distro" == "arch" ]]; then
    sudo pacman -S --needed ripgrep
  fi
  echo

  # install mc
  echo -e "${green}Installing mc${nc}"
  if [[ "$distro" == "ubuntu" ]]; then
    sudo apt install mc
  elif [[ "$distro" == "arch" ]]; then
    sudo pacman -S --needed mc
  fi  
fi
