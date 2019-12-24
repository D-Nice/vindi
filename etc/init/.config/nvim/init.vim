set nocompatible
call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'vim-airline/vim-airline'    " powerline status theme
Plug 'dylanaraps/wal.vim'         " pywal color integration

" LSP/coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nim
Plug 'vim-syntastic/syntastic', { 'for': 'nim' }
Plug 'zah/nim.vim',             { 'for': 'nim' }

" Git
Plug 'airblade/vim-gitgutter'     " track git changes

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Quality of Life
Plug 'Raimondi/delimitMate'           " auto delimiter for quotes etc
Plug 'tpope/vim-surround'             " bindings for surrounding text
Plug 'tpope/vim-repeat'               " repeat plugin cmd and not just native cmd
Plug 'christoomey/vim-tmux-navigator' " enable C+hjkl nav between split buffers
Plug 'easymotion/vim-easymotion'      " improved motions
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" Define Coc Extensions Here
let g:coc_global_extensions = ['coc-tsserver',
                              \'coc-json',
                              \'coc-html',
                              \'coc-css' ,
                              \'coc-python',
                              \'coc-yaml',
                              \'coc-highlight',
                              \'coc-emmet',
                              \'coc-lists',
                              \'coc-git',
                              \'coc-yank',
                              \'coc-markdownlint',
                              \'coc-tabnine',
                              \'coc-gitignore',
                              \'coc-pairs',
                              \'coc-import-cost',
                              \'coc-sh',
                              \'coc-terminal',
                              \'coc-docker',
                              \'coc-github',
                              \'coc-snippets',
                              \'https://github.com/xabikos/vscode-javascript',
                              \]

" remap leader to space
" TODO may need something to stop space happening in normal mode etc...
let mapleader = "\<Space>"

set clipboard^=unnamed,unnamedplus
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set nopaste
set number
set mouse=a
set encoding=UTF-8
" decreased hold time from 4 secs to 0.5. If laggy, increase value
set updatetime=1000
syntax on

colorscheme wal

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" NERDTree
let g:NERDTreeWinSize=24
map  <S-j> :tabn<CR>
map  <S-k> :tabp<CR>
map  <C-n> :tabnew<CR>
map  <F8> :NERDTreeToggle<CR>

" vimgutter
if exists("*GitGutterGetHunkSummary")
  function! GitStatus()
    return join(filter(map(['A','M','D'], {i,v -> v.': '.GitGutterGetHunkSummary()[i]}), 'v:val[-1:]'), ' ')
  endfunction
  set statusline+=%{GitStatus()}
endif
let g:gitgutter_highlight_linenrs = 1
" use preview window instead of floating
let g:gitgutter_preview_win_floating = 0

" Autoremove any dnagling endlines
" Credit: https://stackoverflow.com/a/15994331/8453393
" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/
  " Save the current cursor position.
  let cursor_position = getpos('.')
  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)
  " Execute the command.
  execute a:command
  " Restore the last search.
  let @/ = search
  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt
  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction
function! RemoveDanglingEndlines()
  call Preserve('%s/\s\+$//e')
endfunction

" LSP
" coc.vim
"
" Pywal compatibility colors
" With highly contrasting red for errors always
hi PMenu ctermbg=Black ctermfg=14
hi CocErrorSign ctermfg=160 cterm=bold
hi CocErrorVirtualText ctermfg=160
hi link CocErrorFloat CocErrorVirtualText
hi link CocErrorLine CocErrorVirtualText
hi CocWarningSign ctermfg=Brown cterm=bold
hi CocWarningVirtualText ctermfg=Brown
hi link CocWarningFloat CocWarningVirtualText

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
inoremap <silent><expr> <c-space>
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

let g:airline#extensions#coc#enabled = 1

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
nmap [e <Plug>(coc-diagnostic-prev-error)
nmap ]e <Plug>(coc-diagnostic-next-error)

" WIP
" Nim or Syntastic depndent config
let g:syntastic_error_symbol = "EE"
let g:syntastic_warning_symbol = "WW"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

nmap [g :lprev<CR>
nmap ]g :lnext<CR>

" Auto loclist toggler
" re-uses existign syntastic vars to avoid var duplication
function! s:AutoToggleLocList()
  let loclength = len(getloclist(winnr()))
  let lastwinnr = winnr()
  if loclength
    if g:syntastic_auto_loc_list == 5
      if loclength > g:syntastic_loc_list_height
        let loclength = g:syntastic_loc_list_height
      endif
      exe 'lopen '.loclength
      if lastwinnr != winnr() | exe lastwinnr.' wincmd w' | endif
    endif
  else
    if g:syntastic_auto_loc_list > 0
      lclose
    endif
  endif
endfunction

" Cursor considered held depending on updatetime
"autocmd CursorHold *.nim call s:AutoToggleLocList()
"autocmd User CocLocationsChange call s:AutoToggleLocList()
autocmd QuitPre * if empty(&bt) | lclose | endif
autocmd! User CocDiagnosticChange
autocmd  User CocDiagnosticChange
\  call CocActionAsync('quickfixes', function('CocUpdateQuickFixes'))

