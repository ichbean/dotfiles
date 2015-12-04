syntax on
set nu
set ignorecase
set encoding=utf8
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamedplus
filetype off

" sudo write
cmap w!! w !sudo tee > /dev/null %

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Easymotion configuration
let g:EasyMotion_smartcase = 1

map   <Leader>    <Plug>(easymotion-prefix)
nmap  <Space>     <Plug>(easymotion-s)
map   <Leader>j   <Plug>(easymotion-j)
map   <Leader>k   <Plug>(easymotion-k)

" Colors
let g:lightline = {
  \ 'colorscheme': 'duotone',
  \ }

hi Comment    ctermfg=16
hi Error      ctermfg=0 ctermbg=18
hi Identifier ctermfg=1
hi LineNr     ctermfg=17
hi Normal     ctermfg=7
hi Operator   ctermfg=17
hi PreProc    ctermfg=4
hi Statement  ctermfg=6
hi Function   ctermfg=4
hi Constant   ctermfg=4
hi Number     ctermfg=4
hi String     ctermfg=4
hi StatusLine cterm=none ctermfg=7 ctermbg=0
hi SignColumn ctermbg=0
hi WildMenu   cterm=bold ctermfg=7 ctermbg=0
hi Visual     ctermfg=0 ctermbg=17
hi Search     ctermfg=0 ctermbg=6 
hi MatchParen ctermfg=0 ctermbg=5
hi ErrorMsg   ctermbg=0 ctermfg=18 cterm=bold
" Language specific colors
hi htmlArg            ctermfg=1
hi htmlStatement      ctermfg=7
hi htmlTag            ctermfg=17
hi htmlSpecialTagName ctermfg=7
hi htmlEndTag         ctermfg=17
