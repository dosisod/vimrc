"to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"setup monokai font
syntax on
colorscheme monokai
let g:monokai_term_italic = 0 "dont like italics

"reccommended setting for git gutter
set updatetime=100

"map ; to FZF
map ; :FZF<CR>

"setup indents, file params, ruler, etc
set binary
set noeol
set nowrap
set number relativenumber
set autoindent
set tabstop=4
set softtabstop=4
set showcmd
set wildmenu
set scrolloff=2
set lazyredraw
filetype plugin indent off "disable tab options set by plugins

"changes search functionality/colors
set incsearch
set hlsearch
nnoremap <ESC><ESC> :noh<CR><ESC>

"using F keys switches tabs in all modes
"when switching in insert mode, you stay in insert mode
map <F1> 1gt
map! <F1> <ESC>1gta
map <F2> 2gt
map! <F2> <ESC>2gta
map <F3> 3gt
map! <F3> <ESC>3gta
map <F4> 4gt
map! <F4> <ESC>4gta
map <F5> 5gt
map! <F5> <ESC>5gta
map <F6> 6gt
map! <F6> <ESC>6gta
map <F7> 7gt
map! <F7> <ESC>7gta
map <F8> 8gt
map! <F8> <ESC>8gta
map <F9> 9gt
map! <F9> <ESC>9gta

"add ALT LFT and ALT RIGHT to move one tab left/right
map <M-LEFT> gT
map! <M-LEFT> <ESC>gTa
map <M-RIGHT> gt
map! <M-RIGHT> <ESC>gta

"map :: to opening vimrc (while in vim, alias vimrc to open ~/.vimrc in a bashrc)
map :: :tabf ~/.vimrc<CR>
