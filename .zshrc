source "$HOME/.zsh/environment.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/input.zsh"

# history settings
export HISTSIZE=1000000000
export SAVEHIST=1000000000

# pager
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS -i"

# default editor
export EDITOR="nvim"

# default viewer
export VIEWER="bat"

# colors
if [[ -x "$(command -v dircolors)" ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# grep
alias grep="grep --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls
alias ls="ls --group-directories-first --color=always --literal"
alias ll="ls -lh"         # long format and human-readable sizes
alias l="ll -A"           # long format, all files
alias lm="l | less"    # long format, all files, use pager
alias lk="ll -Sr"         # long format, largest file size last
alias lt="ll -tr"         # long format, newest modification time last

# bat
export BAT_THEME="OneHalfDark"
export BAT_PAGING='always'

# bat for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# disable auto cd
setopt noautocd

# add ~/.local/bin to PATH
PATH="$PATH:$HOME/.local/bin"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--exact"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(right|down|hidden)' --preview-window hidden --preview-window noborder --no-separator"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules"
export FZF_CTRL_T_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude .git"


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
alias atool="atool -xq"

# open in file explorer
if [[ -x "$(command -v explorer.exe)" ]]; then
  alias e="explorer.exe ."
else
  alias e="dolphin . >/dev/null 2>&1 & disown"
fi

# reboot to windows
alias rebootw="systemctl reboot --boot-loader-entry=auto-windows"

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
