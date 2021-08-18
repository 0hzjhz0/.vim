" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible   " 不兼容 Vi
filetype on
filetype indent on " 开启文件类型检查
filetype plugin on
filetype plugin indent on
set mouse=a        " 支持鼠标
set encoding=utf-8
set clipboard=unnamed
set showmode       " 显示模式

" Prevent incorrect backgroud rendering in st
" let &t_ut=''      
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" === 
" === Main code display
" ===
set number         " 显示行号
set relativenumber " 显示相对行号
set ruler          " 状态栏显示光标的位置
set cursorline     " 光标所在行高亮
syntax enable
syntax on          " 语法高亮
set linebreak      " 不在单词内部发生折行

" ===
" === Editor behavior
" ===
" Better tab
set expandtab      " 将Tab键转为空格 
set tabstop=2      " 按下Tab键，Vim显示的空格数
set shiftwidth=2   " 在文本上按下>>,<<,==(增减一级缩进，取消缩进)时，每级字符数
set softtabstop=2  " Tab键转为几个空格
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5    " 垂直滚动时，光标句顶部/底部的位置

" Prevent auto line split
set wrap           " 自动折行
set tw=0           " 设置行宽，一行显示几个字符 

set indentexpr=
" Beter backspace
set backspace=indent,eol,start

set foldmethod=indent  " 代码折叠方式：缩进
set foldlevel=99

" Cursor style in st
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2   " 显示状态栏(0,1,2)
set autochdir      " 自动切换工作目录
set showcmd        " 显示输入的命令
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc 
set wildmenu       " 命令模式下tab键自动补全，第二次Tab键选择匹配结果
set wildmode=longest,list,full

set autoindent     " 回车后下一行缩进和上一行保持一致

" Searching options
set hlsearch       " 搜索时，高亮显示匹配结果
exec "nohlsearch"
set incsearch      " 没输入一个字符就自动跳到第一个匹配的结果
set ignorecase     " 搜索时忽略大小写
set smartcase      " 
set noshowmatch    " 自动匹配括号引号等字符

" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
let mapleader=" "

" Cursor backward <C-o>, forward <C-i>

" Column (:) mods
map ; :
map q;  q:        " 显示历史命令记录
map <LEADER>/ :!
map <LEADER>R :r !
map <LEADER>sr :%s/

" Disabling the default s key
map s <nop>       " 屏蔽s

" Save & quit
map Q :q<CR>
map S :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz      " 下一条搜索结果zz表示让其处于屏幕中心"===
noremap - Nzz      " 上一条搜索结果"=== 普通模式下键位映射


" Duplicate words
map <LEADER>fc /\(\<\w\+\>\)\_s*\1

" Others
map <LEADER>o o<Esc>k

" ===
" === Cursor Movement 
" ===

map R :source $MYVIMRC<CR>


"===
"=== Window management
"===
" Using <space> + new arrow keys for moving the cursor around windows
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

" split the screens to up(horizontal), down(horizontal), left(vertical), right(vertical)
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tk
map tk :tabe<CR>
" Move around tabs with th and tl
map th :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmh and tml
map tmh :-tabmove<CR>
map tml :+tabmove<CR>

" ===
" === Other useful stuff
" ===

" Press space twice to jumpy to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Compile function



"===
"=== Install Plugins with Vim-Plug
"===
call plug#begin('~/.vim/plugged')

" Pretty dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'itchyny/vim-cursorword'
" Plug 'tmhedberg/SimpylFold'

" Git
" Plug 'rhysd/conflict-marker.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
" Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Bookmarks
" Plug 'kshenoy/vim-signature'

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'fadein/vim-FIGlet'

call plug#end()

"===
"=== dress op my vim
"===
set termguicolors             " enable true color support
let ayucolor="light"          " for light version of theme
" let ayucolor="mirage"       " for mirage version of theme
" let ayucolor="dark"         " for dark version of theme
" colorscheme snazzy
let g:SnazzyTransparent=0   " 设置透明效果0/1
set background=dark
let g:airline_theme='base16_dracula'

let g:lightline = {
\     'active': {
\         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
\     }
\ }


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

