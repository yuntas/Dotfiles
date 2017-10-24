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
set nocompatible
set backspace=indent,eol,start

"build command
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %

"NERDTree
let NERDTreeWinSize=15

"japanese
set ambiwidth=double
set nowrap

filetype on
autocmd FileType python setl autoindent textwidth=99
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4

syntax on

set wildmenu
set history=9999

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" dein setting
if &compatible
  set nocompatible
endif

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_path)
        execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_path
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

if dein#load_state(s:dein_path)
    call dein#begin(s:dein_path)

    let g:config_dir    = expand('~/.vim/dein/userconfig')
    let s:toml          = g:config_dir . '/plugin.toml'
    let s:lazy_toml     = g:config_dir . '/plugin_lazy.toml'
    
    call dein#load_toml(s:toml,          {'lazy': 0})
    call dein#load_toml(s:lazy_toml,     {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

"neosnippet setting
let g:neosnippet#snippets_directory='~/.vim/my_snippet'
imap <expr><TAB>
    \ pumvisible() ? "<C-n>" :
    \ neosnippet#expandable_pr_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
noremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" color
colorscheme molokai
let g:molokai_original = 1
set t_Co=256
set laststatus=2


python << EOF
import os
import sys
home = os.path.expanduser('~')
path = home + "/.pyenv/versions/anaconda3-4.4.0/envs/"
os.chdir(path)
for i in os.listdir(path):
    path2 = path + i + '/'
    if not path2 in sys.path:
        sys.path.insert(0, path2)
EOF
