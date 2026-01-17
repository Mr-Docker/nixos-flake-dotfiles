set nocompatible            " disable compatibility to old-time vi
set relativenumber
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
" set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

hi NonText ctermbg=none guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE

hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE
hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE
hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE
hi TabLine ctermbg=None ctermfg=None guibg=None

call plug#begin()
" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'alx741/vim-rustfmt'
Plug 'm4xshen/autoclose.nvim'
Plug 'nordtheme/vim'
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()


colorscheme nord


let g:rustfmt_on_save = 1


let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1


lua << EOF 
require('autoclose').setup()
EOF

lua << EOF
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = { sorter = "case_sensitive" },
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = false },
})
EOF

" Keybind to toggle file tree
nnoremap <C-Up> :NvimTreeToggle<CR>
nnoremap <C-Down> :NvimTreeFocus<CR>
