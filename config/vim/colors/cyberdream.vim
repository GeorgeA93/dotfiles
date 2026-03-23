" cyberdream.vim — a Vim colorscheme port of scottmckendry/cyberdream.nvim

set background=dark
hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'cyberdream'

" Palette
let s:bg         = '#16181a'
let s:bgAlt      = '#1e2124'
let s:bgHighlight = '#3c4048'
let s:fg         = '#ffffff'
let s:grey       = '#7b8496'
let s:blue       = '#5ea1ff'
let s:green      = '#5eff6c'
let s:cyan       = '#5ef1ff'
let s:red        = '#ff6e5e'
let s:yellow     = '#f1ff5e'
let s:magenta    = '#bd5eff'
let s:pink       = '#ff5ef1'
let s:orange     = '#ffbd5e'

function! s:hi(group, guifg, guibg, ...)
  let l:attr = a:0 >= 1 ? a:1 : 'NONE'
  exec 'hi ' . a:group . ' guifg=' . a:guifg . ' guibg=' . a:guibg . ' gui=' . l:attr . ' cterm=' . l:attr
endfunction

" --- Editor ---
call s:hi('Normal',       s:fg,         s:bg)
call s:hi('NormalFloat',  s:fg,         s:bgAlt)
call s:hi('Cursor',       s:bg,         s:fg)
call s:hi('CursorLine',   'NONE',       s:bgAlt)
call s:hi('CursorLineNr', s:grey,       s:bgAlt)
call s:hi('LineNr',       s:bgHighlight,'NONE')
call s:hi('SignColumn',   'NONE',       s:bg)
call s:hi('ColorColumn',  'NONE',       s:bgAlt)
call s:hi('Visual',       'NONE',       s:bgHighlight)
call s:hi('VisualNOS',    'NONE',       s:bgHighlight)
call s:hi('Search',       s:bg,         s:yellow)
call s:hi('IncSearch',    s:bg,         s:orange)
call s:hi('CurSearch',    s:bg,         s:orange)
call s:hi('MatchParen',   s:orange,     s:bgHighlight, 'bold')

" --- Statusline / Tabline ---
call s:hi('StatusLine',   s:fg,         s:bgAlt)
call s:hi('StatusLineNC', s:grey,       s:bgAlt)
call s:hi('TabLine',      s:grey,       s:bgAlt)
call s:hi('TabLineFill',  'NONE',       s:bg)
call s:hi('TabLineSel',   s:fg,         s:bg,          'bold')
call s:hi('WildMenu',     s:bg,         s:blue)

" --- Splits / Folds ---
call s:hi('VertSplit',    s:bgHighlight,'NONE')
call s:hi('Folded',       s:grey,       s:bgAlt)
call s:hi('FoldColumn',   s:grey,       s:bg)

" --- Popup menu ---
call s:hi('Pmenu',        s:fg,         s:bgAlt)
call s:hi('PmenuSel',     s:fg,         s:bgHighlight)
call s:hi('PmenuSbar',    'NONE',       s:bgAlt)
call s:hi('PmenuThumb',   'NONE',       s:bgHighlight)

" --- Messages ---
call s:hi('ErrorMsg',     s:red,        'NONE',        'bold')
call s:hi('WarningMsg',   s:yellow,     'NONE',        'bold')
call s:hi('MoreMsg',      s:green,      'NONE')
call s:hi('Question',     s:blue,       'NONE')
call s:hi('Title',        s:blue,       'NONE',        'bold')
call s:hi('Directory',    s:blue,       'NONE')
call s:hi('NonText',      s:bgHighlight,'NONE')
call s:hi('SpecialKey',   s:bgHighlight,'NONE')
call s:hi('Conceal',      s:grey,       'NONE')

" --- Diff ---
call s:hi('DiffAdd',      s:green,      '#1a2e1a')
call s:hi('DiffChange',   s:yellow,     '#2e2e1a')
call s:hi('DiffDelete',   s:red,        '#2e1a1a')
call s:hi('DiffText',     s:bg,         s:yellow,      'bold')

