set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
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
Bundle 'scrooloose/syntastic.git'
Bundle 'kana/vim-filetype-haskell'

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

filetype plugin on
let g:clang_use_library = 1
let g:clang_complete_auto = 1
let g:clang_auto_select = 1
set completeopt-=preview

"Airline settings
set laststatus=2
let g:airline_powerline_fonts=1

" Colorscheme
syntax on
if &t_Co < 256
    colorscheme miro8
else
    colorscheme miromiro
endif

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
    set t_ut=
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
set encoding=utf-8
set fileencoding=utf-8

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd ctermbg=darkgray
hi IndentGuidesEven ctermbg=black

set noswapfile
set showtabline=2
set backspace=2
set number
set hidden
set wildmenu
set showcmd
set hlsearch
set incsearch
set autoindent
set visualbell

" Function to remove trailing spaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
