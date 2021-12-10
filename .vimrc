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
set ruler
set background=dark
set cursorline
set scrolloff=2
set visualbell
syntax enable

let mapleader = ';'

" Autocomplete
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

" Colors
let g:solarized_termcolors=256
colorscheme solarized

" Mirror NERDTree on new tabs
" autocmd BufEnter * NERDTreeMirror

" File types
au BufNewFile,BufRead *.twig setlocal ft=html
au BufNewFile,BufRead *.slim setlocal ft=slim
au BufRead,BufNewFile *.elm setlocal ft=haskell
au BufRead,BufNewFile *.ko setlocal ft=html
au BufRead,BufNewFile *.less setlocal ft=css

" Shortcuts
nnoremap ww :w<cr>
nnoremap wq :wq<cr>
nnoremap qq :q<cr> 
inoremap jj <Esc>:w<cr>
inoremap ww <Esc>:w<cr>a

nnoremap <Tab> <C-W>w

nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>

nnoremap <Leader>n :NERDTree<cr>
nnoremap <Leader>j :tabp<cr>
nnoremap <Leader>k :tabn<cr>
nnoremap <Leader>t :tabnew<cr>
nnoremap <Leader>s :%s/\s\+$//g<cr>:w<cr>
nnoremap <Leader>e :e!<cr>

map ss ysiw
