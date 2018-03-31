"
" Vundle setup
"

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" End of Vundle section
"

" highlight code after 80 characters
set colorcolumn=80

" highlight search
set hlsearch

" Show trailing whitespace:
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/

" eliminate delay when press Esc in insert mode
set timeoutlen=1000
set ttimeoutlen=10

" split direction
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move shortcuts
nnoremap <C-i> :m .+1<CR>==
nnoremap <C-u> :m .-2<CR>==
" inoremap <C-i> <Esc>:m .+1<CR>==gi
" inoremap <C-u> <Esc>:m .-2<CR>==gi
vnoremap <C-i> :m '>+1<CR>gv=gv
vnoremap <C-u> :m '<-2<CR>gv=gv

" commenting python code
nnoremap <C-_> :s/^/#/<CR>:noh<CR>
nnoremap <C-\> :s/^#//<CR>:noh<CR>
vnoremap <C-_> :s/^/#/<CR>:noh<CR>
vnoremap <C-\> :s/^#//<CR>:noh<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" enable seeing docstring in folded state
let g:SimpylFold_docstring_preview=1

" tabs settings, PEP8
au BufNewFile,BufRead *.py 
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" tabs settings for another file types
au BufNewFile,BufRead *.js,*.jsx,*.json,*.tex,*.html,*.css,*.cpp
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab

" flagging unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" make space a leader button
let mapleader="\<Space>"

" autocomplete features
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" syntax highlight
let python_highlight_all=1
syntax on

" color schemes
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"colorscheme zenburn

" ignore file types in NERDTree
let NERDTreeIgnore=[
    \ '\.pyc$',
    \ '\~$',
    \ '__pycache__$[[dir]]',
    \ '.git$[[dir]]',
    \ '\.swp'
    \ ]
let NERDTreeShowHidden=1

" NERDTree settings

" start NERDTree automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" keymap for opening NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fance arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" line numbering
set nu

" system clipboard
set clipboard=unnamed

" always show status line
set laststatus=2

" turn off syntastic on start
let g:syntastic_check_on_open = 0

" set passive mode for sytastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
