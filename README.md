From https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

```
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.bash_profile
source ~/.bash_profile
echo ".cfg" >> .gitignore
git clone --bare git@github.com:fastai/dotfiles.git .cfg/
config checkout
config config --local status.showUntrackedFiles no
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
