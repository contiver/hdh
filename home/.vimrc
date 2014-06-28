set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " alternatively, pass a path where Vundle should install plugins
" "let path = '~/some/path/here'
" "call vundle#rc(path)

 " let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdtree'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'nathanaelkane/vim-indent-guides'

"----------------
filetype plugin indent on     " required
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

let g:clang_use_library = 1
let g:clang_complete_auto = 1
let g:clang_auto_select = 1
set completeopt-=preview

"Airline settings
set laststatus=2

syntax on
if &t_Co < 256
    colorscheme miro8
else
    colorscheme miromiro
endif

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab


let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd ctermbg=gray
hi IndentGuidesEven ctermbg=darkgray


" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
    set t_ut=
endif

set noswapfile
set showtabline=2
set backspace=2
set number
set hidden
set wildmenu
set showcmd
set hlsearch
set autoindent
set visualbell

" html settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2
let g:html_indent_inctags = "html,body,head,tbody"
