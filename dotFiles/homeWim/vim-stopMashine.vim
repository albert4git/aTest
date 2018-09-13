nnoremap j gj
nnoremap k gk
nnoremap Y y$

noremap <leader>a =ip
noremap cp yap<S-}>p
map <F7> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d")<CR>p'tzt`s
"--++-+-------------------------------------------------------------------------
"?" nnoremap <C-c> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
"?" map <F7> :w <CR> :!gcc % -o %< && ./%< <CR>
"?" map <F8> :!./%<<CR>
"?" autocmd filetype cpp nnoremap <F6> :!g++ % -ggdb -o %:r <CR>
"?" autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
"?" autocmd filetype cpp nnoremap <F8> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
"-------------------------------------------------------------------------------
" map <F4> :execute "grep " . expand("<cword>") . "/j **" <Bar> cw<CR>
" map <F7> :TlistTogglstToggle<CR>
" map <F10> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" nnoremap <C-s> :<C-u>w<CR>
" inoremap <C-s> <ESC>:<C-u>w<CR>
" vnoremap <C-s> :<C-u>w<CR>
" cnoremap <C-s> <C-u>w<CR>
" nnoremap <expr><C-m> (bufname('%') ==# '[Command Line]' <bar><bar> &l:buftype ==# 'quickfix') ? "<CR>" : "<C-w>j"
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?
" cnoreabbrev H vert h
" cnoreabbrev HR vert bo h
" Format Paragraph -------------------------------------------------------------
" map <f3> gqap
" Format File ------------------------------------------------------------------
" map <f4> ggVGgq
" map <F2> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d")<CR>p'tzt`s
""?"Move a line of text using ALT+[jk] or Command+[jk] on mac
""?"nmap <M-j> mz:m+<cr>`z
""?"nmap <M-k> mz:m-2<cr>`z
""?"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
""?"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"-------------------------------------------------------------------------------
" Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>
"-------------------------------------------------------------------------------
"inoremap <C-J> <C-X><C-E>
"inoremap <C-K> <C-X><C-Y>
"-------------------------------------------------------------------------------
" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>
" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
vmap <C-c> "*y
nmap <C-c> "*Y
nmap <C-p> "*p
"q is super useful when browsing on the command line
" it deletes everything until the last slash 
" cnoq <C-\>eDeleteTillSlash()<cr> "not an edittor command cnoq

" Map alt-v in combatantmand-line mode to replace the commandline
" with the Ex command-line beneath the cursor in the buffer
"cnoremap      <F6>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>
"norm i""

"colorscheme blue
"colorscheme darkblue
"colorscheme desert
"colorscheme delek
"colorscheme peachpuff
"colorscheme colorful256
"colorscheme peaksea

" set gfn=IBM\ Plex\ Mono:h16,:Hack\ 16,Source\ Code\ Pro\ 14,Bitstream\ Vera\ Sans\ Mono\ 14
"-----XXX-------ToDO--------------------FFF-------------------------------------
"= 1. Whole lines                                          i_CTRL-X_CTRL-L
"= 2. keywords in the current file                         i_CTRL-X_CTRL-N
"= 3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
"= 4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T
"= 5. keywords in the current and included files           i_CTRL-X_CTRL-I
"= 6. tags                                                 i_CTRL-X_CTRL-]
"= 7. file names                                           i_CTRL-X_CTRL-F
"= 8. definitions or macros                                i_CTRL-X_CTRL-D
"= 9. Vim command-line                                     i_CTRL-X_CTRL-V
"= 10. User defined completion                             i_CTRL-X_CTRL-U
"= 11. omni completion                                     i_CTRL-X_CTRL-O
"= 12. Spelling suggestions                                i_CTRL-X_s
"= 13. keywords in 'complete'                              i_CTRL-N
"
