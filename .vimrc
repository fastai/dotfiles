unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
packadd! matchit
set background=dark
filetype off

set ttyfast
set mouse=a
set t_Co=256

set foldcolumn=3

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'jph00/swift-apple'

"Plugin 'janko-m/vim-test'
"nmap <silent> <leader>t :TestNearest<CR>
"nmap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Konfekt/FastFold'

call vundle#end()            " required
filetype plugin indent on

let python_highlight_all=1
syntax on
set encoding=utf-8

set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.

set pastetoggle=<F10>
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab autoindent textwidth=119 fileformat=unix
au BufNewFile,BufRead *.py set shiftwidth=4
"au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab autoindent fileformat=unix
setlocal foldmethod=expr
set list
set listchars=tab:>-

let mapleader = "\\"
map <Leader>ve :sp $HOME/.vimrc<CR>
map <Leader>vs :source $HOME/.vimrc<CR>

map g] :stj<CR>
map <Leader>= <C-W>=
map <Leader><CR> <C-W>_
map <Leader><Up> <C-W><Up><C-W>_
map <Leader><Down> <C-W><Down><C-W>_
map <Leader>1 99<C-W><Up><C-W>_
map <Leader>2 99<C-W><Up>1<C-W>j<C-W>_
map <Leader>3 99<C-W><Up>2<C-W>j<C-W>_
map <Leader>4 99<C-W><Up>3<C-W>j<C-W>_
map <Leader>5 99<C-W><Up>4<C-W>j<C-W>_
map <Leader>d Oimport pdb; pdb.set_trace()^[

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>

