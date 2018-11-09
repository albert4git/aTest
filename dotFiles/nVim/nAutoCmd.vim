        "------------------------------------------------------------------------------------------
        " This auto command will call LastMod function everytime you save a file
        function! LastMod()
                if line("$") > 30
                        let l = 30
                else
                        let l = line("$")
                endif
                exe "1," . l . "g/Last modified: Mo Okt 22, 2018  12:52
                                        \ strftime("%a %b %d, %Y  %I:%M%p")
        endfun
        autocmd BufWrite *   ks|call LastMod()|'s
        "------------------------------------------------------------------------------------------
        "In my Python or Ruby scripts, the first line is always a shebang line. I create it automatically using
        augroup Shebang
                autocmd BufNewFile *.py  0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
                autocmd BufNewFile *.rb  0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
                autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
                autocmd BufNewFile *.\(cc\|hh\)  0put =\"//\<nl>//  \".expand(\"<afile>:t\").\"  --  \<nl>//\<nl>\"|2|start!
        augroup END

