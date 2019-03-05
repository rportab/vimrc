"General
""""""""
"enable filetype plugins
filetype plugin on
filetype indent on

":W sudo saves the file
command W w !sudo tee % > /dev/null

"User interface
"""""""""""""""
"Always show current position
set ruler

"Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Smart case when searching
set smartcase

"Highlight search results
set hlsearch

"Incremental search
set incsearch

"Show matching brackets
set showmatch

"Colors and fonts
"""""""""""""""""
"Enable syntax highlighting
syntax enable

"Text options
"""""""""""""
"Use spaces instead of tabs
set expandtab

"Smart tabs
set smarttab

"Tab width
set shiftwidth=4
set tabstop=4

"Linebreak at 120
set lbr
set tw=120

set ai
set si
set wrap

"Visual
"""""""
"Switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Status line
""""""""""""
"Always show status line
set laststatus=2

"Mappings
"""""""""
"Delete trailing white space
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.js,*.py,*.wiki,*.sh,*.coffee,*.java :call CleanExtraSpaces()
endif

"Cut and paste
"""""""""""""""
imap <C-a> <ESC>ggVG
vmap <C-c> "+yi
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
