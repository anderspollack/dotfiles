" remap leader key to space
let mapleader="\<Space>"" make <space><space> the shortcut to clear search highlighting
noremap <silent> <Leader><Space> :nohlsearch<CR>

" vim-plug
" https://github.com/junegunn/vim-plug/wiki/tutorial
" install plugins added below:
" :PlugInstall
" update plugins:
" :PlugUpdate
" clean out removed plugins
" :PlugClean

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - For Vim: ~/.vim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Emmet https://github.com/mattn/emmet-vim
" keystroke for emmet autocomplete: CTRL-y, (including the following comma)
" master tutorial for emmet.vim: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" make the working directory the same as the file currently being edited
" set autochdir

" preserves your undo history per file
set undofile

" hybridline numbers
set relativenumber
set number

" toggle cursorline in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" set cursorline only for the currently active pane
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" key mappings
" remap 'Escape' to 'jk', add '`^' to restore the cursor position to where it was
inoremap jk <ESC>`^

" escape terminal command input
tnoremap jk <C-\><C-n>`^
tnoremap <Esc> <C-\><C-n>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au TermOpen * setlocal wrap

" enable mouse scrolling
set mouse=a

" save with <c-s>
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
" copy to system clipboard with <C-c>
vmap <C-c> "*y
" select all text with <C-a>
" nmap <C-a> ggVG
" imap <C-a> <Esc>ggVG

" move cursor with Emacs-style horizontal movement in insert mode
imap <C-b> <Left>
imap <C-f> <Right>

" make <C-d> delete in insert mode
imap <C-d> <Del>

" delimitMate
" indent with newline inside delimiters
let delimitMate_expand_cr=1

" NERDCommenter
" comment with <leader-cc>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" remove netrw banner
let g:netrw_banner = 0


set hlsearch incsearch " turns on highlighting search results and searching as you type.
"
" disable search highlighting
" set nohlsearch

" set lines to break at words, and match initial inentation
set linebreak
set breakindent

" enable autoindent
set autoindent

" make horizontal/vertical window splits happen below/right of current pane
set splitbelow
set splitright

" tab behavior
" shit is confusing, read here: http://tedlogan.com/techblog3.html
set tabstop=2 " width of TAB character
set shiftwidth=2 " size of 'indent'
set expandtab " tab characters are spaces
" set noexpandtab " tab characters are tabs
set softtabstop=2 " number of visual spaces per TAB, if expandtab is set

" show currently typed command in status line
set showcmd

" change cursor shape in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" set colorscheme
colorscheme base16-eighties

filetype plugin on

" setup custom tabline
" http://dhruvasagar.com/2014/04/06/vim-custom-tabline
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let tabnr = i + 1 " range() starts at 0
    let winnr = tabpagewinnr(tabnr)
    let buflist = tabpagebuflist(tabnr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':t')
 
    let s .= '%' . tabnr . 'T'
    let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tabnr
 
    let n = tabpagewinnr(tabnr,'$')
    if n > 1 | let s .= ':' . n | endif
 
    let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '
 
    let bufmodified = getbufvar(bufnr, "&mod")
    if bufmodified | let s .= '+ ' | endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!MyTabLine()
