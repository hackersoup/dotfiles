function! ToggleRelativeNumber()
    " Toggles the relativenumber setting
    if &relativenumber
        set relativenumber!
    else
        set relativenumber
    endif
endfunction

""" Vundle happiness
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins go here
Plugin 'VundleVim/Vundle.vim'           " The Vundle plugin manager. "
Plugin 'jiangmiao/auto-pairs'           " Automatically pairs brackets and quotes. "
Plugin 'majutsushi/tagbar'              " Uses ctags to display file tokens. "
Plugin 'scrooloose/nerdtree'            " Sidebar file browser that is epic. "
Plugin 'Xuyuanp/nerdtree-git-plugin'    " | Shows git info in nerdtree. Because its epic. "
Plugin 'vim-airline/vim-airline'        " Prettifies statusbar and tab bar. "
Plugin 'airblade/vim-gitgutter'         " Displays git status info in the gutterbar. "
Plugin 'flazz/vim-colorschemes'         " A boatload of amazing colorschemes. "
Plugin 'Shougo/neocomplete'             " Autocompletion engine "
Plugin 'faith/vim-go'                   " Turns vim into Golang IDE :) "

call vundle#end()
filetype plugin indent on
"""

set mouse=a
set number
set cursorline
set relativenumber
set list
setlocal lcs=tab:▸\ ,trail:_
syntax on
colorscheme solarized
set autoindent
set tabstop=4
set shiftwidth=0
set expandtab
set backspace=2
set textwidth=0

" Status bar always on
set laststatus=2

""" Keybindings
let mapleader=","
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>m :tabp<CR>
nnoremap <Leader>. :tabn<CR>
nnoremap <Leader>rn :call ToggleRelativeNumber()<CR>
"""

""""""" vim-go """"""
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"""""""

""""""" neocomplete """"""
let g:neocomplete#enable_at_startup = 1
"""""""

" Airline
let g:airline_powerline_fonts = 1

" Show syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '>trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
