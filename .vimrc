call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
execute pathogen#infect()
syntax on
set novisualbell
set noerrorbells
set nocompatible
set t_Co=256
set hlsearch
colorscheme koehler2
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set expandtab
set cindent
set autoindent
set smartindent
set shiftwidth=4
set number
set autochdir
map <F2> <Esc>:1,$!xmllint --format -<CR>
map <F3> <Esc>:e .<CR>
set laststatus=2
noremap <silent> <F10> :bd<CR>
noremap <silent> <F12> :bn<CR>
noremap <silent> <F11> :bp<CR>
set autowrite
filetype on
autocmd BufWinEnter * let @/ = ""
au BufNewFile,BufRead *.json set filetype=json
hi CursorLine term=NONE cterm=NONE ctermbg=239
set encoding=utf-8
set cursorline
map <C-t> :NERDTreeToggle<CR>
map <C-s-n> :Files<CR>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <F5> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
