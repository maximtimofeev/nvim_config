" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" vim-plug section
call plug#begin('~/.config/nvim/plugged')

Plug 'neomake/neomake'

" file explorer sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

" colorscheme
Plug 'morhetz/gruvbox'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" linting plugins
Plug 'w0rp/ale'

" go plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" javascript plugins
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'ianks/vim-tsx'

" typescript plugins

call plug#end()

" neomake
call neomake#configure#automake('nrwi', 500)

" js config

" NERDTree
let NERDTreeShowBookMarks=1
let NERDTreeIgnore=['\.git']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerd_tree_tabs_open_on_console_startup=2
let g:nerd_tree_tabs_open_on_new_tab=1

autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType.isTabFree()) | q | endif

" airline
let g:airline#extensions#tabline#enabled=2
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=' '
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
let g:airline_theme='gruvbox'

" ale
let g:ale_javascript_prettier_use_local_config=1
let g:ale_fix_on_save=1
let g:ale_completion_enabled=1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver']
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier']
\}

" key bindings
map <F2> :NERDTreeToggle<CR>

" colorscheme
colorscheme gruvbox
set bg=dark

" indentations
set tabstop=2 shiftwidth=2 expandtab
autocmd FileType * set tabstop=2 shiftwidth=2 expandtab
autocmd FileType c set tabstop=4 shiftwidth=4 expandtab
autocmd FileType make set noexpandtab

" hidden chars
:set listchars=tab:▸␣
:set list

" other
set showmatch
set number
set ignorecase
set smartcase
