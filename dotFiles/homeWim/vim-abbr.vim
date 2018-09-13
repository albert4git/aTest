"-------------------------------------------------------------------------------
"=    function! PreviewTag2(top)
"=        set previewheight=25
"=        exe "silent! pclose"
"=        if &previewwindow " don't do this in the preview window
"=            return
"=        endif
"=        let w = expand("<cword>") " get the word under cursor
"=        exe "ptjump " . w
"=        if a:top
"=            return
"=        endif " otherwise, make it vertical
"=        exe "silent! wincmd P"
"=        if &previewwindow " if we really get there...
"=            if has("folding")
"=                silent! .foldopen " don't want a closed fold
"=            endif
"=            wincmd L " move preview window to the left
"=            wincmd p " back to caller
"=            if !&previewwindow " got back
"=                wincmd _
"=            endif
"=        endif
"=    endfunction
"=    ""----------------------------------------------------------------------------------
"=    " make caller full size (I use minibufexplorer and for some reason
"=    " the window is altered by the preview window split and manipulation
"=    " so wincmd _ sets it back... your mileage may vary
"=    ""----------------------------------------------------------------------------------
"=    inoremap <C-]> <Esc>:call PreviewTa2(0)<CR>
"=    nnoremap <C-]> :call PreviewTag2(0)<CR>
"=    " simple above the caller preview window,
"=    nnoremap <M-]> :call PreviewTag2(1)<CR>
"=    inoremap <M-]> <Esc>:call PreviewTag2(1)<CR>
"=    noremap <M-[> <Esc>:pc<CR>
"=    " close preview--------------------------
"=    nnoremap gf <C-W>f
"=    vnoremap gf <C-W>f
"=    "" open ctag in tab/vertical split
"=    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
