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

" Complete:
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

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

  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }

  metals_config.on_attach = function()
    require'completion'.on_attach();
  end

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = '',
      }
    }
  )
EOF

" Needed for compltions _only_ if you aren't using completion-nvim
autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nmap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<cr>
nmap <silent> <Leader>I <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap      <Leader>i <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap      <silent> <Leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap      <silent> <Leader>f :NERDTreeFind<cr>
nmap          <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<cr>
nmap          <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<cr>
nmap          <leader>R <cmd>lua vim.lsp.buf.rename()<cr>

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <Leader><Leader>f :Ag<space>
nnoremap <Leader><Leader>l :Lines<cr>
nnoremap <Leader><Leader>h :History<cr>

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['metals'].setup {
    capabilities = capabilities
  }
EOF
