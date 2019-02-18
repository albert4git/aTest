
        "===SetPLAY2===============================================================================
        " In Neovim, you can set up fzf window using a Vim command
        let g:fzf_layout = { 'window': 'enew' }
        let g:fzf_layout = { 'window': '-tabnew' }
        let g:fzf_layout = { 'window': '10split enew' }

        "let g:fzf_history_dir = '~/.local/share/fzf-history'

        let g:fzf_colors =
                        \ { 'fg':      ['fg', 'Comment'],
                        \ 'bg':      ['bg', 'Normal'],
                        \ 'hl':      ['fg', 'Comment'],
                        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn', 'Normal'],
                        \ 'hl+':     ['fg', 'Statement'],
                        \ 'info':    ['fg', 'PreProc'],
                        \ 'border':  ['fg', 'Ignore'],
                        \ 'prompt':  ['fg', 'Conditional'],
                        \ 'pointer': ['fg', 'Exception'],
                        \ 'marker':  ['fg', 'Keyword'],
                        \ 'spinner': ['fg', 'Comment'],
                        \ 'header':  ['fg', 'Comment'] }

        "==========================================================================================
        function! s:fzf_statusline()
                highlight fzf1 ctermfg=161 ctermbg=2
                highlight fzf2 ctermfg=23 ctermbg=9
                highlight fzf3 ctermfg=237 ctermbg=13
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()

        "==========================================================================================
        "---------------------Ctrl-x--Lynx---------------------------------------------------------
        let g:fzf_command_prefix = 'Fzf'
        let g:fzf_action = {
                                \ 'ctrl-t': 'tab split',
                                \ 'ctrl-x': ':Lynx',
                                \ 'ctrl-v': 'vsplit' }
        "------------------------------------------------------------------------------------------
        " Selecting Mappings
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        imap <expr><C-j> fzf#vim#complete#word({'left': '15%'})
        imap <C-l> <plug>(fzf-complete-line)
        "********NiceNice*****************************************************************
        command! FZFTag if !empty(tagfiles()) | call fzf#run({
                                \ 'source': "cat " . join(tagfiles()) . ' | grep -P "' . expand('%:t') . '"',
                                \ 'sink': function('<sid>tag_handler'),
                                \ 'options': '+m --with-nth=1',
                                \ 'down': '50%'
                                \ }) | else | echo 'No tags' | endif

        function! s:tag_handler(tag)
            if !empty(a:tag)
                let token = split(split(a:tag, '\t')[2],';"')[0]
                let m = &magic
                setlocal nomagic
                execute token
                if m
                    setlocal magic
                endif
            endif
        endfunction
        nnoremap <silent> <Leader>t :FZFTagA<cr>
        "**********************************************************************************
        "-[Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        "-[[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        "-[Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        "-[Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        "---???------------------------------------------------------------------------------------
        let generate_tags=1

        "===SetPLAY3===============================================================================
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

        "------------------------------------------------------------------------------------------
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#matcher_default#use(['matcher_fzf'])

        "===SetPLAY5===============================================================================
        "   - :Unite [{options}] {source's'}
        "      - parameters of source
        "          - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
        "          - e.g. file:foo\:bar -- use \ to escape
        "          - e.g. file:foo::bar -- ['foo', '', 'bar']
        "   - press 'I' to search after prompt '>'
        "       - *word,
        "       - **/foo (directory recursively)
        "       - foo bar (AND)
        "       - foo|bar (OR)
        "       - foo !bar (negative)
        ":UniteResume, :UniteBookmarkAdd,
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_open_new_file = 'R'
        "let g:ctrlp_working_path_mode = 'ar'
        "===SetPLAY6===============================================================================
        let g:CommandTMaxFiles = 10000 " maximum number of files scan.
        let g:CommandTMaxDepth = 15
        let g:CommandTMaxCacheDirectories = 1 " 0: no limit.
        let g:CommandTMaxHeight = 15 " 0: as much as available space.
        let g:CommandTMinHeight = 0 " 0: single line.
        let g:CommandTAlwaysShowDotFiles = 0 " only if entered string contains a dot
        let g:CommandTNeverShowDotFiles = 0
        let g:CommandTScanDotDirectories = 0
        let g:CommandTMatchWindowAtTop = 0 " match window appear at bottom.
        let g:CommandTMatchWindowReverse = 1 " let the best match at bottom.
        let g:CommandTTageIncludeFilenames = 1 " include filenames when matches


        "===PLAY5=================================================================================
                nnoremap ;p :CtrlP<cr>
                nnoremap ;m :CtrlPMRU<cr>
        "===PLAY6==================================================================================
                nnoremap ;h :CommandTHelp<cr>
                nnoremap ;b :CommandTBuffer<cr>
                let g:CommandTCancelMap=['<C-x>', '<C-c>']
