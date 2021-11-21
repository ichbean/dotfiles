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
Plug 'kassio/neoterm'
Plug 'lifepillar/vim-mucomplete'
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'
Plug 'mattn/emmet-vim'
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

" PLUGIN SETTINGS
" ----------------------------------------------------
" Mucomplete
set shortmess+=c
set completeopt+=menuone,noselect,noinsert
set completeopt-=preview
" let g:jedi#popup_on_dot = 0
let g:mucomplete#enable_auto_at_startup = 1
" Fugitive
set diffopt+=vertical

" CONFIG
" ----------------------------------------------------
syntax on
set number
set ignorecase
set encoding=utf8
set clipboard+=unnamedplus
set noshowmode
set scrolloff=12
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set splitbelow
set splitright
set termguicolors
set background=dark
" colorscheme solarized8_flat
colorscheme nord
filetype plugin on

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
" autocmd FileType php nnoremap <F5> :w!<cr>:!php %<cr>
" autocmd FileType php inoremap <F5> :w!<cr>:!php %<cr>
" autocmd FileType python nnoremap <F4> :w!<cr>:term python %<CR>
" autocmd FileType python inoremap <F4> <Esc>:w!<cr>:term python %<CR>
" Clear highlighting (Esc)
nnoremap <silent><esc>  :noh<return>
" Start Command mode (Enter)
nnoremap <cr> :
" Replace word occurrences
nnoremap c*  *Ncgn
nnoremap c#  #NcgN
nnoremap cg* g*Ncgn
nnoremap cg# g#NcgN
" Force write
cmap w!! w !sudo tee > /dev/null %
" Simplify movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Start interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

if has('nvim')
    autocmd TermOpen term://* startinsert
    " Last Position Jump
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
endif

" INCLUDES
" ----------------------------------------------------
source ~/.config/nvim/lightline.vim
