syntax on
set exrc
set secure
set nocompatible

set tabstop=2
set expandtab
autocmd FileType ada set softtabstop=3|set shiftwidth=3
au BufEnter *.ad* set ai sw=3 sts=3
set softtabstop=2
set shiftwidth=2
filetype plugin indent on

set autochdir
set tags+=./tags;
set backspace=2
set foldmethod=indent
set colorcolumn=80

set guioptions=-=m
set guioptions=-=T
set guioptions=-=r
set guioptions=-=L
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType c,cpp ClangFormatAutoToggle

"highlight ColorColumn ctermbg=darkgray
"highlight Folded ctermbg=242

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-shell'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/nerdcommenter'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'vim-voom/VOoM'
Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'

call vundle#end()
filetype plugin indent on

set t_Co=256
colorscheme gruvbox
set background=dark

" Enhanced keyboard mappings
"
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" Toggle line numbering:w
nmap <F3> :set invnumber<CR>

nmap <F4> :CtrlPBuffer<CR>

" build using makeprg with <F7>
map <F5> :!rake test:delta<CR>
" build using makeprg with <S-F7>
map <S-F5> :!rake clean<CR>

nmap <leader>s :setlocal spell! spelllang=pt<cr>
map <F9> :TW<CR>

map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
map <F8> :TagbarToggle<CR>

nnoremap <leader>el :Voom latex<CR>
nnoremap <leader>ec :VoomToggle<CR>

"YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-F5> :YcmForceCompileAndDiagnostics<CR>

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F4>"
endfunc
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

"let g:ycm_global_ycm_extra_conf = "./.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 1
"let g:ycm_show_diagnostics_ui = 0

"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./.tags

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'

let g:clang_format#code_style = "llvm"
let g:clang_format#auto_format = 1
"set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
"Vim Session Plugin configuration
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

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

