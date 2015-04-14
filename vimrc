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
set foldmethod=syntax
set colorcolumn=80

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"highlight ColorColumn ctermbg=darkgray
"highlight Folded ctermbg=242

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdcommenter'

"Org-mode related Plugins
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/utl.vim' " plugin related to link short
Plugin 'mattn/calendar-vim'

Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'Zuckonit/vim-airline-tomato'
Plugin 'Lokaltog/powerline-fonts'
"Plugin 'gabrielelana/awesome-terminal-fonts'
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
<<<<<<< HEAD
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
=======
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

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
>>>>>>> 35ce18dabeb6be0d8f7d29a5d56db53f3b562662
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'

map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <c-w><c-t> :WMToggle<cr>
map <F7> :MBEToggle<CR>
map <F9> :tabnext<CR>
map <F10> :tabprevious<CR>

set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
"Vim Session Plugin configuration
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

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

<<<<<<< HEAD

"airline-pomodoro
let g:tomato#show_clock = 1
let g:tomato#show_count_down = 1 


"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
=======
"unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore= {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|tags$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

""statusline setup
"set statusline =%#identifier#
"set statusline+=[%t]    "tail of the filename
"set statusline+=%*

""display a warning if fileformat isnt unix
"set statusline+=%#warningmsg#
"set statusline+=%{&ff!='unix'?'['.&ff.']':''}
"set statusline+=%*

""display a warning if file encoding isnt utf-8
"set statusline+=%#warningmsg#
"set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
"set statusline+=%*

"set statusline+=%h      "help file flag
"set statusline+=%y      "filetype

""read only flag
"set statusline+=%#identifier#
"set statusline+=%r
"set statusline+=%*

""modified flag
"set statusline+=%#identifier#
"set statusline+=%m
"set statusline+=%*

"set statusline+=%{fugitive#statusline()}

""display a warning if &et is wrong, or we have mixed-indenting
"set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
"set statusline+=%*

"set statusline+=%{StatuslineTrailingSpaceWarning()}

"set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

""display a warning if &paste is set
"set statusline+=%#error#
"set statusline+=%{&paste?'[paste]':''}
"set statusline+=%*

"set statusline+=%=      "left/right separator
"set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
"set laststatus=2

""recalculate the trailing whitespace warning when idle, and after saving
"autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

""return '[\s]' if trailing white space is detected
""return '' otherwise
"function! StatuslineTrailingSpaceWarning()
    "if !exists("b:statusline_trailing_space_warning")

        "if !&modifiable
            "let b:statusline_trailing_space_warning = ''
            "return b:statusline_trailing_space_warning
        "endif

        "if search('\s\+$', 'nw') != 0
            "let b:statusline_trailing_space_warning = '[\s]'
        "else
            "let b:statusline_trailing_space_warning = ''
        "endif
    "endif
    "return b:statusline_trailing_space_warning
"endfunction


""return the syntax highlight group under the cursor ''
"function! StatuslineCurrentHighlight()
    "let name = synIDattr(synID(line('.'),col('.'),1),'name')
    "if name == ''
        "return ''
    "else
        "return '[' . name . ']'
    "endif
"endfunction

""recalculate the tab warning flag when idle and after writing
"autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

""return '[&et]' if &et is set wrong
""return '[mixed-indenting]' if spaces and tabs are used to indent
""return an empty string if everything is fine
"function! StatuslineTabWarning()
    "if !exists("b:statusline_tab_warning")
        "let b:statusline_tab_warning = ''

        "if !&modifiable
            "return b:statusline_tab_warning
        "endif

        "let tabs = search('^\t', 'nw') != 0

        ""find spaces that arent used as alignment in the first indent column
        "let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        "if tabs && spaces
            "let b:statusline_tab_warning =  '[mixed-indenting]'
        "elseif (spaces && !&et) || (tabs && &et)
            "let b:statusline_tab_warning = '[&et]'
        "endif
    "endif
    "return b:statusline_tab_warning
"endfunction

""recalculate the long line warning when idle and after saving
"autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

""return a warning for "long lines" where "long" is either &textwidth or 80 (if
""no &textwidth is set)
""
""return '' if no long lines
""return '[#x,my,$z] if long lines are found, were x is the number of long
""lines, y is the median length of the long lines and z is the length of the
""longest line
"function! StatuslineLongLineWarning()
    "if !exists("b:statusline_long_line_warning")

        "if !&modifiable
            "let b:statusline_long_line_warning = ''
            "return b:statusline_long_line_warning
        "endif

        "let long_line_lens = s:LongLines()

        "if len(long_line_lens) > 0
            "let b:statusline_long_line_warning = "[" .
                        "\ '#' . len(long_line_lens) . "," .
                        "\ 'm' . s:Median(long_line_lens) . "," .
                        "\ '$' . max(long_line_lens) . "]"
        "else
            "let b:statusline_long_line_warning = ""
        "endif
    "endif
    "return b:statusline_long_line_warning
"endfunction

""return a list containing the lengths of the long lines in this buffer
"function! s:LongLines()
    "let threshold = (&tw ? &tw : 80)
    "let spaces = repeat(" ", &ts)
    "let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    "return filter(line_lens, 'v:val > threshold')
"endfunction

""find the median of the given array of numbers
"function! s:Median(nums)
    "let nums = sort(a:nums)
    "let l = len(nums)

    "if l % 2 == 1
        "let i = (l-1) / 2
        "return nums[i]
    "else
        "return (nums[l/2] + nums[(l/2)-1]) / 2
    "endif
"endfunction
>>>>>>> 35ce18dabeb6be0d8f7d29a5d56db53f3b562662
