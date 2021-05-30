" Normal settings
set t_Co=256
set updatetime=100
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set formatoptions+=r
set background=dark
"set showmatch"
set smartcase
"set mouse=a
syntax enable
" TODO: set font colors
hi Statement ctermfg=Blue cterm=bold
hi Comment ctermfg=40
hi Type ctermfg=214 cterm=bold
hi Todo cterm=bold
hi Constant ctermfg=208
set backspace=indent,eol,start

"" TODO: set key maps 
"" disable/enable comments (smartcase)?
"
"" Plugins
"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"" Add plugins here
"" ---------------------------------
"Plugin 'VundleVim/Vundle.vim'
"
"" Color brackets
"Plugin 'frazrepo/vim-rainbow'
"let g:rainbow_active = 1
"
"" Git plugin
"Plugin 'airblade/vim-gitgutter'
"
"" Vim Airline
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline_extensions = []
"
"" NERDTree
"Plugin 'preservim/nerdtree'
"map <F5> :NERDTreeToggle<CR>
"" ---------------------------------
"call vundle#end()
"filetype plugin indent on
"
""TODO: Set Lighter Bracket colors"

highlight SignColumn ctermbg=235
set showcmd
