syntax on
set number
set background=light
set syntax=duotone
set ignorecase
set encoding=utf8
set clipboard+=unnamedplus
set noshowmode
" Tabs
set tabstop=8
set shiftwidth=3
set noexpandtab


" Basic calculator (Ctrl-A)
ino <c-a> <c-o>yiW<end>=<c-r>=<c-r>0<cr>

" Bind leader to <Space>
map <space> <leader>

" Save file <F5>
nnoremap <F5> :w<cr>
imap	<F5>	<esc>:w<cr>i
" If PHP save file and run (F5)
autocmd FileType php nnoremap <F5>  :w!<cr>:!php %<cr>
autocmd FileType php imap <F5>  :w!<cr>:!php %<cr>

" Clear highlighting with (Esc)
nnoremap <silent> <esc>  :noh<return>

" Start command mode (Enter)
nnoremap <cr>	:

" Replace word occurrences
nnoremap c*     *Ncgn
nnoremap c#     #NcgN
nnoremap cg*   g*Ncgn
nnoremap cg#   g#NcgN

" Force write
cmap w!! w !sudo tee > /dev/null %

" Emmet previous/next move
imap    <c-j>   <plug>(emmet-move-next)
imap    <c-k>   <plug>(emmet-move-prev)

"Emmet Tab completion for html, css and scss files
autocmd FileType html,css,scss imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Vim-plug
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
Plug 'metakirby5/codi.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/calendar.vim'
call plug#end()

" Lightline
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

" Easymotion
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