"set nocompatible
"call plug#begin('~/.vim/plugged')
"
"" Aesthetics
"Plug 'vim-airline/vim-airline'    " powerline status theme
"Plug 'dylanaraps/wal.vim'         " pywal color integration
"
"" LSP/coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"" Git
"Plug 'airblade/vim-gitgutter'     " track git changes
"
"" NERDTree
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
"
"" Quality of Life
"Plug 'Raimondi/delimitMate'           " auto delimiter for quotes etc
"Plug 'tpope/vim-surround'             " bindings for surrounding text
"Plug 'tpope/vim-repeat'               " repeat plugin cmd and not just native cmd
"Plug 'christoomey/vim-tmux-navigator' " enable C+hjkl nav between split buffers
"Plug 'easymotion/vim-easymotion'      " improved motions
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"
"" Initialize plugin system
"call plug#end()
"
"" Define Coc Extensions Here
"let g:coc_global_extensions = ['coc-tsserver',
"                              \'coc-json',
"                              \'coc-html',
"                              \'coc-css' ,
"                              \'coc-python',
"                              \'coc-yaml',
"                              \'coc-highlight',
"                              \'coc-emmet',
"                              \'coc-lists',
"                              \'coc-git',
"                              \'coc-yank',
"                              \'coc-markdownlint',
"                              \'coc-tabnine',
"                              \'coc-gitignore',
"                              \'coc-pairs',
"                              \'coc-import-cost',
"                              \'coc-sh',
"                              \'coc-terminal',
"                              \'coc-docker',
"                              \'coc-github',
"                              \'coc-snippets',
"                              \'https://github.com/xabikos/vscode-javascript',
"                              \]
"
"" remap leader to space
"" TODO may need something to stop space happening in normal mode etc...
"let mapleader = "\<Space>"
"
"set clipboard^=unnamed,unnamedplus
"set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
"set nopaste
"set number
"set mouse=a
"set encoding=UTF-8
"syntax on
"
"colorscheme wal
"
"" vim-airline
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline_detect_paste=1
"let g:airline#extensions#tabline#enabled = 1
"set laststatus=2
"
"" NERDTree
"let g:NERDTreeWinSize=24
"map  <S-j> :tabn<CR>
"map  <S-k> :tabp<CR>
"map  <C-n> :tabnew<CR>
"map  <F8> :NERDTreeToggle<CR>
"
"" vimgutter
"if exists("*GitGutterGetHunkSummary")
"  function! GitStatus()
"    return join(filter(map(['A','M','D'], {i,v -> v.': '.GitGutterGetHunkSummary()[i]}), 'v:val[-1:]'), ' ')
"  endfunction
"  set statusline+=%{GitStatus()}
"endif
"let g:gitgutter_highlight_linenrs = 1
"" use preview window instead of floating
"let g:gitgutter_preview_win_floating = 0
"
"" Autoremove any dnagling endlines
"" Credit: https://stackoverflow.com/a/15994331/8453393
"" Restore cursor position, window position, and last search after running a
"" command.
"function! Preserve(command)
"  " Save the last search.
"  let search = @/
"  " Save the current cursor position.
"  let cursor_position = getpos('.')
"  " Save the current window position.
"  normal! H
"  let window_position = getpos('.')
"  call setpos('.', cursor_position)
"  " Execute the command.
"  execute a:command
"  " Restore the last search.
"  let @/ = search
"  " Restore the previous window position.
"  call setpos('.', window_position)
"  normal! zt
"  " Restore the previous cursor position.
"  call setpos('.', cursor_position)
"endfunction
"function! RemoveDanglingEndlines()
"  call Preserve('%s/\s\+$//e')
"endfunction
"
"" LSP
"" coc.vim
""
"" Pywal compatibility colors
"" With highly contrasting red for errors always
"hi PMenu ctermbg=Black ctermfg=14
"hi CocErrorSign ctermfg=160
"hi link CocErrorLine CocErrorSign
"
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ coc#refresh()
"inoremap <silent><expr> <S-Tab>
"  \ pumvisible() ? "\<C-p>" :
"  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"  \ coc#refresh()
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"let g:coc_snippet_next = '<tab>'
"let g:coc_snippet_prev = '<s-tab>'
"inoremap <silent><expr> <c-space>
"  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"  \ coc#refresh()
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
"
"
"let g:airline#extensions#coc#enabled = 1
"
"nmap gd <Plug>(coc-definition)
"nmap gy <Plug>(coc-type-definition)
"nmap gi <Plug>(coc-implementation)
"nmap gr <Plug>(coc-references)
"nmap [a <Plug>(coc-diagnostic-prev)
"nmap ]a <Plug>(coc-diagnostic-next)
"nmap [e <Plug>(coc-diagnostic-prev-error)
"nmap ]e <Plug>(coc-diagnostic-next-error)
"
"let g:coc_enable_locationlist = 1
"
"let g:syntastic_error_symbol = "EE"
"let g:syntastic_warning_symbol = "WW"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 3
"function! s:AutoToggleLocList()
"  let loclength = len(getloclist(winnr()))
"  let lastwinnr = winnr()
"  if loclength
"    if g:syntastic_auto_loc_list == 1
"      if loclength > g:syntastic_loc_list_height
"        let loclength = g:syntastic_loc_list_height
"      endif
"      exe 'lopen '.loclength
"      "wincmd p
"			exe lastwinnr . " wincmd w"
"    endif
"  else
"    if g:syntastic_auto_loc_list > 0
"      lclose
"    endif
"  endif
"endfunction
"autocmd CursorHold * call s:AutoToggleLocList()
"
"set updatetime=500
"
map <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>
