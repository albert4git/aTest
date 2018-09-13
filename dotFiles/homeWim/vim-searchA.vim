noremap <C-y> :Ag "<cword>"<cr>
"-------------------------------------------------------------------------------

function! OnlineDoc3()
    let s:browser = "firefox"
    let s:wordUnderCursor = expand("<cword>")
    let s:langs = ["c", "cpp", "ruby", "python", "php", "java", "css"]
    if  ((match(s:langs, &ft) > -1) && (&ft != ""))
        let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor."+lang:".&ft
    else
        let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor
    endif
    let s:cmd ="silent ! " . s:browser . " " . s:url
    execute s:cmd
    redraw!
endfunction
"-------------------------------------------------------------------------------
map <F5> :call OnlineDoc3()<CR>
