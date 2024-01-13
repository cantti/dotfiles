source "$HOME/.zsh/environment.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/input.zsh"

# pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# history settings
export HISTSIZE=1000000000
export SAVEHIST=1000000000

# add ~/.local/bin to PATH
PATH="$PATH:$HOME/.local/bin"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable auto cd
setopt noautocd

# eza (new) and exa (old)
if [[ -x "$(command -v eza)" ]]; then
  alias ls='eza --group-directories-first --icons --hyperlink --no-quotes'
elif [[ -x "$(command -v exa)" ]]; then
  alias ls='exa --group-directories-first --icons'
else
  return 1
fi

alias m='mc'

# reboot to windows
alias rebootw='systemctl reboot --boot-loader-entry=auto-windows'

# bat for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

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

# fzf
export FZF_DEFAULT_OPTS="--exact"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(right|down|hidden)' --preview-window hidden --preview-window noborder --no-separator"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules'
export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

# tmux copy tool
if [[ -x "$(command -v clip.exe)" ]]; then
  export TMUX_CLIPBOARD="clip.exe"
elif [[ $XDG_SESSION_TYPE == "x11" ]]; then
  export TMUX_CLIPBOARD="xsel -ib"
else
  export TMUX_CLIPBOARD="wl-copy"  
fi

# vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sudovi='sudo -E nvim'
alias sudovim='sudo -E nvim'
alias sudonvim='sudo -E nvim'
alias sudov='sudo -E nvim'

# default editor
export EDITOR='nvim'

# default viewer
export VIEWER='bat'

# make Midnight Commander exit to its current directory
alias mc='source /usr/lib/mc/mc-wrapper.sh'

# git aliases
alias g='git'
alias lg='lazygit'

# start tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux new-session -A -s "default" >/dev/null 2>&1
fi
