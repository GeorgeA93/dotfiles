let g:go_fmt_fail_silently = 0
let g:go_fmt_command = 'goimports'
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_textobj_enabled = 0

function! ShellCommandSeperator()
  if empty(matchstr($SHELL, 'fish'))
    return '&&'
  else
    return '; and'
  endif
endfunction

let s:separator = ShellCommandSeperator()

function! GolangCwd()
  return escape(shellescape(expand('%:p:h'), 1), '$')
endfunction

function! GolangRun()
  call VimuxRunCommand('cd ' . GolangCwd() . ' ' . s:separator . ' clear ' . s:separator . ' go run ' . expand('%:t'))
endfunction

augroup vim_go
  autocmd!
  autocmd FileType go nmap <Leader>gx :call GolangRun()<CR>
  autocmd FileType go nmap <Leader>gb <Plug>(go-build)
  autocmd FileType go nmap <Leader>ge <Plug>(go-whicherrs)
  autocmd FileType go nmap <Leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>gc <Plug>(go-coverage)
  autocmd FileType go nmap <Leader>gf <Plug>(go-referrers)
  autocmd FileType go nmap <Leader>gi <Plug>(go-implements)
  autocmd FileType go nmap <Leader>gr <Plug>(go-rename)
  autocmd FileType go nmap <Leader>gdd <Plug>(go-def)
  autocmd FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>gdb <Plug>(go-def-tab)
  autocmd BufEnter *.go setlocal fdm=indent
augroup END

let g:polyglot_disabled = ['go']
