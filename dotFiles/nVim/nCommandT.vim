
        if has("eval")
                let g:CommandTCursorEndMap = ['<C-e>', '<End>']       " add End
                let g:CommandTCursorStartMap = ['<C-a>', '<Home>']    " add Home
                let g:CommandTCursorLeftMap = ['<Left>']              " remove ^H
                let g:CommandTCursorRightMap = ['<Right>']            " remove ^L
                let g:CommandTClearPrevWordMap = ['<C-w>', '<C-h>']   " add ^H aka Ctrl-BS
                let g:CommandTCancelMap = ['<C-c>', '<Esc>', '<C-g>'] " add ^G
                let g:CommandTMaxHeight = 20
                let g:CommandTTraverseSCM = "pwd"
                let g:CommandTMaxFiles=800000  " firefox source tree is _big_
                nmap <silent> ;t <Plug>(CommandTJump)
                nmap <silent> ;b <Plug>(CommandTBuffer)
                nmap <silent> ;h <Plug>(CommandTHelp)
        endif
