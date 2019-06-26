" 参考博客 http://www.ruanyifeng.com/blog/2018/09/vimrc.html
" 默认的 Vim 配置参考 /etc/vim/vimrc 或者 /etc/vimrc，本文件是用户配置

syntax on           " 语法高亮

set showmode        " 底部显示 vim 模式
set showcmd         " 命令模式下，显示键入的指令
set number          " 显示行号
set ruler           " 显示标尺
set cursorline      " 下划线

set shiftwidth=4    " 设定 <<（增加一级缩进）、>>（取消一级缩进）、==（取消全部缩进） 命令移动时的宽度为 4
set tabstop=4       " Tab 键的长度为 4 个空格
set softtabstop=4   " 用 4 个空格直接代替 Tab
set autoindent      " 自动缩进
set expandtab       " 自动把 Tab 转为空格
set tw=100          " 字符超过 100 个有颜色提示

set nocompatible    " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
set backspace=indent,eol,start  " 定义删除键
set scrolloff=5     " 光标移动到顶部或者底部时，保持几行距离
set history=10000   " 历史命令记录条数
set mouse=v         " 设置 vim 下可以拷贝到 clipboard

set autochdir       " 自动把工作目录切换到当前编辑的文件下
set autoread        " 打开文件监视，如果编辑过程发生外部改变（被别的编辑器修改），就会发出提示

set hlsearch        " 高亮检索结果
set incsearch       " 检索时每输入一个字符，就自动跳到第一个匹配的结果

"set nobackup        " 不备份，备份文件是在原文件的末尾加上一个波浪号
"set noswapfile     " 不创建交换文件
set undofile        " 保留撤销历史，即使文件已经被关闭和再次打开

" 自动缩进
filetype indent on

" vim 主题
colorscheme desert
" colorscheme solarized

" 中文编码相关
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
""set termencoding=gb18030
""set encoding=cp936

" 设置备份文件、交换文件、操作历史文件的保存位置
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
set undodir=~/.vim/.undo//

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set list
set listchars=tab:>-,trail:~

" 命令模式下的 Tab 自动补全（貌似不起作用）
set wildmenu
set wildmode=longest:list,full

" 自动补全
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" 重新打开文件时，记住上次编辑的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 状态栏，让编辑器底部显示编辑的文件名
set laststatus=2
set statusline=%{fnamemodify(resolve(expand('%:p')),':~')}\ %*

" Vundle 插件
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" end of Vundle 插件


" for lightline
if !has('gui_running')
  set t_Co=256
endif

"YouCompleteMe
let g:ycm_path_to_python_interpreter = '/home/zhangxiaobin/python3/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
