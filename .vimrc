" Normal settings
set t_Co=256
" set updatetime=100
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set formatoptions+=r
set background=dark
"set incsearch
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
hi Pmenu ctermbg=black ctermfg=red
hi PmenuSel ctermbg=red ctermfg=black cterm=bold
set backspace=indent,eol,start
set belloff=all
set directory=$PWD
set timeout timeoutlen=5000 ttimeoutlen=100

" key mapping
noremap <F9> :make
noremap <F8> :make run

" TODO: set key maps 
" disable/enable comments (smartcase)?

" Plugins
" set nocompatible
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 
" " Add plugins here
" " ---------------------------------
" Plugin 'VundleVim/Vundle.vim'
" 
" " Color brackets
" " Plugin 'frazrepo/vim-rainbow'
" " au FileType c,cpp,h call rainbow#load()
" " let g:rainbow_active = 1
" 
" " Smooth scrolling
" Plugin 'psliwka/vim-smoothie'
" 
" " Git plugin
" Plugin 'airblade/vim-gitgutter'
" 
" " YouCompleteMe
" Plugin 'Valloric/YouCompleteMe'
" " let g:ycm_add_preview_to_completeopt = 0
" set completeopt-=preview
" autocmd FileType python let g:ycm_disable_signature_help = 1
" " let g:ycm_auto_hover = ''
" 
" " Jedi-vim
" Plugin 'davidhalter/jedi-vim'
" " disable docstring preview
" autocmd FileType python setlocal completeopt-=preview
" 
" " Vim Airline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" let g:airline_extensions = []
" 
" " NERDTree
" Plugin 'preservim/nerdtree'
" nnoremap <F5> :NERDTreeToggle<CR>
" nnoremap <F4> :NERDTreeFocus<CR>
" 
" " Editor Configuration
" Plugin 'editorconfig/editorconfig-vim'
" 
" " Asynchronous Lint Engine
" Plugin 'dense-analysis/ale'
" " ---------------------------------
" call vundle#end()
" filetype plugin indent on

highlight SignColumn ctermbg=235
set showcmd
