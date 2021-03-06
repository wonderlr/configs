#! /bin/bash
# Set up synced config scripts.
# Intended for one-time execution.
set -e
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo Running $script_dir/${BASH_SOURCE}
echo Adding bash_profile_synced to $HOME/.bash_profile.
echo source $script_dir/bash_profile_synced >> $HOME/.bash_profile
# Commenting all this stuff out because I only want the basic
# .bash_profile configs and scripts, not fancy vim and tmux stuff
echo Adding tmux.conf_synced to $HOME/.tmux.conf.
echo source $script_dir/tmux.conf_synced >> $HOME/.tmux.conf
echo Adding vimrc_synced to $HOME/.vimrc.
echo so $script_dir/vimrc_synced >> $HOME/.vimrc
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
 git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
 # Install plugins which are specified in vimrc_synced.
 vim -c 'PluginInstall' -c 'qa!'
fi
echo "Configurations installed. Now run this command (or just start a new terminal session):"
echo source $script_dir/bash_profile_synced

