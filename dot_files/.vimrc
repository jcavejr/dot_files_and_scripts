set tabstop=4
set expandtab
set number
set background=dark
set cursorline
set wildmenu
set incsearch
set hlsearch
set clipboard=unnamed
syntax on
let g:netrw_lifestyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
