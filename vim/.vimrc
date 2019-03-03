set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" --- BASE VUNDLE CONFIG END ---

set path+=** " recursive file find in all subdirs
set wildmenu " allow find *.rb tab completion

Plugin 'flazz/vim-colorschemes'
colorscheme dracula

" fzf
set rtp+=~/.fzf
Bundle 'junegunn/fzf.vim'
"

Bundle 'tpope/vim-fugitive'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'

" ruby autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"

Bundle 'scrooloose/nerdtree'
" nerdtree config
let NERDTreeShowHidden=1 " show dotfiles

" autoopen tree if vim starts up on a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ctrl + n tree toggle
map <C-P> :NERDTreeToggle<CR>

