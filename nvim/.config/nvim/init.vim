syntax on
set number
set syntax=duotone
set ignorecase
set encoding=utf8
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamedplus


"Basic insert mode calculator
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

map      <SPACE>  <leader>
nnoremap <F4>   :!php %<CR>
nnoremap <F5>   :w<CR>
nnoremap <silent> <esc>  :noh<return>
nnoremap <cr>   :
nnoremap c*     *Ncgn
nnoremap c#     #NcgN
"nnoremap cg*   g*Ncgn
"nnoremap cg#   g#NcgN

imap    <C-j>   <plug>(emmet-move-next)
imap    <C-k>   <plug>(emmet-move-prev)
autocmd FileType html,css,scss imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
cmap w!! w !sudo tee > /dev/null %


call plug#begin('~/.config/nvim/bundle')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim'
"Plug 'shawncplus/phpcomplete.vim'
"Plug 'scrooloose/nerdtree'
call plug#end()


let g:deoplete#enable_at_startup = 1

"///////////////////////////////////////////////////////////
"| LIGHTLINE
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

let g:lightline = {
    \ 'colorscheme': 'duotone',
    \ 'active': {
    \   'left': [[ 'mode', 'paste' ], [ 'filename' ], [ 'fugitive' ]],
    \   'right': [[ 'lineinfo' ], ['percent'], [ 'fileencoding', 'filetype' ]] },
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

"map   <Leader>    <Plug>(easymotion-prefix)
"Move to char
nmap  <Leader><Space>     <Plug>(easymotion-s)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"Move up/down
map   <Leader>j           <Plug>(easymotion-j)
map   <Leader>k           <Plug>(easymotion-k)
"Easy search
map   /           <Plug>(easymotion-sn)
omap  /           <Plug>(easymotion-tn)
