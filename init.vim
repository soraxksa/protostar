
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set virtualedit=all
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

set tags=./tags;/
 
call plug#begin("~/.config/nvim/plugged")
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'liuchengxu/vista.vim'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'luochen1990/rainbow'
    Plug 'ludovicchabant/vim-gutentags'
" Plug 'honza/vim-snippets'
" Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
 

nnoremap <C-n> :NERDTreeToggle<CR>
 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 
nnoremap <silent> <A-6> :Vista!!<CR>

"cppman config
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>



nnoremap <silent> <A-6> :Vista!!<CR>


function! s:JbzClangFormat(first, last)
  let l:winview = winsaveview()
  execute a:first . "," . a:last . "!clang-format -style=\"{ BasedOnStyle: Chromium, IndentWidth: 4}\""
  call winrestview(l:winview)
endfunction
command! -range=% JbzClangFormat call <sid>JbzClangFormat (<line1>, <line2>)

au FileType c,cpp nnoremap <leader>lf :<C-u>JbzClangFormat<CR>
au FileType c,cpp vnoremap <leader>lf :JbzClangFormat<CR>


let g:rainbow_active = 1


