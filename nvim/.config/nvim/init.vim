syntax on
set number
set syntax=duotone
set ignorecase
set encoding=utf8
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamedplus
set noshowmode
filetype off

noremap <F4>    :!php %<CR>
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
