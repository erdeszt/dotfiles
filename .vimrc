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

let mapleader = ';'

" Autocomplete
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

" Colors
let g:solarized_termcolors=256
colorscheme solarized

" Mirror NERDTree on new tabs
autocmd BufEnter * NERDTreeMirror

" File types
au BufNewFile,BufRead *.twig setlocal ft=html
au BufNewFile,BufRead *.slim setlocal ft=slim
au BufRead,BufNewFile *.elm setlocal ft=haskell
au BufRead,BufNewFile *.ko setlocal ft=html

" Shortcuts
nnoremap ww :w<cr>
nnoremap wq :wq<cr>
nnoremap qq :q<cr> 

nnoremap <Tab> <C-W>w

nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>

nnoremap <Leader>n :NERDTree<cr>
nnoremap <Leader>j :tabp<cr>
nnoremap <Leader>k :tabn<cr>

nnoremap <C-p> :FufTaggedFile<cr>
nnoremap <C-t> :FufTag<cr>

map ss ysiw
