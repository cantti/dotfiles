#
# WSL fixes
#

# Windows terminal does not set COLORTERM
# https://github.com/microsoft/terminal/issues/11057
if [[ -n "$WT_SESSION" ]]; then
    export COLORTERM="truecolor"
fi 

# checks to see if we are in a windows or linux dir
function isWinDir {
  case $PWD/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}

# use windows git when use WSl in windows directory
# https://github.com/microsoft/WSL/issues/4401#issuecomment-670080585
if [[ -x "$(command -v git.exe)" ]]; then
  function git {
    if isWinDir
    then
      git.exe "$@"
    else
      /usr/bin/git "$@"
    fi
  }
fi

# use windows dotnet when use WSl in windows directory
if [[ -x "$(command -v dotnet.exe)" ]]; then
  function dotnet {
    if isWinDir
    then
      dotnet.exe "$@"
    else
      /usr/bin/dotnet "$@"
    fi
  }
fi

#
# end WSL fixes
#

# colors
# use
# dircolors --print-database > ~/.dir_colors
# to generate original colors
if [[ -x "$(command -v dircolors)" ]]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
fi

source "$HOME/.zsh/environment.zsh"
source "$HOME/.zsh/completion.zsh"

# key bindings
bindkey -v
source "$HOME/.zsh/input.zsh"

# backspace fix
# https://github.com/spaceship-prompt/spaceship-prompt/issues/91
bindkey "^?" backward-delete-char

# history settings
export HISTSIZE=1000000000
export SAVEHIST=1000000000

# pager
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS -i"

# default editor
export EDITOR="nvim"

# grep
alias grep="grep --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls
alias ls="ls --group-directories-first --color=always --literal"
alias lsa="ls -A"
alias ll="ls -lh"
alias lla="ll -A"
alias llam="lla | less"

# disable auto cd
setopt noautocd

# add ~/.local/bin to PATH
if [[ ! ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
  PATH="$PATH:$HOME/.local/bin"
fi

# fzf
if [[ ! ":$PATH:" == *":$HOME/.fzf/bin:"* ]]; then
  PATH="$PATH:$HOME/.fzf/bin"
fi
if [[ -f "$HOME/.fzf/shell/completion.zsh" ]]; then
  source "$HOME/.fzf/shell/completion.zsh"
fi
if [[ -f "$HOME/.fzf/shell/key-bindings.zsh" ]]; then
  source "$HOME/.fzf/shell/key-bindings.zsh"
fi
export FZF_DEFAULT_OPTS="--exact"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude .git"
_fzf_compgen_path() { # vim **<tab>
  fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}
_fzf_compgen_dir() { # cd **<tab>
  fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias sudovi="sudo -E nvim"
alias sudovim="sudo -E nvim"
alias sudonvim="sudo -E nvim"
alias sudov="sudo -E nvim"

# mc
# make Midnight Commander exit to its current directory
alias mc='source /usr/lib/mc/mc-wrapper.sh'
alias m='mc'

# archiving and compression
alias atool="atool -q"

# open in file explorer
function e {
  if [[ -x "$(command -v explorer.exe)" ]]; then
    explorer.exe "$@"
  else
    dolphin "$@" >/dev/null 2>&1 & disown
  fi
}

# reboot to windows
alias rebootw="systemctl reboot --boot-loader-entry=auto-windows"

# list of colors
function colortest() {
  for i in {0..255}; do  printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done
}

# true color test
function truecolortest() {
  awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
      s="/\\";
      for (colnum = 0; colnum<term_cols; colnum++) {
          r = 255-(colnum*255/term_cols);
          g = (colnum*510/term_cols);
          b = (colnum*255/term_cols);
          if (g>255) g = 510-g;
          printf "\033[48;2;%d;%d;%dm", r,g,b;
          printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
          printf "%s\033[0m", substr(s,colnum%2+1,1);
      }
      printf "\n";
  }'
}

# tmux copy tool
if [[ -x "$(command -v clip.exe)" ]]; then
  export TMUX_CLIPBOARD="clip.exe"
elif [[ $XDG_SESSION_TYPE == "x11" ]]; then
  export TMUX_CLIPBOARD="xsel -ib"
else
  export TMUX_CLIPBOARD="wl-copy"  
fi

# git aliases
alias g="git"
alias lg="lazygit"

# docker aliases
alias docker='sudo docker'
alias docker-compose='sudo docker compose'

# Add .NET Core SDK tools
if [[ ! ":$PATH:" == *"$PATH:$HOME/.dotnet/tools"* ]]; then
  PATH="$PATH:$HOME/.dotnet/tools"
fi

# pure
if [[ -d "$HOME/.zsh/plugins/pure" ]]; then
  fpath+=($HOME/.zsh/plugins/pure)
  autoload -U promptinit; promptinit
  prompt pure
fi

# zsh-syntax-highlighting (must be at the end)
if [[ -f "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# start tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux new-session -A -s "default" >/dev/null 2>&1
fi
