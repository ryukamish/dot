" designed for vim 8+

if has("eval")                          " vim-tiny lacks 'eval'
    let skip_defaults_vim = 1
endif

set nocompatible    " Disable compatibility with vi which causes unexpected issues

" ==================== Vi Compatible (~/.exrc) ====================

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" no highlight when searching for text
set nohlsearch
set smartcase                   " Search in a smart way (madeup comment)

" show command and insert mode
set showmode

set showcmd                     " Show partial command in the last line of the screen

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" replace tabs with spaces automatically
set expandtab

" tab stop
set tabstop=2

" To open and jump to another buffer without closing vim
set path+=**

" enable auto completion menu after pressing TAB
set wildmenu

" disable relative line numbers, remove no to sample it
set norelativenumber

" turn on default spell checking
" set spell

" disable spellcapcheck
set spc=

"########################################################################
set t_vb=

let mapleader=","

set softtabstop=2

" mostly used with >> and <<
set shiftwidth=2

if v:version >= 800
    " stop vim from silently messing with files that it shouldn't
    set nofixendofline

    " better ascii friendly listchars
    set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

    " no automatic folding
    set foldmethod=manual
    set nofoldenable
endif

" mark trailing spaces as errors
match IncSearch '\s\+$'

" enough for line numbers + gutter within 80 standard
set textwidth=72
"set colorcolumn=73

" risky but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set noshowmatch

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" high contrast
set background=dark

" persistent colorscheme
"colorscheme paramount

" Stop auto commenting on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Vim does not support system clipboard support
" This does not work with text going out of vim to system clipboard
vnoremap <C-c> y: call system("xclip -i", getreg("\""))<CR>
nnoremap <C-v> :r !xclip -o <CR>

" Set the bottom right status file name and relative path to the file and all that shit
set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" ======================= Plugins =======================

if filereadable(expand("~/.vim/autoload/plug.vim"))

    call plug#begin('~/.vim/plugins')
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-surround'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'rwxrob/vim-pandoc-syntax-simple'
    call plug#end()

" NERDTree keybindings
nnoremap <leader>n :NERDTreeToggle <CR>

endif

" ======================== Keybindings =======================

" remapping space for : character
nnoremap <space> :

" navigation b/w panes became easy
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" more keybindings what's more better than this
map <leader>s :%s//g<Left><Left>
" open terminal in vim
map <leader>t :terminal<CR>

" set paste
nmap <leader>p :set paste<CR>i

" check file in shellcheck
map <leader>c :!clear && shellcheck -x %<CR>

" ===============================================================

" save file as sudo on files that requires root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
 	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
