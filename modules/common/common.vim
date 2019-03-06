set nocompatible
set encoding=utf-8
filetype plugin on
set number " line numbers
set clipboard=unnamed
set visualbell " turn that bell off
syntax on " Give me highlighting
set autoindent " indents plz
set smartindent
set smarttab
set shiftwidth=2
set autoread " reload files outside of vim
set softtabstop=2
set tabstop=2
set expandtab
set mouse=a " mouse and scrolling plz
set backspace=indent,eol,start
set scrolloff=3
set ignorecase " ignore case in searches
set smartcase " unless caps are in the search
set incsearch " search while composing regex
set autowrite " always write
set autowriteall
set nobackup " don't write junk files
set foldenable
set foldmethod=indent
set foldlevelstart=99 " Unfold everything when opening file
set foldlevel=100
set splitbelow " open new splits to the right and bottom
set splitright
set hlsearch
set guioptions= " hide scroll bars
set directory=$DOTFILES/build/vim/swapfiles// " Change swapfile location for out of wd
set timeoutlen=1000 ttimeoutlen=0
set lazyredraw
set wrap linebreak nolist

" Change leader to Space
let g:mapleader = "\<Space>"

" fast save
nmap <leader>w :w!<cr>

" fast close buffer
map <leader>bd :Bdelete<cr>

" close all buffers
map <leader>ba :bufdo :Bdelete<cr>

" Cycle through buffers
nnoremap <C-M> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" copy whole file
nnoremap <leader>ya :%y<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map <C-w>j :res +5<CR>
map <C-w>k :res -5<CR>
map <C-w>l :vertical resize +5<CR>
map <C-w>h :vertical resize -5<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use H!"<CR>
nnoremap <Right> :echoe "Use l!"<CR>
nnoremap <Up> :echoe "Use k!"<CR>
nnoremap <Down> :echoe "Use j!"<CR>

" upcase word
nnoremap <Leader>u gUiw

" Automatic Filename expansions for commands
" Directory for current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" Current file name
cnoremap %f <C-R>=fnameescape(expand('%:t'))<cr>
" Full path for current file
cnoremap %a <C-R>=fnameescape(expand('%:p'))<cr>

" Format xml
augroup xml_format
  autocmd!
  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END

" Spelling
augroup spell_group
    autocmd!

    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell
    autocmd FileType pullrequest setlocal spell
    autocmd FileType text setlocal spell
    autocmd FileType ruby setlocal spell

    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

call plug#begin('$HOME/dotfiles/build/vim/plugged')
source $HOME/dotfiles/build/vim/vimplugins
call plug#end()