" --- Spell ---
call s:hi('SpellBad',     s:red,        'NONE',        'undercurl')
call s:hi('SpellCap',     s:yellow,     'NONE',        'undercurl')
call s:hi('SpellRare',    s:magenta,    'NONE',        'undercurl')
call s:hi('SpellLocal',   s:cyan,       'NONE',        'undercurl')

" --- Syntax ---
call s:hi('Comment',      s:grey,       'NONE',        'italic')
call s:hi('Constant',     s:orange,     'NONE')
call s:hi('String',       s:green,      'NONE')
call s:hi('Character',    s:green,      'NONE')
call s:hi('Number',       s:orange,     'NONE')
call s:hi('Boolean',      s:orange,     'NONE')
call s:hi('Float',        s:orange,     'NONE')
call s:hi('Identifier',   s:fg,         'NONE')
call s:hi('Function',     s:blue,       'NONE')
call s:hi('Statement',    s:magenta,    'NONE')
call s:hi('Conditional',  s:magenta,    'NONE')
call s:hi('Repeat',       s:magenta,    'NONE')
call s:hi('Label',        s:cyan,       'NONE')
call s:hi('Operator',     s:fg,         'NONE')
call s:hi('Keyword',      s:magenta,    'NONE')
call s:hi('Exception',    s:red,        'NONE')
call s:hi('PreProc',      s:cyan,       'NONE')
call s:hi('Include',      s:magenta,    'NONE')
call s:hi('Define',       s:magenta,    'NONE')
call s:hi('Macro',        s:cyan,       'NONE')
call s:hi('PreCondit',    s:cyan,       'NONE')
call s:hi('Type',         s:yellow,     'NONE')
call s:hi('StorageClass', s:magenta,    'NONE')
call s:hi('Structure',    s:yellow,     'NONE')
call s:hi('Typedef',      s:yellow,     'NONE')
call s:hi('Special',      s:pink,       'NONE')
call s:hi('SpecialChar',  s:pink,       'NONE')
call s:hi('Tag',          s:cyan,       'NONE')
call s:hi('Delimiter',    s:fg,         'NONE')
call s:hi('Debug',        s:red,        'NONE')
call s:hi('Underlined',   s:blue,       'NONE',        'underline')
call s:hi('Ignore',       s:grey,       'NONE')
call s:hi('Error',        s:red,        'NONE',        'bold')
call s:hi('Todo',         s:orange,     'NONE',        'bold')

" --- ALE ---
call s:hi('ALEError',        s:red,    'NONE', 'undercurl')
call s:hi('ALEWarning',      s:yellow, 'NONE', 'undercurl')
call s:hi('ALEErrorSign',    s:red,    s:bg)
call s:hi('ALEWarningSign',  s:yellow, s:bg)

" --- NERDTree ---
call s:hi('NERDTreeDir',       s:blue,    'NONE')
call s:hi('NERDTreeDirSlash',  s:blue,    'NONE')
call s:hi('NERDTreeOpenable',  s:grey,    'NONE')
call s:hi('NERDTreeClosable',  s:grey,    'NONE')
call s:hi('NERDTreeFile',      s:fg,      'NONE')
call s:hi('NERDTreeExecFile',  s:green,   'NONE')
call s:hi('NERDTreeUp',        s:grey,    'NONE')
call s:hi('NERDTreeCWD',       s:cyan,    'NONE')

" --- Git (fugitive) ---
call s:hi('diffAdded',   s:green, 'NONE')
call s:hi('diffRemoved', s:red,   'NONE')
call s:hi('diffChanged', s:yellow,'NONE')
call s:hi('diffFile',    s:blue,  'NONE', 'bold')
call s:hi('diffLine',    s:grey,  'NONE')

delfunction s:hi
