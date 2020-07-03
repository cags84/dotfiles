" Disable vi mode, required
set nocompatible
filetype off

" Plug manager -> Plug
" Install dependency manager -> https://github.com/junegunn/vim-plug
" Run :PlugInstall
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

" Settings required
set noerrorbells 	" No beeps
set number 		" Show lines number

" Apply the indentation of the current line to the next line.
set autoindent
set smartindent
set complete-=i
set showmatch
set smarttab

set tabstop=4
set shiftwidth=4
set expandtab

" Do not use relative numbers to where the cursor is.
set norelativenumber

" If terminal emulator is mouse work just fine, thus enable it
if(has('mouse'))
  set mouse=a
endif

" Mappings
map <C-n> :NERDTreeToggle<CR>
