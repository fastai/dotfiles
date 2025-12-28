#!/bin/bash
mkdir -p ~/.vim/tmp ~/.ctags.d ~/.vim/pack/plugins/start
echo TODO--copy over ctags settings

cd ~/.vim/pack/plugins/start
git clone https://github.com/yegappan/lsp
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-surround
git clone https://github.com/arzg/vim-colors-xcode
git clone https://github.com/ggml-org/llama.vim
git clone https://github.com/ludovicchabant/vim-gutentags

brew install macvim universal-ctags lua-language-server
uv tool install python-lsp-server
npm install -g typescript-language-server typescript vscode-langservers-extracted bash-language-server
go install golang.org/x/tools/gopls@latest

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup component add rust-analyzer

echo "Done!"
