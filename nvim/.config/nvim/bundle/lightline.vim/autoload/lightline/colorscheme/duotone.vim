let s:p = {'normal': {}, 'insert': {}, 'visual': {}}
"let s:p.{mode}.{where} = [[{guifg, {guibg}, {ctermfg}, {ctermbg}]]
let s:p.normal.left   = [['#FAF8F5', '#063289', 0, 4], ['#FAF8F5', '#4D71BD', 8, 11]]
let s:p.normal.right  = [['#FAF8F5', '#063289', 8, 14], ['#FAF8F5', '#4D71BD', 8, 11]]
let s:p.normal.middle = [['#FAF8F5', '#728FCB', 10, 0]]
let s:p.insert.left   = [['#FAF8F5', '#895D06', 0, 2], ['#FAF8F5', '#BD994D', 0, 11]]
let s:p.insert.middle = [['#FAF8F5', '#CBAE72', 10, 0]]
let s:p.visual.left   = [['#FAF8F5', '#895D06', 0, 5], ['#FAF8F5', '#BD994D', 0, 11]]
let s:p.insert.middle = [['#FAF8F5', '#CBAE72', 10, 0]]

let g:lightline#colorscheme#duotone#palette = s:p

