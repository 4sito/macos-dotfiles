" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" latex support "
Plug 'lervag/vimtex'

" Nerd tree "
Plug 'preservim/nerdtree'

" light-line 
Plug 'itchyny/lightline.vim'

" Initialize plugin system

" show line number
:set number

" show mode in status bar
:set noshowmode


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"deoplete opens on startup"
let g:deoplete#enable_at_startup = 1


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

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" this sets the colorscheme

source $HOME/.config/nvim/themes/gruvbox.vim




command Lat execute "!pdflatex %:t && mv *.aux *.log aux/"
" Nerd Tree remaps
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" saving remap
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
" latex compiling
nnoremap <C-l> :Lat<CR>



" inverse search pdf

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

