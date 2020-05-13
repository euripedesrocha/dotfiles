syntax on
set exrc
set secure
set nocompatible

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

"set autochdir
set tags+=./tags;
set backspace=2
set foldmethod=indent
"set colorcolumn=80

set guioptions=-=m
set guioptions=-=T
set guioptions=-=r
set guioptions=-=L

autocmd FileType * set softtabstop=2|set shiftwidth=2
autocmd FileType ada set softtabstop=3|set shiftwidth=3
au BufEnter *.ad* set ai sw=3 sts=3
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.core set filetype=yaml
autocmd FileType c,cpp ClangFormatAutoEnable

"highlight ColorColumn ctermbg=darkgray
"highlight Folded ctermbg=242

augroup project
"autocmd!
"autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-voom/VOoM'
Plugin 'itchyny/lightline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rhysd/vim-clang-format'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'gitignore'
call vundle#end()
Bundle 'sonph/onehalf', {'rtp': 'vim/'}

filetype plugin indent on

set t_Co=256
colorscheme onehalfdark
let g:lightline = {
  \ 'colorscheme': 'onehalfdark',
  \ }

set laststatus=2
set noshowmode

nmap <F2> :w<CR>

imap <F2> <ESC>:w<CR>i
nmap <F3> :set invnumber<CR>
nmap <F4> :CtrlPBuffer<CR>
map <F8> :TagbarToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

noremap <Space> <Nop>
let mapleader=" "
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>gp :Gpush<cR>

let g:ctrlp_custom_ignore = 'build\|git'

let g:clang_format#auto_format = 1
let g:clang_format#style = "llvm"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_clangd_args = ["-compile-commands-dir=" . getcwd() . "/build" ]

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \  'systemverilog' : ['verilator'], 
      \  'verilog' : ['verilator'], 
      \}
