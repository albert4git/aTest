"-------------------------------------------------------------------------------
vmap <C-c> "*y
nmap <C-c> "*Y
nmap <C-p> "*p
"-------------------------------------------------------------------------------
cnoreabbrev H vert h
cnoreabbrev HR vert bo h
"-------------------------------------------------------------------------------
map <F2> "zyiw:exe "vs ".@z.""<CR>
map <F3> "zyiw<C-w>wo<Esc>"zp<C-w>w
map <F4> "zY<C-w>wo<Esc>"zp<C-w>w
map <F9> "zyiw:exe "vertical h ".@z.""<CR>
"-------------------------------------------------------------------------------
nnoremap <C-down> :m .+1<CR>==
nnoremap <C-up> :m .-2<CR>==
"-------------------------------------------------------------------------------
set autowrite
map <F10> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <C-c> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
map <F7> :!./%<<CR>
"-------------------------------------------------------------------------------
let g:gitgutter_signs = 1
" let g:gitgutter_highlight_lines = 1
"-------------------------------------------------------------------------------
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
"-------------------------------------------------------------------------------

highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
"-------------------------------------------------------------------------------
