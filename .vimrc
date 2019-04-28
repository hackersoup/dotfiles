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
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on
"""

set mouse=a
set number
set hidden
set cursorline
syntax on
set background=dark
colorscheme Monokai
set autoindent
" Number of spaces a tab counts as "
set tabstop=8
" Number of spaces for autoindent (>> and <<). When zero, tabstop will be used "
set shiftwidth=0
" Use appropriate number of spaces for a tab or not "
set noexpandtab
set backspace=2
set textwidth=0

" Status bar always on
set laststatus=2

""""""" Keybindings
let mapleader=","
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>ntt :NERDTreeToggle<CR>
nnoremap <Leader>m :bprev<CR>
nnoremap <Leader>. :bnext<CR>
nnoremap <Leader>q :bp <BAR> bd #<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>rn :call ToggleRelativeNumber()<CR>
nnoremap <Leader>p :CtrlPTag<CR>
cmap w!! w !sudo tee > /dev/null %

" Airline
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe
let g:ycm_rust_src_path = '/Users/bradcampbell/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
