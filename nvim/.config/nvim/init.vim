" PLUGINS
" ----------------------------------------------------
call plug#begin('~/.config/nvim/bundle')
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'lifepillar/vim-mucomplete'
Plug 'lifepillar/vim-solarized8'
Plug 'mattn/emmet-vim'
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

" PLUGIN SETTINGS
" ----------------------------------------------------
"  Mucomplete
set shortmess+=c
set completeopt+=menuone,noinsert
let g:mucomplete#enable_auto_at_startup = 1

" CONFIG
" ----------------------------------------------------
syntax on
set number
set ignorecase
set encoding=utf8
set clipboard+=unnamedplus
set noshowmode
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set termguicolors
set background=light
colorscheme solarized8_flat


" KEYS & MACROS
" ----------------------------------------------------
" Bind leader to <Space>
nmap <space> <leader>
" Calculator
inoremap <c-a> <c-o>yiW<end>=<c-r>=<c-r>0<cr>
" Save file <F5>
inoremap <F5> <esc>:w<cr>a
nnoremap <F5> :w<cr>
" If PHP, save file and run (F5)
autocmd FileType php nnoremap <F5> :w!<cr>:!php %<cr>
autocmd FileType php inoremap <F5> :w!<cr>:!php %<cr>
" Clear highlighting (Esc)
nnoremap <silent><esc>  :noh<return>
" Start Command mode (Enter)
nnoremap <cr> :
" Replace word occurrences
nnoremap c*     *Ncgn
nnoremap c#     #NcgN
nnoremap cg*   g*Ncgn
nnoremap cg#   g#NcgN
" Force write
cmap w!! w !sudo tee > /dev/null %
" Start interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" LIGHTLINE
" ----------------------------------------------------
let g:lightline = {
    \ 'colorscheme': 'solarized',
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

function! LightLineFilename()
 return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
      \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
      \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
