"to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"make using plug easier
map :PI :PlugInstall<CR>
map :PC :PlugClean<CR>
map :PU :PlugUpdate<CR>

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
set shiftwidth=4
set showcmd
set wildmenu
set scrolloff=2
set lazyredraw
filetype plugin indent off "disable tab options set by plugins

"added possible paths for `gf` command
set path=.,templates/,static/,,
set suffixesadd=.py,.html,.js,.min.js

"mark all extra whitespace as bright red
hi Whitespace ctermbg=Red
match Whitespace /^[^\r\n]\t*$/

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

"auto bracket creation (just moves cursor)
inoremap () ()<LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap `` ``<LEFT>
inoremap <> <><LEFT>

"used for jinja2 templates
imap {% {%%}<LEFT><LEFT><SPACE><SPACE>
imap {{ {}{}<SPACE><SPACE>

"space space will add 2 spaces and move cursor over one
inoremap <SPACE><SPACE> <SPACE><SPACE><LEFT>

"auto block creation
inoremap (<CR> (<CR><CR>)<UP><TAB>
inoremap [<CR> [<CR><CR>]<UP><TAB>
inoremap {<CR> {<CR><CR>}<UP><TAB>

"maps for if/elseif/else auto complete, 9 is easier to type then (
imap if9 if<SPACE>(<RIGHT>)<SPACE>{<CR><UP><END><LEFT><LEFT><LEFT>
imap elseif9 else if9
imap else9 else<SPACE>{<CR>

"in python, auto indent after :<CR>
inoremap :<CR> :<CR><TAB>

"makes quiting easier
map :qq :q!<CR>
map :Q :qa!<CR>
map :WQ :wq<CR>
map :Wq :wq<CR>
map :wQ :wq<CR>
map :W :w<CR>

"enter works like J and backspace works like H, make them drop into insert mode instead
map <BS> i<BS>
map <CR> i<CR>
