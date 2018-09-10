                "---------------------------------------------------------------------------------
                " Maybe these mappings should be moved into FT_C() ?
                map             ,h              :call ToggleHeader()<CR>
                map             <C-F6>          ,h
                imap            <C-F6>          <C-O><C-F6>

                imap     <C-F6>          <C-O><C-F6>

                "---------------------------------------------------------------------------------
                " <F9> = make (often overwritten by filetype plugins)
                map             <F9>    :Make<CR>
                imap            <F9>    <C-O><F9>

                "---------------------------------------------------------------------------------
                " <S-F9> = toggle quickfix window
                map             <S-F9>  :call asyncrun#quickfix_toggle(8)<bar>call mg#statusline_update()<CR>
                imap            <S-F9>  <C-O><S-F9>
