syntax on
set exrc
set secure
set nocompatible

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
filetype plugin indent on

set tags+=./tags;
set backspace=2
set foldmethod=indent
set incsearch
set hlsearch
set colorcolumn=120

set guioptions=-=m
set guioptions=-=T
set guioptions=-=r
set guioptions=-=L

autocmd FileType * set softtabstop=2|set shiftwidth=2
autocmd FileType ada set softtabstop=3|set shiftwidth=3
au BufEnter *.ad* set ai sw=3 sts=3
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.core set filetype=yaml
autocmd BufNewFile,BufReadPost *.rdl set filetype=systemrdl

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-voom/VOoM'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'wakatime/vim-wakatime'
Plugin 'rust-lang/rust.vim'
Plugin 'xarthurx/taskwarrior.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'gitignore'
call vundle#end()
Bundle 'sonph/onehalf', {'rtp': 'vim/'}


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
nmap <leader>s :setlocal spell! spelllang=pt<cr>
"Voom
nnoremap <leader>el :Voom latex<CR>
nnoremap <leader>ec :VoomToggle<CR>

"YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>s :YcmCompleter GoToDefinition<CR>
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>gp :Gpush<cR>
nnoremap <leader><leader> :noh<cR>

let g:ctrlp_custom_ignore = 'build\|git'

let g:clang_format#auto_format = 1
let g:clang_format#style = "llvm"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_clangd_uses_ycmd_caching=0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \  'systemverilog' : ['verilator'], 
      \  'verilog' : ['verilator'], 
      \  'vhdl' : ['ghdl'], 
      \}
let g:tagbar_type_vhdl = {
            \ 'ctagstype': 'vhdl',
            \ 'kinds' : [
            \'d:prototypes',
            \'b:package bodies',
            \'e:entities',
            \'a:architectures',
            \'t:types',
            \'p:processes',
            \'f:functions',
            \'r:procedures',
            \'c:constants',
            \'T:subtypes',
            \'r:records',
            \'s:signals',
            \'C:components',
            \'P:packages',
            \'l:locals'
            \]
            \}

