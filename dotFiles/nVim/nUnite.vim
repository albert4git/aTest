
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

