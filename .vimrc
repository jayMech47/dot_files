"-- Vundle required
set nocompatible
filetype off

let mapleader = " "

"TODO: make windows compatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"-- Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on
"-- end vundle

"-- Appearance
set number
"Block and insert cursors
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

syntax enable
set background=dark
colorscheme solarized
"-- end Appearance

"Remove Ding!
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set autoindent

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"Cursor movement improvement
inoremap j gj
nnoremap j gj
inoremap k gk
nnoremap k gk


