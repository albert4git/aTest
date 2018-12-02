"------------------------------------------------------------------------------
" FormatX
" Attempts to format and properly indent different types of files. Like if you
" have a big indented JSON string, run :call FormatJson()<cr> and this
" attempts to format it. These work pretty poorly and I should probably
" replace with a command line tool and never, ever use Vim for things like
" this
"------------------------------------------------------------------------------
function! FormatPerlObj()
    silent! exec '%s/\v\S+\s*\=\>\s*[^,]*,/\0\r'
    silent! exec '%s/\v\S+\s*\=\>\s*\{/\0\r'
    silent! exec '%s/\v[^{]\zs\},/\r\0'
    normal vie=
    exec 'set ft=perl'
endfunction

function! FormatJson()
    silent! exec '%s/\v\S+\s*:\s*[^,]*,/\0\r'
    silent! exec '%s/\v\S+\s*:\s*\{/\0\r'
    silent! exec '%s/\v[^{]\zs\},/\r\0'
    normal vie=
    exec 'set ft=javascript'
endfunction

function! FormatVarList()
    silent! exec '%s/\v\S+\s*\=\>\s*[^,]*,/\0\r'
    silent! exec '%s/\v\S+\s*\=\>\s*\{/\0\r'
    silent! exec '%s/\v[^{]\zs\},/\r\0'
    normal vie=
    exec 'set ft=perl'
endfunction

function! FormatAdiumLogs()
    silent! exec '%g/\vleft the room/d'
    silent! exec '%g/\ventered the room/d'
    silent! exec '%s/\v time\="[^"]+"\>\<div\>\<span style\="[^"]+"//'
    normal vie=
    exec 'set ft=html'
endfunction

function! FormatHtml()
    silent! exec '%s/\v\>\</\>\r\<'
    normal vie=
    exec 'set ft=html'
endfunction
