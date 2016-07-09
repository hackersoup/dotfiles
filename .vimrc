" Vundle stuff "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins "
Plugin 'VundleVim/Vundle.vim'     " Required by Vundle "
Plugin 'tpope/vim-fugitive'       " Git wrapper "
Plugin 'jiangmiao/auto-pairs'     " Auto-insert matching braces "
Plugin 'majutsushi/tagbar'        " Shows and interacts with ctags files "
Plugin 'altercation/vim-colors-solarized'  " Colorscheme for solarized "
Plugin 'fatih/vim-go'             " Development env for Go "
Plugin 'airblade/vim-gitgutter'   " Shows git gutter info "
Plugin 'Shougo/neocomplete.vim'   " Autocompletion engine "

call vundle#end()
filetype plugin indent on

set number                        "Line numbers"
syntax on                         "File syntax"
set expandtab                     "Use number of spaces instead of \t"
set shiftwidth=2                  ""
set tabstop=2                     "Number of spaces to use for tabs"
match ErrorMsg '\s\+$'            "Highlight trailing whitespace"
set autoindent                    "Carry over leading tabs to the next line"
set colorcolumn=80                "Set a column of color"
set laststatus=2                  "All windows have status"
set relativenumber                "Line numbers relative to cursor"
set backspace=2                   "TODO"
set cryptmethod=blowfish2         "Encryption method to be used for files"
set mouse=a                       "Enables mouse usage"
set completeopt-=preview

" Custom mappings
let mapleader=","
nnoremap <Leader>tt :TagbarToggle<CR>

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

""""""" Solarized """"""
"let g:solarized_termcolors=16
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
"set background=light
set background=dark
colorscheme solarized
"""""""

"Buffers
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>


""" GoTags """"""
let g:tagbar_type_go = {'ctagstype': 'go', 'kinds' : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'], 'sro' : '.', 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype'}, 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' }, 'ctagsbin'  : 'gotags', 'ctagsargs' : '-sort -silent' }
