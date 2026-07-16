call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" ===== 2026/03/31 =====
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim'

call plug#end()

"================================
set number
set relativenumber
set cursorline
set guicursor=a:blinkon1

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set termguicolors
set background=dark
colorscheme gruvbox

highlight SpellBad cterm=NONE ctermfg=Red ctermbg=LightYellow

" Enable spell checking only for writing
augroup SpellCheck
    autocmd!
    autocmd FileType markdown,text,gitcommit setlocal spell spelllang=en
augroup END

" ===== 2026/03/31 =====
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
