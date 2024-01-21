#!/bin/bash

stow=0
adopt=0
deps=0
no=0
dir="*/"


while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "--deps        install dependencies"
      echo "--adopt       remove local files (files in git will be restored!)"
      echo "--dir=tmux    apply stow only to current dir"
      exit 0
      ;;
    --stow)
      stow=1
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

# get distro
function get_distro() {
  if [[ -f /etc/os-release ]]
  then
      # On Linux systems
      source /etc/os-release
      echo $ID
  else
      # On systems other than Linux (e.g. Mac or FreeBSD)
      uname
  fi
}

distro=$(get_distro)

# install package
# use like paci fd fd-find
function paci() {
  local pac="$1";
  local ub="$2";
  if [[ -z "$ub" ]]; then 
    ub=$pac
  fi
  if [[ "$distro" == "ubuntu" ]]; then
    echo -e "${green}Installing $ub${nc}"
    apt install $ub
  elif [[ "$distro" == "arch" ]]; then
    echo -e "${green}Installing $pac${nc}"
    pacman -S --needed $pac
  fi  
  echo
}

# colors
green="\033[0;32m"
red="\033[0;31m"
orange="\033[0;33m"
nc="\033[0m"

# stow
if [[ $stow -eq 1 ]]; then
  echo -e "${green}Run stow${nc}"
  stow --target=$HOME --verbose --restow --no-folding $([ $adopt -eq 1 ] && echo "--adopt") $([ $no -eq 1 ] && echo "--no") $dir
  echo
  if [[ $adopt -eq 1 ]]; then
    echo -e "${green}Run git restore .${nc}"
    git restore .
  fi
  echo
fi

# deps
if [[ $deps -eq 1 ]]; then
  echo -e "${green}Distro=${nc}$distro\n"

  paci "zsh"

  paci "stow"

  paci "fd" "fd-find"

  if [[ "$distro" == "ubuntu" ]]; then
    mkdir -p ~/.local/bin
    ln -s $(which fdfind) ~/.local/bin/fd
  fi

  paci "ripgrep"

  paci "mc"

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
fi
