#!/bin/bash

# dotfiles directory
dotfilesdir=$HOME/dotfiles

# old dotfiles backup directory
olddotfilesdir=$HOME/dotfiles_old

# list of files/folders to symlink in homedir
files=(
    ".tmux.conf" 
    ".zimrc" 
    ".zshrc" 
    ".config/nvim/init.lua"
    ".zsh/completion.zsh"
    ".zsh/input.zsh"
    ".zsh/environment.zsh"
    ".zsh/pure/async"
    ".zsh/pure/prompt_pure_setup"
    ".config/bat/config"
)

# create dotfiles_old in homedir
mkdir -p $olddotfilesdir

# clean old dotfiles
rm -rf $olddotfilesdir/*


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in ${files[@]}; do

    echo "Current dotfile: $file"

    # move old
    if [[ -e "$HOME/$file" || -L "$HOME/$file" ]]; then
        echo "File $HOME/$file exists."

        # create dir on old dot files
        if [[ "$file" == *\/* ]]; then
            dirtocreate=$olddotfilesdir/${file%/*}
            if [ ! -d "$dirtocreate" ]; then
                echo "Create directory $dirtocreate"
                mkdir -p $dirtocreate
            fi
        fi
        echo "Moving $HOME/$file to $olddotfilesdir/$file"
        mv $HOME/$file $olddotfilesdir/$file
    else 
        echo "File $HOME/$file does not exist. Nothing to move."
    fi

    # create dir in home
    if [[ "$file" == *\/* ]]; then
        dirtocreate=$HOME/${file%/*}
        if [ ! -d "$dirtocreate" ]; then
            echo "Create directory $dirtocreate"
            mkdir -p $dirtocreate
        fi
    fi

    echo "Creating symlink $HOME/$file to $dotfilesdir/$file."
    ln -s $dotfilesdir/$file $HOME/$file

    echo
done
