set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin("~/.vim/plugged")
 Plug 'kaicataldo/material.vim', { 'branch': 'main' }
 Plug 'ryanoasis/vim-devicons'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/vim-vsnip'
 Plug 'jistr/vim-nerdtree-tabs'
 Plug 'puremourning/vimspector'
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'bfrg/vim-cpp-modern'
call plug#end()

if(has("termguicolors"))
    set termguicolors
endif
syntax enable
let g:material_theme_style = 'darker'
colorscheme material

set splitright
set splitbelow

lua require('lua_config')
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_fuzzy_match = 1
set completeopt=menu,menuone,noselect

map <Leader>n <plug>NERDTreeTabsToggle<CR>
map tc :tabclose<cr>
map tl :tabnext<cr>
map th :tabprevious<cr>

autocmd BufWritePost *.py :silent !autopep8 --in-place --aggressive --aggressive <afile>

let g:nerdtree_tabs_open_on_console_startup = 1
let g:vimspector_install_gadgets = [ 'debugpy' ]
let g:vimspector_enable_mappings = 'HUMAN'
let g:mkdp_auto_start = 1

au BufRead,BufNewFile *.porth set filetype=porth
