set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2

call plug#begin('~/.vim/plugged')

"Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomlion/vim-solidity'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "soft"
set bg=dark
let NERDTreeQuitOnOpen=1
let mapleader=" "

setlocal sw=2 sts=2 et
 
"Shortcuts
"remap esc
:imap jj <Esc>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"plugings
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
"nmpa keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)

" Automatically closing braces
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i


" Instal plugings manager : curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" En vim :PluginInstall
