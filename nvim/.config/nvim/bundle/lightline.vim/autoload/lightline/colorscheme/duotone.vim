let s:p = {'normal': {}, 'insert': {}}
"let s:p.{mode}.{where} = [[{guifg, {guibg}, {ctermfg}, {ctermbg}]]
let s:p.normal.left   = [['#FAF8F5', '#063289', 0, 4], ['#FAF8F5', '#4D71BD', 0, 2]]
let s:p.normal.right  = [['#FAF8F5', '#063289', 0, 4], ['#FAF8F5', '#4D71BD', 0, 2]]
let s:p.normal.middle = [['#FAF8F5', '#728FCB', 0, 6]]
let s:p.insert.left   = [['#FAF8F5', '#895D06', 0, 20], ['#FAF8F5', '#BD994D', 0, 21]]
let s:p.insert.right  = [['#FAF8F5', '#895D06', 0, 20], ['#FAF8F5', '#BD994D', 0, 21]]
let s:p.insert.middle = [['#FAF8F5', '#CBAE72', 0, 22]]

let g:lightline#colorscheme#duotone#palette = s:p

