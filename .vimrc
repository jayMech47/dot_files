set number

"Ding!
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set autoindent
syntax enable
set background=dark
colorscheme solarized

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
