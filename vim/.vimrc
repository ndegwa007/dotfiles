set nocompatible
set termguicolors
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline'

set tabstop=2
set shiftwidth=2
set expandtab
set number relativenumber

call vundle#end()
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

autocmd bufwritepost *.js silent !semistandard % --fix
set autoread

"""nerdtree"""
call vundle#begin()
  Plugin 'preservim/nerdtree'
call vundle#end()

"""nerdtree settings"""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"""Exit Vim if NERDTree is the only window remaining in the only tab."""
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"""AUTOcomplete"""
Plugin 'vim-scripts/AutoComplPop'

set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

"""python"""
Plugin 'vim-python/python-syntax'


"""theme"""
Plugin 'catppuccin/vim', { 'as': 'catppuccin' }
set background=dark
colorscheme catppuccin_mocha

