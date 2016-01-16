syntax on
set nu
set ignorecase
set encoding=utf8
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamedplus
set noshowmode
filetype off

" Mappings
cmap w!! w !sudo tee > /dev/null %
noremap <F5> :w<Enter>

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/lightline.vim'
"Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let g:lightline = {
    \ 'colorscheme': 'duotone',
    \ 'active': {
    \   'left': [[ 'mode' ],
    \             [ 'readonly', 'filename', 'fugitive', 'modified' ]] },
    \ 'component': {
    \   'readonly': '%{&readonly?"×":""}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())' }
    \ }


let g:EasyMotion_smartcase = 1

map   <Leader>    <Plug>(easymotion-prefix)
nmap  <Space>     <Plug>(easymotion-s)
map   <Leader>j   <Plug>(easymotion-j)
map   <Leader>k   <Plug>(easymotion-k)
map   /           <Plug>(easymotion-sn)
omap  /           <Plug>(easymotion-tn)

"|------------------------------------------------------------
"| SYNTAX COLOURS
"|------------------------------------------------------------

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
hi WildMenu   cterm=none ctermfg=0 ctermbg=6
hi Visual     ctermfg=0 ctermbg=17
hi VertSplit  cterm=none ctermfg=6
hi StatusLine ctermfg=0 ctermbg=4
hi StatusLineNC cterm=none
hi Search     ctermfg=0 ctermbg=6 
hi MatchParen ctermfg=0 ctermbg=5
hi ErrorMsg   ctermbg=0 ctermfg=18 cterm=bold
" Language specific colours
hi htmlArg            ctermfg=1
hi htmlStatement      ctermfg=7
hi htmlTag            ctermfg=17
hi htmlSpecialTagName ctermfg=7
hi link htmlEndTag    htmlTag
hi link xmlEndTag     xmlTag
" Easymotion
hi VitalOverCommandLineCursor cterm=none ctermfg=none ctermbg=none
hi EasyMotionTargetDefault ctermfg=18
hi EasyMotionShadeDefault ctermfg=17
hi EasyMotionIncSearchDefault ctermfg=2
hi EasyMotionIncCursorDefault ctermfg=0 ctermbg=21
