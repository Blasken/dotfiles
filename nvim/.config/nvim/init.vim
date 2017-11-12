let g:mapleader = ' '

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'w0rp/ale'
    Plug 'w0ng/vim-hybrid'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'wokalski/autocomplete-flow'
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neco-syntax'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/vim-easy-align'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-wordy'
    Plug 'reedes/vim-pencil'
    Plug 'lervag/vimtex'
call plug#end()

nnoremap <leader>w       :w!<CR>
nnoremap <leader>q       :bd<CR>
nnoremap <leader>qq      :wqall!<CR>
nnoremap <leader><Esc>   :q!<CR>
nnoremap <leader>j       :bN<CR>
nnoremap <leader>k       :bn<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <space>         za
nnoremap <leader>n       :NERDTreeToggle<CR>
nnoremap <leader>r       :Goyo<CR>

" Movement
nnoremap <C-h>   <C-w>h
nnoremap <C-j>   <C-w>j
nnoremap <C-k>   <C-w>k
nnoremap <C-l>   <C-w>l
nnoremap <Tab>   :bn<CR>
nnoremap <S-Tab> :bN<CR>

inoremap jk <Esc>
" vnoremap jk <Esc>
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Display settings
set number
set scrolloff=9
set foldcolumn=1
set cmdheight=2
set laststatus=2
set showmatch
set cursorline
set colorcolumn=81
set splitbelow
set splitright
set hidden
set switchbuf=useopen
set nobackup
set wrap
set linebreak
set nolist

" Formatting
set textwidth=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround

" Globals
let g:python3_host_prog                   = '/usr/bin/python'
let g:loaded_python_provider              = 1

let g:deoplete#enable_at_startup          = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex    = g:vimtex#re#deoplete

let g:airline#extensions#tabline#enabled  = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#branch#enabled   = 1 " Enable branches
let g:airline_theme                       = 'hybridline'
let g:hybrid_custom_term_colors           = 1
let g:NERDTreeShowHidden                  = 1
let g:goyo_linenr                         = 1
let g:vimtex_view_method                  = 'zathura'
let g:vimtex_complete_recursive_bib       = 1

set background=dark
set termguicolors
colorscheme hybrid

inoremap <silent><expr> <Tab>     pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab>   pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-space> pumvisible() ?
            \ "\<C-y>" : deoplete#manual_complete()
inoremap <silent><expr> <BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <silent><expr> <C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <silent><expr> <CR>  pumvisible() ?
            \ deoplete#close_popup() : "<C-g>u<CR>"

function! SetUpTex()
    call pencil#init()
endfunction
function! Goyo_before()
    call pencil#init()
endfunction
let g:goyo_callbacks                      = [function('Goyo_before')]

augroup vimrc_change
    autocmd!
    autocmd BufWritePost $MYNVIMRC source $MYNVIMRC
augroup END
augroup vimrc_pumclose
    autocmd!
    autocmd InsertLeave,CompleteDone * if pumvisible() | silent! pclose! | endif
augroup END
augroup vimrc_tagbar
    autocmd!
    autocmd FileType * nested :call tagbar#autoopen()
augroup END
augroup vimrc_nerdtree
    autocmd!
    autocmd VimEnter * NERDTree
augroup END
augroup vimrc_html
    autocmd!
    autocmd Filetype html,css setlocal ts=2 sw=2 expandtab
augroup END
augroup vimrc_javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END
augroup vimrc_tex
    autocmd!
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd FileType tex nnoremap <buffer> <leader>lc <plug>(vimtex-compile)
augroup END
