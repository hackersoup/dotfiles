" Vim-Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins go here
call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'           " The Vundle plugin manager. "
Plug 'jiangmiao/auto-pairs'           " Automatically pairs brackets and quotes. "
Plug 'majutsushi/tagbar'              " Uses ctags to display file tokens. "
Plug 'scrooloose/nerdtree'            " Sidebar file browser that is epic. "
Plug 'Xuyuanp/nerdtree-git-plugin'    " | Shows git info in nerdtree. Because its epic. "
Plug 'vim-airline/vim-airline'        " Prettifies statusbar and tab bar. "
Plug 'airblade/vim-gitgutter'         " Displays git status info in the gutterbar. "
Plug 'flazz/vim-colorschemes'         " A boatload of amazing colorschemes. "
"Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
" Plug 'rust-lang/rust.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'mhinz/vim-startify'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
call plug#end()

set mouse=a
set number
set hidden
set cursorline
syntax on
set background=dark
colorscheme Monokai
set autoindent
" Number of spaces a tab counts as
set tabstop=4
" Number of spaces for autoindent (>> and <<). When zero, tabstop will be used
set shiftwidth=0
" Use appropriate number of spaces for a tab or not "
set expandtab
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

" YouCompleteMe
let g:ycm_rust_src_path = '/Users/bradcampbell/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

" Markdown
let g:vim_markdown_folding_style_pythonic = 1

" NeoVim config options
let g:python3_host_prog = '/usr/local/bin/python3'

" Deoplete
let g:deoplete#enable_at_startup = 1
