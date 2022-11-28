call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scalameta/nvim-metals'
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

:lua << EOF
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach({})
    end,
    group = nvim_metals_group,
  })
EOF

nmap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<cr>
nmap <silent> <Leader>I <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap      <Leader>i <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap      <silent> <Leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap      <silent> <Leader>f :NERDTreeFind<cr>
nmap          <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<cr>
nmap          <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<cr>
nmap          <leader>R <cmd>lua vim.lsp.buf.rename()<cr>


inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <Leader><Leader>f :Ag<space>
nnoremap <Leader><Leader>l :Lines<cr>
nnoremap <Leader><Leader>h :History<cr>
