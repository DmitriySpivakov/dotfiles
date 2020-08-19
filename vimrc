set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

call plug#begin('~/.vim/plugged')

" interface
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'

" nav
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'

" ergonomics
Plug 'easymotion/vim-easymotion'

" semantic completion
Plug 'neoclide/coc.nvim'

" fuzzy search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" code checks
Plug 'dense-analysis/ale'

" git
Plug 'tpope/vim-fugitive'

" editor extention
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" tests
Plug 'vim-test/vim-test'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'neoclide/coc-solargraph'
Plug 'tpope/vim-bundler'

" rails
Plug 'tpope/vim-rails'

" html stuff
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'

call plug#end()

let mapleader = " "

set autoread

" display row nums config
set number
set relativenumber
set ruler

set incsearch

" indentation
set expandtab
set shiftwidth=2
set backspace=2
set autoindent
set smartindent

colorscheme gruvbox

" enable built-in delimiters matcher (if/unless/do - end)
runtime macros/matchit.vim

" indentline
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" lint
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_ruby_executable = 'ruby'

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%code: %%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_linter_aliases = {}
let g:ale_linters = {'ruby': ['ruby', 'rubocop']}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_warn_about_trailing_whitespace = 1
" coc config
" START
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" END

" rubocop shortcut
:command RubocopFx :!(rubocop --safe-auto-correct '%:p') > /dev/null

" NERDtree conf
" Open nerdtree if a dir was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1
" close vim if proj structure is the only buff left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" vim test
let test#strategy = "neovim"

" Custom Rg 
command! -bang -nargs=* RgRuby
  \ call fzf#vim#grep(
  \   'rg -t ruby -g ''!*_spec.rb'' --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


command! -bang -nargs=* RgSpec
  \ call fzf#vim#grep(
  \   'rg -t ruby -g ''*_spec.rb'' --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" key bindings
" nav
noremap <C-n> :Files<cr>

noremap <leader>fr :RgRuby <CR>
nnoremap <leader>FR :RgRuby <C-R><C-W><CR>
noremap <leader>fs :RgSpec <CR>
nnoremap <leader>FS :RgSpec <C-R><C-W><CR>
noremap <leader>fa :Rg <CR>
nnoremap <leader>FA :Rg <C-R><C-W><CR>

noremap <F2> :NERDTreeToggle<cr>
noremap <leader>nf :NERDTreeFind<cr>
" clear search highlight
noremap <leader>cs :let @/ = ""<cr>
" easymotion
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" cp to clipboard
vnoremap <Leader>yc :w !xclip -i -sel c<CR><CR>

" bundle tags & solargraph index
noremap <leader><c-r> :!rm tags; ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths); bundle exec solargraph scan -v<cr>

" rubocop autofx
noremap <silent> <leader>ff :RubocopFx<cr><cr>

" git
noremap <leader>gs :Gstatus<cr>
noremap <leader>gc :Git commit<cr>
noremap <leader>gp :Git push<cr>
noremap <leader>gb :Git blame<cr>
noremap <leader>gds :Gdiffsplit<cr>
noremap <leader>gm :Git mergetool<cr>

" native features shortcuts
noremap <C-s> :w<cr>
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l

" tests
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
