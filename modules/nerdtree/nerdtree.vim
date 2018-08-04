augroup NERDtree
  autocmd!
  " Open NERDTree automatically when vim starts on a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " Close NERDTree tab if the only remaining window is NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" Open and close NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Open NERDTree on file I am editing
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
