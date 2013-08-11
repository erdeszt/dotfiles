set autoread
set ignorecase
set hlsearch
set showmatch
syntax enable
set encoding=utf8
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set splitbelow
set splitright

" resize current buffer by +/- 5
nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>

" Fuzzy finder shortcut
nnoremap <C-p> :FufFile<cr>

" Tab navigation between panes
nnoremap <Tab> <C-W>w

" Ruby style comment on 
nnoremap <C-/> 0i#<Esc>

" Slim files
au BufNewFile,BufRead *.slim setlocal ft=slim
