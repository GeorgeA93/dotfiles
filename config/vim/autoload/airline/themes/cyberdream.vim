" cyberdream airline theme

let g:airline#themes#cyberdream#palette = {}

let s:bg         = '#16181a'
let s:bgAlt      = '#1e2124'
let s:bgHl       = '#3c4048'
let s:fg         = '#ffffff'
let s:grey       = '#7b8496'
let s:blue       = '#5ea1ff'
let s:green      = '#5eff6c'
let s:red        = '#ff6e5e'
let s:yellow     = '#f1ff5e'
let s:magenta    = '#bd5eff'

" [guifg, guibg, ctermfg, ctermbg, opts]
let s:N1 = [s:bg,   s:blue,  0, 4, '']
let s:N2 = [s:fg,   s:bgHl,  7, 8, '']
let s:N3 = [s:grey, s:bgAlt, 8, 0, '']
let g:airline#themes#cyberdream#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = [s:bg,   s:green, 0, 2, '']
let s:I2 = [s:fg,   s:bgHl,  7, 8, '']
let s:I3 = [s:grey, s:bgAlt, 8, 0, '']
let g:airline#themes#cyberdream#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1 = [s:bg,   s:red,   0, 1, '']
let s:R2 = [s:fg,   s:bgHl,  7, 8, '']
let s:R3 = [s:grey, s:bgAlt, 8, 0, '']
let g:airline#themes#cyberdream#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1 = [s:bg,     s:magenta, 0, 5, '']
let s:V2 = [s:fg,     s:bgHl,    7, 8, '']
let s:V3 = [s:grey,   s:bgAlt,   8, 0, '']
let g:airline#themes#cyberdream#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1 = [s:grey, s:bgAlt, 8, 0, '']
let s:IA2 = [s:grey, s:bgAlt, 8, 0, '']
let s:IA3 = [s:grey, s:bgAlt, 8, 0, '']
let g:airline#themes#cyberdream#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
