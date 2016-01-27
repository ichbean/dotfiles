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


noremap <F5>    :w<CR>
imap    <C-j>   <plug>(emmet-move-next)
imap    <C-k>   <plug>(emmet-move-prev)
autocmd FileType html,css,scss imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
cmap w!! w !sudo tee > /dev/null %


"///////////////////////////////////////////////////////////
"| VUNDLE
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
"Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on


"///////////////////////////////////////////////////////////
"| LIGHTLINE
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

let g:lightline = {
    \ 'colorscheme': 'duotone',
    \ 'active': {
    \   'left': [[ 'mode' ], [ 'filename', 'fugitive' ]],
    \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileencoding', 'filetype' ]] },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'modified': 'LightLineModified',
    \   'readonly': 'LightLineReadonly',
    \   'filename': 'LightLineFilename' }
    \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "×"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


let g:EasyMotion_smartcase = 1

map   <Leader>    <Plug>(easymotion-prefix)
nmap  <Space>     <Plug>(easymotion-s)
map   <Leader>j   <Plug>(easymotion-j)
map   <Leader>k   <Plug>(easymotion-k)
map   /           <Plug>(easymotion-sn)
omap  /           <Plug>(easymotion-tn)

"///////////////////////////////////////////////////////////
"| SYNTAX
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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
hi MatchParen ctermfg=0 ctermbg=19
hi ErrorMsg   ctermbg=0 ctermfg=18 cterm=bold
" Language specific colours
hi htmlArg            ctermfg=1
hi htmlStatement      ctermfg=7
hi htmlLink           ctermfg=5
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
