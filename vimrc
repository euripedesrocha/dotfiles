syntax on
set exrc
set secure
set nocompatible

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

set autochdir
set tags+=./tags;
set backspace=2
set foldmethod=indent
set colorcolumn=80

set guioptions=-=m
set guioptions=-=T
set guioptions=-=r
set guioptions=-=L

autocmd FileType * set softtabstop=2|set shiftwidth=2
autocmd FileType ada set softtabstop=3|set shiftwidth=3
au BufEnter *.ad* set ai sw=3 sts=3
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
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
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-voom/VOoM'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'rhysd/vim-clang-format'
Plugin 'gitignore'
call vundle#end()
Bundle 'sonph/onehalf', {'rtp': 'vim/'}

filetype plugin indent on

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
nmap <F3> :set invnumber<CR>
nmap <F4> :CtrlPBuffer<CR>
map <F8> :TagbarToggle<CR>

"map <F9> :TW<CR>

"map <silent> <F11>
      "\    :call system("wmctrl -ir " . v:windowid . " -b
"toggle,fullscreen")<CR>

func! s:DeleteBuffer()
  let line = getline('.')
  let bufid = line =~ '\[\d\+\*No Name\]$' ?
  str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
  exec "bd" bufid
  exec "norm \<F4>"
endfunc
func! MyCtrlPMappings()
  nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc


let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

"set wildignore+=*/.git/*,*/build
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
let g:clang_format#auto_format = 1
let g:clang_format#style = "llvm"
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_show_diagnostics_ui = 0

let g:ycm_clangd_args = ["-compile-commands-dir=" . getcwd() . "./build" ]
"let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"set tags+=./.tags

"let g:session_autosave = 'yes'
"let g:session_autoload = 'no'

noremap <Space> <Nop>
let mapleader=" "
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>gs :Gstatus<CR>
