"to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

"make using plug easier
map :PI :PlugInstall
map :PC :PlugClean
map :PU :PlugUpdate

"setup monokai font
syntax on
colorscheme monokai
let g:monokai_term_italic = 0 "dont like italics

"reccommended setting for git gutter
set updatetime=100

"map ; to FZF
map ; :FZF<CR>

"enable when using base16 fonts
let base16colorspace=16

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
" `` opens bashrc
map :: :tabf ~/.vimrc<CR>
map `` :tabf ~/.bashrc<CR>

"auto bracket creation (just moves cursor)
inoremap () ()<LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap `` ``<LEFT>
inoremap <> <><LEFT>
inoremap ~~ ``````<LEFT><LEFT><LEFT>

"used for jinja2 templates
imap {% {%%}<LEFT><LEFT><SPACE><SPACE>
imap {{ {}{}<SPACE><SPACE>

"space space will add 2 spaces and move cursor over one
inoremap <SPACE><SPACE> <SPACE><SPACE><LEFT>

"auto block creation
inoremap (<CR> (<CR>)<ESC>O<TAB>
inoremap [<CR> [<CR>]<ESC>O<TAB>
inoremap {<CR> {<CR>}<ESC>O<TAB>

"auto close bracket
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

imap #I<SPACE> #include<SPACE>
imap #I<<SPACE> #include<SPACE><>
imap #I"<SPACE> #include<SPACE>""
iabbrev MM <<

"maps for if/elseif/else auto complete, 9 is easier to type then (
imap if9 if<SPACE>(<RIGHT>)<SPACE>{<CR><UP><END><LEFT><LEFT><LEFT>
imap elseif9 else if9
imap elif9 else if9
imap else9 else<SPACE>{<CR>

"in python, auto indent after :<CR>
inoremap :<CR> :<CR><TAB>

"below copied from:
"https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"https://github.com/maralla/completor.vim
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"makes saving easier
"requires putting: "stty -ixon" into bashrc
imap <C-S> <ESC>:w<CR>
map <C-S> :w<CR>

"makes quiting easier
map :qq :q!<CR>
map :Q :qa!<CR>
map :WQ :wq<CR>
map :Wq :wq<CR>
map :wQ :wq<CR>
map :W :w<CR>

"allows for shift+home like capabilities
inoremap <A-HOME> <ESC>v<HOME>
map <A-HOME> v<HOME>
inoremap <A-END> <ESC>v<END>
map <A-END> v<END>

"make it so text deletion at EOL in v mode is cut correctly
vnoremap <expr> d col(".") == col("$")-1 ? "yd$" : "d"

"enter works like J and backspace works like H, make them drop into insert mode instead
noremap <BS> i<BS>
noremap <expr> <CR> col(".") == col("$")-1 ? "o" : "i<CR>"

"hitting tab when in normal/command mode will insert a tab at the start of the line
noremap <TAB> I<TAB><ESC>
noremap <S-TAB> <<

"switch between buffers easily
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

"bad habbits
map <UP> <nop>
map <DOWN> <nop>
map <LEFT> <nop>
map <RIGHT> <nop>
