syntax on
set exrc
set secure
set nocompatible

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

set autochdir
set tags+=./tags;
set smartindent
set backspace=2
set foldmethod=indent
set colorcolumn=80

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"highlight ColorColumn ctermbg=darkgray
"highlight Folded ctermbg=242

"augroup project
    "autocmd!
    "autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

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
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/nerdcommenter'

"Org-mode related Plugins
"Plugin 'jceb/vim-orgmode'
"Plugin 'tpope/vim-speeddating'
"Plugin 'vim-scripts/utl.vim' " plugin related to link short
"Plugin 'mattn/calendar-vim'

Plugin 'tpope/vim-sensible'

Plugin 'bling/vim-airline'
call vundle#end()
filetype plugin indent on

set t_Co=256
colorscheme gruvbox
set background=dark

" Enhanced keyboard mappings
"
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
nmap <F8> :TagbarToggle<CR>

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
            \'C:components',
            \'P:packages',
            \'l:locals'
            \]
            \}

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 1

"YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./.tags

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'

map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <c-w><c-t> :WMToggle<cr>
map <F9> :tabnext<CR>
map <F10> :tabprevious<CR>

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
"Vim org_mode Plugin configuration
let g:org_todo_keywords= [['TODO(t)', '|', 'DONE(d)'],
            \['TEST(v)',  'CODE(c)', 'BUG(b)', '|', 'DONE(d)', 'FIXED(f)'],
            \['CANCELED(a)']]
let g:org_todo_keyword_faces = [['TODO', [':foreground yellow',
            \':background black', ':weight bold', ':decoration underline']],
            \['DONE', [':foreground green',
            \':background black', ':weight bold', ':decoration underline']]]
"   \['TEST',],
"   \['CODE',],
"   \['BUG',],
"   \['DONE',],
"   \['FIXED],
"   \['CANCELED', [':foreground grey', ':background black', ':weight bold',
"   \':slant italic', ':decoration underline']]]

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc
