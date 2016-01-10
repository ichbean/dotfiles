let s:p = {'normal': {}}
"let s:p.{mode}.{where} = [[{guifg, {guibg}, {ctermfg}, {ctermbg}]]
let s:p.normal.left   = [['#FAF8F5', '#063289', 0, 4], ['#FAF8F5', '#4D71BD', 0, 2]]
let s:p.normal.right  = [['#FAF8F5', '#063289', 0, 4], ['#FAF8F5', '#4D71BD', 0, 2]]
let s:p.normal.middle = [['#FAF8F5', '#063289', 0, 6]]

let g:lightline#colorscheme#duotone#palette = s:p

