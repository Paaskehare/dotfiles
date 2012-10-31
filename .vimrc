syntax on
colorscheme molokai
set hlsearch
set shell=bash

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" tab should make spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd

" toggle paste mode to avoid auto-indent on paste
set pastetoggle=<F10>

augroup vimrcEx

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

"
" MULTIPRUPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

" Clear search buffer when hitting return
function! MapCR()
  "nnoremap <cr> :nohlsearch<cr>
  nmap <cr> :nohlsearch<cr> 
endfunction
call MapCR()

nnoremap <c-t> :MiniBufExplorer<cr>
let g:miniBufExplMapCTabSwitchBufs = 1

let mapleader = ","
