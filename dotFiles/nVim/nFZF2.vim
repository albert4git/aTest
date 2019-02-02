
        "------i----------i-------------------------------------------------------------------------
        "===PLAY7=========FZF=====================================================================
                nnoremap fg :Files<Cr>
                nnoremap fG :GFiles<Cr>
                nnoremap fb :Buffers<cr>
                nnoremap fk :Commands<Cr>
                nnoremap fc :BCommits<Cr>
                nnoremap fh :Helptags<Cr>
                nnoremap fy :History<cr>
        "-----------------------------------------------
                nnoremap fl :BLines<cr>
                nnoremap fs :Snippets<cr>
                nnoremap f' :Marks<cr>
                nnoremap ft :BTags<cr>

        "-----------------------------------------------
        BC "raum" luft leader  
        ABC raumRot luft leader  
        BC "raum" luft leader  
        BC "raumRedRot" luft leader  
        MB 'luft' leader  
        BC raum luft leader  
        BC raum luft leader  
        BC "raum" luft leader  

        a.k.a
        aka aka 
        a-k-a

                nnoremap ZZ mzzt3<c-u>`z
                fff        
                        nnoremap ZZ mzzt3<c-u>`z
                        asdfgd         nnoremap ZZ mzzt3<c-u>`z
                        ABC
                                "------i-------- 
                                "nnoremap ft :BTags<cr> 
                                --i-------------------------------------------------------------------------
                                                        
                                        ddd
                                                nnoremap BB ggVG
                                                
                                                



        "------i----------i-------------------------------------------------------------------------
        let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
        "===PLAY9=========FZF=====================================================================
        imap <expr><C-\> fzf#vim#complete#word({'left': '15%'})
        imap <C-l> <plug>(fzf-complete-line)
        imap <expr> <c-j> fzf#vim#complete(fzf#wrap({
                                \ 'prefix': '^.*$',
                                \ 'source': 'rg -n ^ --color always',
                                \ 'options': '--ansi --delimiter : --nth 3..',
                                \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

        "===PLAY10=========FZF=====================================================================
        command! -bang -nargs=* GGrep
                                \ call fzf#vim#grep(
                                \   'git grep --line-number '.shellescape(<q-args>), 0,
                                \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

        "===PLAY12=========FZF=====================================================================
        "  :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
        "  :Ag! - Start fzf in fullscreen and display the preview window above
        "------------------------------------------------------------------------------------------
        command! -bang -nargs=* Ag
                                \ call fzf#vim#ag(<q-args>,
                                \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                                \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                                \                 <bang>0)

        "===PLAY13=========FZF=====================================================================
        command! -bang -nargs=* Rg
                                \ call fzf#vim#grep(
                                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                                \   <bang>0)
        "===PLAY14=========FZF=====================================================================
        command! -bang -nargs=? -complete=dir Files
                                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
