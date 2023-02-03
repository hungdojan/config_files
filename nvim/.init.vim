" TODO: edit later
set t_Co=256
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
" set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                   " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin("~/.vim/plugged")
 " Plugin Section
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 " Plug 'SirVer/ultisnips'
 " Plug 'honza/vim-snippets'
 " Plug 'scrooloose/nerdtree'
 " Plug 'preservim/nerdcommenter'
 " Plug 'mhinz/vim-startify'
 " Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
 Plug 'kyazdani42/nvim-tree.lua'
 Plug 'karb94/neoscroll.nvim'
 Plug 'neovim/nvim-lspconfig'
call plug#end()

" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
 " colorscheme evening
colorscheme dracula

" open new split panes to right and below
set splitright
set splitbelow

" Key mappings
nnoremap <F5> :NvimTreeToggle<CR>
nnoremap <F4> :NvimTreeFocus<CR>

" lua setups
lua require('neoscroll').setup()
lua require("nvim-tree").setup()

" TEST
Plug 'prabirshrestha/vim-lsp'

Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'


Plug 'jackguo380/vim-lsp-cxx-highlight'


" setting with vim-lsp
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \   'cache': {'directory': stdpath('cache') . '/ccls' },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
