

        function! s:unite_settings()
                nnoremap <silent> <buffer><expr> v unite#do_action('right')
                inoremap <silent> <buffer><expr> <c-v> unite#do_action('right')
                nnoremap <silent> <buffer><expr> s unite#do_action('below')
                inoremap <silent> <buffer><expr> <c-s> unite#do_action('below')
                nnoremap <silent> <buffer><expr> l     unite#do_action('default')
                inoremap <silent> <buffer><expr> <c-l>
                                        \ getcurpos()[1]==1 ? "\<right>" : unite#do_action('default')
                inoremap <silent> <buffer>       <c-h> <left>
                inoremap <silent> <buffer>       <c-f> <bs>
                inoremap <silent> <buffer>       <c-e> <end>
                inoremap <silent> <buffer>       <c-a> <home>
                imap <silent> <buffer> ;         <plug>(unite_choose_action)
                nmap <silent> <buffer> ;         <plug>(unite_choose_action)
                nmap <silent> <buffer> h         <plug>(unite_exit)
                nmap <silent> <buffer> H         <plug>(unite_all_exit)
                nmap <silent> <buffer> <c-o>     <plug>(unite_redraw)
                imap <silent> <buffer> <c-o>     <plug>(unite_redraw)
                imap <silent> <buffer> <c-j>     <plug>(unite_select_next_line)
                imap <silent> <buffer> <c-k>     <plug>(unite_select_previous_line)
                imap <silent> <buffer> <tab>     <plug>(unite_complete)

                let unite = unite#get_current_unite()
                if unite.profile_name ==# 'search'
                        nnoremap <silent> <buffer><expr> r unite#do_action('replace')
                else
                        nnoremap <silent> <buffer><expr> r unite#do_action('rename')
                endif
        endfunction


        let g:unite_source_menu_menus.git = {
        \ 'description' : '            gestionar repositorios git
                \                            ⌘ [espacio]g',
        \}
        let g:unite_source_menu_menus.git.command_candidates = [
        \['▷ tig                                                        ⌘ ,gt',
                \'normal ,gt'],
        \['▷ git status       (Fugitive)                                ⌘ ,gs',
                \'Gstatus'],
        \['▷ git diff         (Fugitive)                                ⌘ ,gd',
                \'Gdiff'],
        \['▷ git commit       (Fugitive)                                ⌘ ,gc',
                \'Gcommit'],
        \['▷ git log          (Fugitive)                                ⌘ ,gl',
                \'exe "silent Glog | Unite quickfix"'],
        \['▷ git blame        (Fugitive)                                ⌘ ,gb',
                \'Gblame'],
        \['▷ git stage        (Fugitive)                                ⌘ ,gw',
                \'Gwrite'],
        \['▷ git checkout     (Fugitive)                                ⌘ ,go',
                \'Gread'],
        \['▷ git rm           (Fugitive)                                ⌘ ,gr',
                \'Gremove'],
        \['▷ git mv           (Fugitive)                                ⌘ ,gm',
                \'exe "Gmove " input("destino: ")'],
        \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
                \'Git! push'],
        \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
                \'Git! pull'],
        \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
                \'exe "Git! " input("comando git: ")'],
        \['▷ git cd           (Fugitive)',
                \'Gcd'],
        \]
        nnoremap <Leader>e :Unite -silent -start-insert menu:git<CR>

