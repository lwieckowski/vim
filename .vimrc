set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" All Plugins

Plugin 'arcticicestudio/nord-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin '907th/vim-auto-save'
Plugin 'vim-test/vim-test'
Plugin 'voldikss/vim-floaterm'

call vundle#end()            " required
filetype plugin indent on    " required

set termguicolors
colorscheme dracula
let mapleader = "."
set nu
syntax on
set backspace=indent,eol,start
set updatetime=1
set ts=4
set expandtab
let g:auto_save = 1
let g:ale_completion_enabled=1
let g:ale_set_balloons=1
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_hover_to_preview = 0
let g:floaterm_wintype = 'split'

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-P> :Files<cr>
nnoremap P :Buffers<cr>
nnoremap f :BLines<cr>
nnoremap O :BTags<cr>
nnoremap T :Tags<cr>
nnoremap <leader>g :Commits<cr>
nnoremap <leader>w :call ToggleQuickFix()<cr>
nnoremap <C-]> :ALEGoToDefinition<cr>
nnoremap <C-[> :ALEFindReferences -quickfix<cr>
nnoremap <F1> :ALERename<cr>
nmap K :ALEHover<cr>
nmap <silent> <F2> :TestNearest<cr>
nmap <silent> <F3> :TestFile<cr>
nmap <silent> <F4> :TestSuite<cr>
nmap <silent> <F5> :TestLast<cr>
noremap <leader>k :cp<CR>zv
noremap <leader>j :cn<CR>zv

nmap <leader>o :TagbarToggle<CR>
nmap <C-G> :NERDTreeToggle<CR>

let g:floaterm_keymap_new    = '<F8>'
let g:floaterm_keymap_prev   = '<F9>'
let g:floaterm_keymap_next   = '<F10>'
let g:floaterm_keymap_toggle = '<F12>'

" quickfix toogle
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[0 q"
let &t_EI = "\e[0 q"

