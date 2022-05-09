" designed for vim 8+

if has("eval")                          " vim-tiny lacks 'eval'
    let skip_defaults_vim = 1
endif

set nocompatible    " Disable compatibility with vi which causes unexpected issues

" ==================== Vi Compatible (~/.exrc) ====================

set autoindent                  " automatically indent new lines
set autowrite                   " automatically write files when changing when multiple files open
set number                      " activate line numbers
" set nonumber                  " deactivate line numbers
set nohlsearch                  " No highlight on words searched
set smartcase                   " Search in a smart way (madeup comment)
set showmode                    " Show which mode am in right now
set showcmd                     " Show partial command in the last line of the screen
set path+=**                    " To open and jump to another buffer without closing vim
set wildmenu                    " enable auto completion menu after pressing TAB
set wildmode=longest,full       " make wildmenu behave similar to Bash completion

" ==================================================================

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
colorscheme paramount

" Stop auto commenting on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Vim does not support system clipboard support
" This does not work with text going out of vim to system clipboard
vnoremap <C-c> y: call system("xclip -i", getreg("\""))<CR>
nnoremap <C-v> :r !xclip -o <CR>

" ======================= Plugins =======================

if filereadable(expand("~/.vim/autoload/plug.vim"))

    " github.com/junegunn/vim-plug

    call plugin#begin('~/.vim/plugins')
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-surround'
    call plug#end()

" NERDTree keybindings
nnoremap <leader>n :NERDTreeToggle <CR>

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

" ======================= Status Bar ===========================

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Show the status on the second to last line.
set laststatus=2

" ===============================================================

" save file as sudo on files that requires root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
