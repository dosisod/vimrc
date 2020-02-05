"to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-surround'

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

"map <SPACE> to FZF
nnoremap <SPACE> :FZF<CR>

"enable when using base16 fonts
"let base16colorspace=16

"bufferline settings
let g:bufferline_active_buffer_left='['
let g:bufferline_active_buffer_right=']'
let g:bufferline_active_highlight='Search'
let g:bufferline_rotate=1
let g:bufferline_fixed_index=0
let g:bufferline_separator=' '

"fixes bufferline breaking when too long
set noruler

autocmd BufNewFile,BufRead *.ts set syntax=javascript

"setup splits
set splitbelow
set splitright

"setup indents, file params, etc
set nocompatible
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

"add clipboard capabilities if available
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

"added possible paths for `gf` command
set path=.,templates/,static/,,
set suffixesadd=.py,.html,.js,.min.js

"changes search functionality/colors
set incsearch
set hlsearch

"whitespace highlighters
hi NoWhitespace term=standout cterm=standout ctermfg=196 ctermbg=234
hi SpecialKey term=bold ctermfg=237
match noWhitespace '\s\+$'
set listchars=tab:→\ 
set list

"automatically disable cursorline and highlighting with ESC ESC
nnoremap <ESC><ESC> :set nocursorline<CR>:noh<CR><ESC>

"automatically enable cursor line when searching for something
nnoremap / :set cursorline<CR>/
nnoremap ? :set cursorline<CR>?
nnoremap n :set cursorline<CR>n
nnoremap N :set cursorline<CR>N

map :tabmm<CR> :tabm 0<CR>

"using F keys switches tabs in all modes
"when switching in insert mode, you stay in insert mode
map <F1> :b1<CR>
map! <F1> <ESC>:b1<CR>a
map <F2> :b2<CR>
map! <F2> <ESC>:b2<CR>a
map <F3> :b3<CR>
map! <F3> <ESC>:b3<CR>a
map <F4> :b4<CR>
map! <F4> <ESC>:b4<CR>a
map <F5> :b5<CR>
map! <F5> <ESC>:b5<CR>a
map <F6> :b6<CR>
map! <F6> <ESC>:b6<CR>a
map <F7> :b7<CR>
map! <F7> <ESC>:b7<CR>a
map <F8> :b8<CR>
map! <F8> <ESC>:b8<CR>a
map <F9> :b9<CR>
map! <F9> <ESC>:b9<CR>a

"ALT LEFT and ALT RIGHT to move one tab left/right
map <M-LEFT> gT
map! <M-LEFT> <ESC>gTa
map <M-RIGHT> gt
map! <M-RIGHT> <ESC>gta

"ALT UP and ALT DOWN to switch up and down buffers
map <M-UP> :bp<CR>
map! <M-UP> <ESC>:bp<CR>a
map <M-DOWN> :bn<CR>
map! <M-DOWN> <ESC>:bn<CR>a

"makes :EE open a replace current buffer with different one
map :EE<CR> :enew\|bd#<CR>

"map :: to opening vimrc while in vim (do `alias vimrc="vim ~/.vimrc"` in your .bashrc as well)
"~~ opens bashrc
map :: :tabf ~/.vimrc<CR>
map ~~ :tabf ~/.bashrc<CR>

"auto bracket creation (just moves cursor)
"inoremap () ()<LEFT>
"inoremap [] []<LEFT>
"inoremap {} {}<LEFT>
"inoremap '' ''<LEFT>
"inoremap "" ""<LEFT>
"inoremap `` ``<LEFT>
"inoremap <> <><LEFT>
"inoremap ~~ ``````<LEFT><LEFT><LEFT>

"used for jinja2 templates
inoremap {% {%%}<LEFT><LEFT><SPACE><LEFT><SPACE>
inoremap {{ {{}}<LEFT><LEFT><SPACE><LEFT><SPACE>

"space space will add 2 spaces and move cursor over one
"inoremap <SPACE><SPACE> <SPACE><SPACE><LEFT>

"auto block creation
inoremap {<CR> {<CR><TAB><END><CR><BS>}<ESC>kI
inoremap (<CR> (<CR><TAB><END><CR><BS>)<ESC>kI
inoremap [<CR> [<CR><TAB><END><CR><BS>]<ESC>kI

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

"make deleting things easier
nnoremap :D<CR> :%d<CR>

"make it so text deletion at EOL in v mode is cut correctly
vnoremap <expr> d col(".") == col("$")-1 ? "yd$" : "d"

"enter works like J and backspace works like H, make them drop into insert mode instead
noremap <BS> i<BS>
noremap <expr> <CR> col(".") == col("$")-1 ? "o" : "i<CR>"

"marking m (mm) allows for jumping to last mark easy (``)
nnoremap `` `m

"hitting tab when in normal/command mode will insert a tab at the start of the line
noremap <TAB> I<TAB><ESC>
noremap <S-TAB> <<

"make centering buffer easier
inoremap zzz <ESC>zza

"switch between buffers easily
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <silent> <C-S-LEFT> <C-W><
nnoremap <silent> <C-S-RIGHT> <C-W>>
nnoremap <silent> <C-S-UP> <C-W>+
nnoremap <silent> <C-S-DOWN> <C-W>-

"hitting K instead of k is annoying
map K k

"makes sourcing vimrc easier
nnoremap :S<CR> :source ~/.vimrc<CR>

cabbrev spaces set tabstop=8 shiftwidth=4 softtabstop=4

"hitting j/k at top and bottom of buffer goes to EOL or SOL
nnoremap <expr> j (line(".")==line("$")) ? "$" : "j"
inoremap <expr> <DOWN> (line(".")==line("$")) ? "<END>" : "<DOWN>"
nnoremap <expr> k (line(".")==1) ? "^" : "k"
inoremap <expr> <UP> (line(".")==1) ? "<HOME>" : "<UP>"

inoremap <expr> <LEFT> (col(".")==1) ? "<UP><END>" : "<LEFT>"
inoremap <expr> <RIGHT> (col(".")==col("$")) ? "<DOWN><HOME>" : "<RIGHT>"

"bad habbits
map <UP> <nop>
map <DOWN> <nop>
map <LEFT> <nop>
map <RIGHT> <nop>