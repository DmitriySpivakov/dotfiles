set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

call plug#begin('~/.vim/plugged')

" interface
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'pechorin/any-jump.vim'
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'

" fuzzy search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" code checks
Plug 'scrooloose/syntastic'

" git
Plug 'tpope/vim-fugitive'

" editor extention
Plug 'tpope/vim-surround'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'

" rails
Plug 'tpope/vim-rails'

call plug#end()

let mapleader = " "

set autoread

set number
set relativenumber
set ruler

set incsearch

set expandtab
set shiftwidth=2
set backspace=2

set autoindent
set smartindent

colorscheme gruvbox

" enable built-in delimiters matcher
runtime macros/matchit.vim

" indentline
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" syntastic
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '$HOME/scripts/syntastic_rubocop_exec.sh'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" rubocop shortcut
:command RubocopFx :!(rubocop --safe-auto-correct '%:p') > /dev/null

" NERDtree conf
" Open nerdtree if a dir was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1
" close vim if proj structure is the only buff left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle proj tree w/ Ctrl+n
map <F2> :NERDTreeToggle<cr>

" any-jump colors config
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}


" FZF
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }
" List hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" clipboard integration
set clipboard=unnamedplus

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" key bindings
" nav
noremap <C-n> :Files<cr>
noremap <leader><C-f> :Ag<cr>
" native features shortcuts
noremap <C-s> :w<cr>
" bundle tags
noremap <leader><c-r> :!rm .tags; ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) -f .tags<cr>
" rubocop autofx
noremap <silent> <leader>ff :RubocopFx<cr><cr>
" git
noremap <leader>gs :Gstatus<cr>
noremap <leader>gc :Git commit<cr>
noremap <leader>gp :Git push<cr>
noremap <leader>gb :Git blame<cr>
noremap <leader>gds :Gdiffsplit<cr>
noremap <leader>gm :Git mergetool<cr>

