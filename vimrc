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
set noexpandtab    " 不将Tab键转为空格 
set tabstop=4      " 按下Tab键，Vim显示的空格数
set shiftwidth=4   " 在文本上按下>>,<<,==(增减一级缩进，取消缩进)时，每级字符数
set softtabstop=4  " Tab键转为几个空格
set list
" set listchars=tab:▸\ ,trail:▫
set listchars=tab:\|\ ,trail:▫
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

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.vim/vimrc<CR>

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
map ; :
map q;  q:        " 显示历史命令记录

" Cursor backward <C-o>, forward <C-i>

" Save & quit
map Q :q<CR>
map S :w<CR>
map s <nop>       " 屏蔽s
map R :source $MYVIMRC<CR>


" Copy to system clipboard
vnoremap Y "+y

" Indentation in normal mode
nnoremap < <<
nnoremap > >>

" Search in normal mode
noremap <LEADER><CR> :nohlsearch<CR>  " 取消高亮
noremap = nzz      " 下一条搜索结果zz表示让其处于屏幕中心"===
noremap - Nzz      " 上一条搜索结果"=== 普通模式下键位映射


" Duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

map <LEADER>o o<Esc>k       " 插入空白行


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

" 打开terminal
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>



"===
"=== Install Plugins with Vim-Plug
"===
call plug#begin('~/.vim/plugged')

" Pretty dress
Plug 'ajmwagar/vim-deus'
Plug 'bling/vim-bufferline'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" General Highlighter
Plug 'RRethy/vim-illuminate'
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }


" Auto Complete
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Snippets


" Undo Tree
Plug 'mbbill/undotree/'


" Git
" Plug 'rhysd/conflict-marker.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
" Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Plug 'kshenoy/vim-signature'

" Editor Enhancement
Plug 'Yggdroot/indentLine'


" Other visual enhancement
Plug 'luochen1990/rainbow'

call plug#end()

"===
"=== dress op my vim
"===
set termguicolors             " enable true color support
" set background=dark

colorscheme deus

hi NonText ctermfg=gray guifg=grey10
" hi SpecialKey ctermfg=black guifg=grey0
" set linespace=12
" =================== 开始设置插件 ==================

" ===
" === vim-airline
" ===
let g:airline_powerline_fonts = 0
let g:airline_theme='dracula'
"let g:airline_theme='base16_dracula'

" Show buffers count
let g:airline#extensions#tabline#buffer_nr_show=1

" ===
" === indentLine
" ===
let g:indentLine_enabled = 0
"let g:indentLine_color_term = 1

" ===
" === NERDTree
" ===


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ================= 结束设置插件 ====================

" ===
" === Terminal Colors
" ===

let g:terminal_color_0 = '#000000'
let g:terminal_color_1 = '#FF5555'
let g:terminal_color_2 = '#50FA7B'
let g:terminal_color_3 = '#F1FA8C'
let g:terminal_color_4 = '#BD93F9'
let g:terminal_color_5 = '#FF79C6'
let g:terminal_color_6 = '#8BE9FD'
let g:terminal_color_7 = '#BFBFBF'
let g:terminal_color_8 = '#4D4D4D'
let g:terminal_color_9 = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Necessary Commands to Execute
" ===
" exec "nohlsearch"
