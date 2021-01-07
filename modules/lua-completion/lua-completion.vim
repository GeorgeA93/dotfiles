let g:lua_check_syntax = 1
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 1
let g:lua_define_completion_mappings = 0
call deoplete#custom#var('omni', 'input_patterns', {
\ 'lua': '\w+|\w+[.:]\w*',
\ })
