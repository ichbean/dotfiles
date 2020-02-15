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
