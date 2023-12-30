# dotfiles

Dotfiles that configures

zim
https://zimfw.sh/

fzf
https://github.com/junegunn/fzf

tmux & tmux plugin manager
https://github.com/tmux-plugins/tpm

bat
https://github.com/sharkdp/bat

fd
https://github.com/sharkdp/fd

``` sh
# set zsh as default
chsh -s $(which zsh)

# install zim
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install tmux
sudo apt install tmux
sudo pacman -Syu tmux

#  install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# install bat
# https://github.com/sharkdp/bat


# install fd
# https://github.com/sharkdp/fd

```
