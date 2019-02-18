
"-AAA5-Ulty--NeoSnippet--Ctrl-B--Expander0------------------------------------------------------------------{{{
        "--------------------------------------------
        "------------------------------------------------------------------------------------------
        "----------------------------------------------------
        let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
        let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
        let g:SuperTabContextDiscoverDiscovery =
                \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
        "----------------------------------------------------
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabCrMapping = 1
        let g:SuperTabClosePreviewOnPopupClose = 1

        "------------------------------------------------------------------------------------------
        function! JumpToCSS()
                let id_pos = searchpos("id", "nb", line('.'))[1]
                let class_pos = searchpos("class", "nb", line('.'))[1]

                if class_pos > 0 || id_pos > 0
                        if class_pos < id_pos
                                execute ":vim '#".expand('<cword>')."' **/*.less"
                        elseif class_pos > id_pos
                                execute ":vim '.".expand('<cword>')."' **/*.less"
                        endif
                endif
        endfunction

        "nnoremap <leader>e :call JumpToCSS()<CR>zz
        "------------------------------------------------------------------------------------------
        imap <expr> <c-z> TabComplete()
        smap <expr> <c-z> TabComplete()
        xmap <expr> <c-z> TabComplete()

        function! TabComplete()
                if neosnippet#expandable_or_jumpable()
                        return "\<Plug>(neosnippet_expand_or_jump)"
                elseif &filetype =~ 'html\|css' && IsEmmetExpandable()
                        return "\<plug>(emmet-expand-abbr)"
                elseif pumvisible()
                        return "\<c-n>"
                else
                        return "\<tab>"
                endif
        endfunction
        "------------------------------------------------------------------
        " function! TabComplete()
        " if neosnippet#expandable_or_jumpable()
        "         return "\<Plug>(neosnippet_expand_or_jump)"
        "         elseif &filetype =~ 'html\|css' && emmet#isExpandable()
        "         return "\<plug>(emmet-expand-abbr)"
        "         elseif pumvisible()
        "         return "\<c-n>"
        " endif
        " endfunction

        "------------------------------------------------------------------------------------------
        function! IsEmmetExpandable()
                if !emmet#isExpandable() | return 0 | endif
                if &filetype =~ 'css' | return 1 | endif

                let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
                return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
        endfunction

        let s:emmetElements = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strike', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video', 'wbr']
        \ + ['emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd', 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap', 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out', 'det', 'acr', 'opt']

        "------------------------------------------------------------------------------------------
        " imap <leader><tab> <C-x><C-o>
        "==========================================================================================
        set runtimepath+=~/.config/nvim/plugged/neosnippet.vim/
        set runtimepath+=~/.config/nvim/plugged/neosnippet-snippets/
        "------------------------------------------------------------------
        "Tell Neosnippet about the other snippets
        " let g:neosnippet#snippets_directory = '~/.vim/snippets'    
        "-???-let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#snippets_directory = "~/.config/nvim/plugged/neosnippet-snippets/neosnippets/"
        "==========================================================================================
        "==========================================================================================
        "==========================================================================================
"-5-Complete-}}}
