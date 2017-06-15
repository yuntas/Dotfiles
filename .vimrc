set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac

set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

set incsearch
set ignorecase
set smartcase
set hlsearch
autocmd InsertLeave * set nopaste

set number
set cursorline
set showmatch

"build command
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %


"japanese
set ambiwidth=double
set nowrap

filetype on
autocmd FileType python setl autoindent textwidth=99
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4

syntax on

set wildmenu
set history=5000

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>


let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('vim-scripts/dbext.vim')
call dein#add('cohama/lexima.vim')
call dein#add('tomasr/molokai')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('Shougo/neosnippet.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
noremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : “<CR>”
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

colorscheme molokai
let g:molokai_original = 1
set t_Co=256
set laststatus=2
