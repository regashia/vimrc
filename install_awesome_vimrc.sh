#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

function install_plugin() {
    local user_name=$(echo ${1} | cut -d '/' -f 1)
    local repository_name=$(echo ${1} | cut -d '/' -f 2)
    rm -rf ${repository_name}
    git clone --depth=1 https://github.com/${1}.git
}

cd my_plugins

install_plugin "editorconfig/editorconfig-vim"

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
