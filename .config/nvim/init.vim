call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'ajmwagar/vim-deus'
Plug 'tpope/vim-fugitive'

call plug#end()

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
colorscheme deus

let mapleader = ';'

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

nnoremap <C-p> :GFiles<cr>

nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>D <Plug>(coc-type-definition)
nmap <silent> <Leader>I <Plug>(coc-implementation)
nmap <silent> <Leader>r <Plug>(coc-references)
nmap <silent> <Leader>f :call CocAction('format')<cr>
nnoremap <silent> <Leader>i :call CocAction('doHover')<cr>
nnoremap <silent> <Leader>E :CocDiagnostics<cr>
nnoremap <silent> <Leader>f :NERDTreeFind<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>R <Plug>(coc-rename)

nmap <leader>.  <Plug>(coc-codeaction)

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <Leader><Leader>f :Ag<space>
nnoremap <Leader><Leader>l :Lines<cr>
nnoremap <Leader><Leader>h :History<cr>
