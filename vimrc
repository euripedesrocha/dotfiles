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

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number

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
"Plugin 'Valloric/YouCompleteMe'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rhysd/vim-clang-format'
Plugin 'rhysd/vim-grammarous'
Plugin 'vim-voom/VOoM'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'wakatime/vim-wakatime'
Plugin 'rust-lang/rust.vim'
Plugin 'xarthurx/taskwarrior.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'gitignore'
Plugin 'dracula/vim', { 'name': 'dracula' }
"Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
Bundle 'sonph/onehalf', {'rtp': 'vim/'}

set t_Co=256
colorscheme dracula
let g:lightline = {
  \ 'colorscheme': 'dracula',
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
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>f :CocFix<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>s :YcmCompleter GoToDefinition<CR>
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>gp :Gpush<cR>
nnoremap <leader><leader> :noh<cR>

let g:ctrlp_custom_ignore = 'build\|git'

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
      \  'markdown' : ['proselint', 'proselint'], 
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


" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped
" by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()
"
"     " Make <CR> auto-select the first completion item and notify
"coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in
" location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"
" " Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"

"nnoremap <leader>f :CocFix<CR>
  "
  "   " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
 nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
 nmap <leader>f  <Plug>(coc-fix-current)
"
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the
" language server.
 xmap if <Plug>(coc-funcobj-i)
 omap if <Plug>(coc-funcobj-i)
 xmap af <Plug>(coc-funcobj-a)
 omap af <Plug>(coc-funcobj-a)
 xmap ic <Plug>(coc-classobj-i)
 omap ic <Plug>(coc-classobj-i)
 xmap ac <Plug>(coc-classobj-a)
 omap ac <Plug>(coc-classobj-a)
"
" " Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?     coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of
" language server.
 nmap <silent> <C-s> <Plug>(coc-range-select)
 xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Add `:Format` command to format current buffer.
 command! -nargs=0 Format :call CocAction('format')
"
" " Add `:Fold` command to fold current buffer.
 command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Add `:OR` command for organize imports of the current
" buffer.
 command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"
" " Mappings for CoCList
" " Show all diagnostics.
 nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
 nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
 nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
 nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
 nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
 nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
 nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.

nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']}

let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'cpp' : 0,
            \ }

let g:grammarous#use_vim_spelllang = 1

