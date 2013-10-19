set ai
set autoread
set encoding=utf8
set expandtab
set hlsearch
set ignorecase
set nobackup
set noswapfile
set nowb
set nu
set shiftwidth=2
set tabstop=2
set softtabstop=2
set showmatch
set si
set smarttab
set tabstop=2
set softtabstop=2
set ruler
set background=dark
syntax enable

" Solarized colorscheme
let g:solarized_termcolors=256
colorscheme solarized

" Fuzzy finder shortcut
nnoremap <C-p> :FufTaggedFile<cr>
nnoremap <C-t> :FufTag<cr>

" Save/quit shortcuts
nnoremap ww :w<cr>
nnoremap wq :wq<cr>
nnoremap qq :q<cr> 
imap qq <Esc> 

" Tab navigation between panes
nnoremap <Tab> <C-W>w

" resize shortcuts
nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>

au BufNewFile,BufRead *.twig setlocal ft=html
au BufNewFile,BufRead *.slim setlocal ft=slim
au BufRead,BufNewFile *.elm setlocal ft=haskell

" Autocomplete
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

