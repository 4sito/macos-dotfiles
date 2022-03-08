set nocompatible              " be iMproved, required
filetype on                   " required

call plug#begin()

Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'

" lightline configuration

let g:lightline = {
      \'colorscheme': 'wombat',
      \ }

let g:lightline.active = {
                    \ 'left': [ [ 'mode', 'paste' ],
                    \           [ 'readonly', 'absolutepath', 'modified' ] ],
                    \ 'right': [ [ 'lineinfo' ],
                    \            [ 'percent' ],
                    \            [ 'filetype' ] ] }


" This is the new style
call plug#end()

set laststatus=2
 
syntax on

set nu

set noshowmode

colorscheme gruvbox-material

set background=dark


" Nerd Tree remaps
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-v> :source ~/.config/nvim/init.vim<CR>
"nnoremap <C-g> :!gucp<CR>
" saving remap
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
