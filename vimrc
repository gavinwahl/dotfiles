set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set expandtab
set mouse=a
set title

colorscheme zenburn


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
 filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set complete+=k

set ttimeoutlen=50
set smarttab
set ignorecase
set shiftwidth=2
cmap W w
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
map <Leader>g :Ack
"map <Return> :
set wildignore+=*.pyc,build/*,CACHE/*
set wildmenu
let html_use_css=1
set cot+=menuone
set undodir=~/.vim/undodir/
set undofile
set undolevels=5000
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
set number

"php property notation to array notation
nmap g[ F-2s['ea']
"array notation to property
nmap g> F[2s->f'2x

" decode a single base64 block
nmap g"1 vap!base64 -d
" decode everything that looks like a base64 block
nmap g"2 :g/[0-9A-z/+=]\{76}/norm g"1
" strip trailing line ending crud
nmap gc mp:g/\r$/s///``
" convert email logs
nmap g6 gcmpggg"2`p

"php echo tags to string concatenation
map g' :s/<?\%(php\)\? echo \(.\{-}\); ?>/'. \1 .'/g:noh
"string concatenation to php echo tags
map g< :s/'\. \?\(.\{-}\) \{-}\. \{-}'/<?php echo \1; ?>/g:noh

" 'assert False' on the preceding line
nmap <Leader>a Oassert False

" Ctrl-j/k deletes blank line below/above, and Alt-O/o inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-o> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-O> :set paste<CR>m`O<Esc>``:set nopaste<CR>

noh " stuff gets highlighted when loading this?


nmap <Left> <C-w>h
nmap <Down> <C-w>j
nmap <Right> <C-w>l
nmap <Up> <C-w>k

nmap <S-Left> <C-w>H
nmap <S-Down> <C-w>J
nmap <S-Right> <C-w>L
nmap <S-Up> <C-w>K
let g:gitgrepprg="git\\ grep\\ -n"
let g:gitroot="`git rev-parse --show-cdup`"

function! GitGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep '\\<" . a:args . "\\>' " . g:gitroot
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! GitGrepword()
  normal! "zyiw
  call GitGrep(getreg('z'))
endf
"nmap <C-x><C-x> :call GitGrepword()<CR>

set tags=tags;/
let g:PreviewBrowsers='google-chrome'
let g:PreviewMarkdownExt='markdown,md,mkd,mkdn,mdown,page'

let python_space_error_highlight = 1

" strip trailing whitespace
map gw :%s/\s\+$//:noh

command Wcn w|cn
cnoremap wcn Wcn
vmap <Tab> >gv

call pathogen#infect()

let g:pyflakes_use_quickfix = 0

nmap <Leader>e :CommandTTag<CR>

function! GetCurrentPythonClass()
    call search('^\s*class \ze\S\+\s*(', 'sbe')
    let class = expand('<cword>')
    normal ''
    return class
endfunction

function! GetCurrentPythonMethod()
    call search('^\s*def ', 'sbe')
    let method = expand('<cword>')
    normal ''
    return method
endfunction

function! GetFirstPythonArg()
    call search('^\s*def \S\+(', 'sbe')
    let method = expand('<cword>')
    normal ''
    return method
endfunction

function! GetCurrentPythonArgs()
    let line_number = search('^\s*def[^(]\+([^,]*,\?', 'sbe')
    echo line_number
    let args = matchstr(getline(line_number), '^\s*def[^(]\+([^,]\+,\s*\zs.*\ze):$')
    let args = substitute(args, '\s*=[^,]\+', '', 'g')
    normal ''
    return args
endfunction
