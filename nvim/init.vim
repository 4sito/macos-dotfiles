" my neovim configuration



"{{{ Plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" gruvbox-material colorscheme
Plug 'sainnhe/gruvbox-material'

" Vim surround
Plug 'tpope/vim-surround'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" polyglot 
Plug 'sheerun/vim-polyglot'

"Plugin
Plug 'nsf/gocode'


" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" Plug 'zchee/deoplete-jedi'
" Plug 'Shougo/deoplete-clangx'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
" Plug 'oncomouse/ncm2-biblatex'

" latex support "
Plug 'lervag/vimtex'

" Nerd tree "
Plug 'scrooloose/nerdtree'

" light-line 
Plug 'itchyny/lightline.vim'

Plug 'Raimondi/delimitMate'

" vim eununch
Plug 'tpope/vim-eunuch'
""}}}


"{{{ Custom Settings
" show line number
set number

" show mode in status bar
set noshowmode

set wildmenu

set foldmethod=marker

set nocompatible

"}}}


"{{{ Plugin Settings

let g:ncm2_pyclang#library_path='/opt/homebrew/opt/emscripten/libexec/llvm/lib/libclang.dylib'


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set runtimepath+=~/.vim/plugged/my_snippets

"deoplete opens on startup"
"let g:deoplete#enable_at_startup = 1

set completeopt=noinsert,menuone,noselect
set shortmess+=c

augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
  
  " Cycle through completion entries with tab/shift+tab
  inoremap <expr> <s-tab> pumvisible() ? "\<c-n>" : "\<s-tab>"
  " inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  
  inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("<CR>", 'n') 
  
  inoremap <expr> <Plug>(cr_prev) execute('let g:_prev_line = getline(".")')
  inoremap <expr> <Plug>(cr_do) (g:_prev_line == getline('.') ? "\<cr>" : "")
  inoremap <expr> <Plug>(cr_post) execute('unlet g:_prev_line')


augroup END

" ~/.atom/.apm
"
" Optionally
let ncm2#complete_length = [[1, 2]]
let g:ncm2#matcher = 'substrfuzzy'

"Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


"lightline configuration

let g:lightline = {
      \'colorscheme': 'wombat',
      \ }

let g:lightline.active = {
                    \ 'left': [ [ 'mode', 'paste' ],
                    \           [ 'readonly', 'absolutepath', 'modified' ] ],
                    \ 'right': [ [ 'lineinfo' ],
                    \            [ 'percent' ],
                    \            [ 'filetype' ] ] }


" This is new style

call plug#end()

" call deoplete#custom#var('omni', 'input_patterns', {
"       \ 'tex': g:vimtex#re#deoplete
"       \})

"}}}


"{{{ Color Scheme & Theme
" this sets the colorscheme

colorscheme gruvbox-material

"}}}


"{{{ Custom Commands

command Lat execute "!pdflatex %:t"
command Comp execute "!gcc -Wall -Wextra -pedantic -o %<.out %"
command Cppcomp execute "!g++ -Wall -Wextra -pedantic -o %<.out %"
command Cexec execute "!./%<.out"

" Nerd Tree remaps
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-e> :source ~/.config/nvim/init.vim<CR>
"nnoremap <C-g> :!gucp<CR>
" saving remap
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-o> :Files<CR>

" compiling
nnoremap <C-l> :Lat<CR>
nnoremap <C-c> :Comp<CR>
nnoremap <C-i> :Cppcomp<CR>
nnoremap <C-x> :Cexec<CR>
" inverse search pdf

noremap <BS> dd
nnoremap <C-u> :PlugUpdate<CR>

"{{{2 VimTex 
function! SetServerName()
    let nvim_server_file = $TEMP . "/curnvimserver.txt"
    let nvim_server_file = "/tmp/curnvimserver.txt"
  let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
  call system(cmd)
endfunction

augroup vimtex_common
    autocmd!
    autocmd FileType tex call SetServerName()
augroup END

"}}}2
"}}}
