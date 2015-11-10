" Initiate
    set nocompatible " http://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
    set shell=/bin/sh
    filetype off
"

" LoadVundle
    set rtp+=~/.vim/bundle/vundle
    call vundle#begin()

    " older versions of vundle used Bundle instead of Plugin
    Plugin 'gmarik/vundle' " let Vundle manage Vundle

    Plugin 'tmhedberg/SimpylFold'
    let g:SimpylFold_docstring_preview=1
    Plugin 'vim-scripts/indentpython.vim'

    Plugin 'jiangmiao/auto-pairs' 

    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_completion=1
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

    Plugin 'nvie/vim-flake8'
    let python_highlight_all=1

    Plugin 'fisadev/fisa-vim-colorscheme'
    Plugin 'tomasr/molokai'
    let g:molokai_original = 1
    let g:rehash256 = 1
    Plugin 'altercation/vim-colors-solarized'

    Plugin 'scrooloose/nerdtree'
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeQuitOnOpen=1
    let NERDTreeChDirMode=0
    let NERDTreeShowBookmarks=1
    let NERDTreeShowHidden=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swp$', '\.git']

    Plugin 'jmcantrell/vim-virtualenv'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'kien/ctrlp.vim'
    let g:ctrlp_map = '<c-t>'


    Plugin 'bling/vim-airline'
    set laststatus=2
    let g:airline_theme = 'molokai'
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#tabline#enabled = 1

    " JavaScript
    Plugin 'elzr/vim-json'
    Plugin 'groenewege/vim-less'
    Plugin 'pangloss/vim-javascript'


    " HTML CSS
    Plugin 'amirh/HTML-AutoCloseTag'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'othree/html5.vim'
    " Zen Coding
    Plugin 'mattn/emmet-vim'
    let g:user_emmet_leader_key='<C-Q>'


    " All of your Plugins must be added before the following line
    call vundle#end()
"

" General
    filetype plugin indent on
    syntax on
    set fileencodings=utf-8,gbk
    set tabstop=4 " An indentation every four columns
    set softtabstop=4 " Let backspace delete indent
    set shiftwidth=4
    set expandtab
    set autoindent
    set fileformat=unix
    set ruler
    set wrap
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set expandtab " Tabs are spaces, not tabs
    set autoindent  " Indent at the same level of the previous line
    
    set noswapfile
    set autoread " 文件变化时可以实时刷新
    set clipboard=unnamed " Cut, copy, and/or paste to/from other applications outside of VIM


    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    set omnifunc=syntaxcomplete#Complete " omni-complete
"

" SplitWindow
    set splitright " Puts new vsplit windows to the right of the current
    set splitbelow " Puts new split windows to the bottom of the current

    "split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
"

" Folding
    " Enable folding
    set foldmethod=indent
    set foldlevel=99

    " Enable folding with the spacebar
    nnoremap <space> za
"

" vim UI
    set background=dark
    let &t_Co = 256 " Need this to render the color well in my machine
    syntax enable
    colorscheme molokai
    "colorscheme solarized

    set backspace=indent,eol,start  " 保证退格键可以正常工作
                                    " Solved backspace problem on Vim 7.4 (homebrew made on Mac OS X)
                                    " allow backspacing over everything in insert mode
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set incsearch " Find as you type search
    set hlsearch " Highlight search terms
    set linespace=0
    set number " Line numbers on
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set cursorline
    set showmode
    set title
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    set scrolloff=3                 " Minimum lines to keep above and below cursor
"


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" Key Mappings
    " Rewrite Shift-Arrow keys to have IDE style auto start highlight with shift key
    nnoremap <S-Up> vk
    nnoremap <S-Down> vj
    nnoremap <S-Left> vh
    nnoremap <S-Right> vl
    vnoremap <S-Up> k
    vnoremap <S-Down> j
    vnoremap <S-Left> h
    vnoremap <S-Right> l

    " Stupid shift key fixes
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif
    nnoremap ,gd :!git diff %<CR>
    nnoremap ,gl :!git log %<CR>
    nnoremap ,gb :!git blame %<CR>
    nnoremap ,pyf :!pyflakes %<CR>


"



