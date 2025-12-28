unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
packadd! matchit
set guifont=ComicMono:h16
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set autochdir
set undofile
silent !mkdir -p ~/.vim/undo
set undodir=~/.vim/undo

set tags+=~/.vim/my_tags
let $PATH = '/opt/homebrew/bin:' .. $HOME .. '/.cargo/bin:' .. $HOME .. '/aai-ws/.venv/bin:' .. $HOME .. '/.local/bin:' .. $HOME .. '/go/bin:' .. $PATH

let lspServers = [
    \ #{name: 'pylsp', filetype: 'python', path: 'pylsp', args: []},
    \ #{name: 'tsserver', filetype: ['javascript', 'typescript'], path: 'typescript-language-server', args: ['--stdio']},
    \ #{name: 'cssls', filetype: ['css', 'scss'], path: 'vscode-css-language-server', args: ['--stdio']},
    \ #{name: 'html', filetype: 'html', path: 'vscode-html-language-server', args: ['--stdio']},
    \ #{name: 'bashls', filetype: 'sh', path: 'bash-language-server', args: ['start']},
    \ #{name: 'gopls', filetype: 'go', path: 'gopls', args: []},
    \ #{name: 'rust-analyzer', filetype: 'rust', path: 'rust-analyzer', args: []},
    \ #{name: 'lua-language-server', filetype: 'lua', path: 'lua-language-server', args: []}
    \ ]
let lspOptions = #{autoFormat: v:false}
autocmd VimEnter * call LspAddServer(lspServers)
autocmd VimEnter * call LspOptionsSet(lspOptions)

nnoremap <buffer> gi <Cmd>LspGotoImpl<CR>
nnoremap <buffer> gt <Cmd>LspGotoTypeDef<CR>
nnoremap <leader>f :LspFormat<CR>
nnoremap <S-Tab> :LspShowSignature<CR>
inoremap <S-Tab> <C-o>:LspShowSignature<CR>
nnoremap <buffer> gr :LspShowReferences<CR>

function! SetupTagMappings()
  nnoremap <buffer> gd <C-]>
  nnoremap <buffer> K <C-w>}
  nnoremap <buffer> <C-w>gd <C-w><C-]>
  nnoremap <buffer> gp :ptag <C-r><C-w><CR>
endfunction

function! SetupLspMappings()
  nnoremap <buffer> gd :LspGotoDefinition<CR>
  nnoremap <buffer> K :LspHover<CR>
  nnoremap <buffer> <C-w>gd :topleft LspGotoDefinition<CR>
  nnoremap <buffer> gp :LspPeekDefinition<CR>
endfunction

autocmd FileType python call SetupTagMappings()
autocmd FileType javascript,typescript,go,rust,zig call SetupLspMappings()
colorscheme delek
"colorscheme xcodelighthc

set mouse=a

map <leader>ve :sp $MYVIMRC<CR>
map <leader>vs :source $MYVIMRC<CR>
map <leader>w :w<CR>

let python_highlight_all=1

silent !mkdir -p ~/.vim/tmp
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set pastetoggle=<F10>
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab autoindent fileformat=unix
set fo-=t

au BufNewFile,BufRead *.py setlocal shiftwidth=4 textwidth=139 foldmethod=indent foldcolumn=1 signcolumn=yes
au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx setlocal shiftwidth=2 tabstop=2 foldmethod=syntax foldcolumn=1 signcolumn=yes
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened
highlight FoldColumn guibg=#e0e0e0 ctermbg=253
highlight SignColumn guibg=#f0f0f0 ctermbg=254

set list
set listchars=tab:>-
set display+=lastline
set incsearch

set tags+=tags;/

nnoremap <leader>z :<C-u>set foldlevel=<C-r>=v:count<CR><CR>
nnoremap z0 :set foldlevel=0<CR>
nnoremap z1 :set foldlevel=1<CR>
nnoremap z2 :set foldlevel=2<CR>
nnoremap z3 :set foldlevel=3<CR>

"map g] :stj<CR>
map <Leader>= <C-W>=
map <Leader><CR> <C-W>_
map <Leader><Up> <C-W><Up><C-W>_
map <Leader><Down> <C-W><Down><C-W>_
map <Leader>1 99<C-W><Up><C-W>_
map <Leader>2 99<C-W><Up>1<C-W>j<C-W>_
map <Leader>3 99<C-W><Up>2<C-W>j<C-W>_
map <Leader>4 99<C-W><Up>3<C-W>j<C-W>_
map <Leader>5 99<C-W><Up>4<C-W>j<C-W>_
"map <Leader>d Oimport pdb; pdb.set_trace()^[
map <Leader>d Obreakpoint()<Esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>
nnoremap <Leader>l :set number!<CR>

" Press Enter to highlight current word
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

" Function to run the current Python script in a vertical split
function! RunPythonScript()
    write
    let l:cmd = 'python ' . fnameescape(expand('%'))
    call term_start(l:cmd, {'exit_cb': {job, status -> execute('bdelete!')}})
endfunction

nnoremap <Leader>q :call RunPythonScript()<CR>

set t_ti= t_te=
let g:llama_config = {
    \ 'endpoint':           'http://127.0.0.1:8012/infill',
    \ 'api_key':            '',
    \ 'n_prefix':           256,
    \ 'n_suffix':           64,
    \ 'n_predict':          128,
    \ 'stop_strings':       [],
    \ 't_max_prompt_ms':    500,
    \ 't_max_predict_ms':   500,
    \ 'show_info':          0,
    \ 'auto_fim':           v:true,
    \ 'max_line_suffix':    8,
    \ 'max_cache_keys':     250,
    \ 'ring_n_chunks':      16,
    \ 'ring_chunk_size':    64,
    \ 'ring_scope':         1024,
    \ 'ring_update_ms':     1000,
    \ 'keymap_trigger':     "<C-F>",
    \ 'keymap_accept_full': "<Tab>",
    \ 'keymap_accept_line': "<S-Tab>",
    \ 'keymap_accept_word': "<C-B>",
    \ }

set cursorline
highlight CursorLine ctermbg=255 guibg=#f0f0f0
