set tabstop=4 
set shiftwidth=4 
set expandtab
set number 
set ruler
set nowrap 


set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on                
colorscheme twilight256

set autoread
set cursorline
hi CursorLine term=bold cterm=bold gui=bold ctermbg=darkgray guibg=gray30

set colorcolumn=81
hi ColorColumn ctermbg=4

set t_Co=256

set backspace=indent,eol,start
"set background=dark
"highlight Comment ctermfg=yellow

noremap <silent> <Leader>o :NERDTreeTabsToggle<CR>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
noremap <silent> <Leader>s :call ToggleSpell()<CR>

function ToggleSpell()
    if &spell
        setlocal nospell
        set spell&
    else
        setlocal spell
        set spell
    endif
endfunction

function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
        nnoremap 0 g0
        nnoremap $ g$
        nnoremap j gj
        nnoremap k gk
        vnoremap 0 g0
        vnoremap $ g$
        vnoremap j gj
        vnoremap k gk
    endif
endfunction

execute pathogen#infect()
