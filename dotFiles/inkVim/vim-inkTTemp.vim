
        "-AAA9--Surround-'_'--onoremap-???-XXX--------------------------------------------------{{{

        "Quote 'current' selection TODO: This only works for selections that are created "forwardly"
                vnoremap <Leader>' <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
                vnoremap <LocalLeader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll
        "Quote words under cursor
                nnoremap <Leader>` viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l
                nnoremap <LocalLeader>` viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l


        "-9-}}}


                augroup ft_quickfix
                        au!
                        au filetype qf setlocal colorcolumn=1,2,3,4 nolist cursorline nowrap tw=0
                        " vimscript is a joke
                        au filetype qf setlocal highlight ColorColumn ctermbg=Red
                        au filetype qf nnoremap <buffer> <cr> :execute "normal! \<lt>cr>"<cr>
                augroup end

        " " Map Mod1-F12 to toggle some vim goodness
        " function! EditorvsNotepad()
        "         if g:notepad == "false"
        "                 let g:notepad="true"
        "                 syntax off
        "                 set nohlsearch
        "                 set laststatus=0
        "         else
        "                 let g:notepad="false"
        "                 syntax on
        "                 set hlsearch
        "                 set laststatus=2
        "         endif
        " endfunction
        " let g:notepad = "false"
        " map <M-F12> :call EditorvsNotepad()<CR>
        "
        "
        " " Map Shift-F12 to switch between light and dark
        " function! Switch_background()
        "         if &background == "light"
        "                 set background=dark
        "         else
        "                 set background=light
        "         endif
        " endfunction
        " map <S-F12> :call Switch_background()<CR>
        "
        " if &term =~ "xterm\\|rxvt"
        "         " use an orange cursor in insert mode
        "         let &t_SI = "\<Esc>]12;orange\x7"
        "         " use a red cursor otherwise
        "         let &t_EI = "\<Esc>]12;red\x7"
        "         silent !echo -ne "\033]12;red\007"
        "         " reset cursor when vim exits
        "         autocmd VimLeave * silent !echo -ne "\033]112\007"
        "         " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
        " endif
        "
                " ~/wimr-erik-demo-magik.vim
                " Customize fzf colors to match your color scheme
                " Default fzf layout down / up / left / right
                " Default fzf layout down / up / left / right
                let g:fzf_layout = { 'down': '~40%' }

                " Customize fzf colors to match your color scheme
                let g:fzf_colors =
                                        \ { 'fg':      ['fg', 'Normal'],
                                        \ 'bg':      ['bg', 'Normal'],
                                        \ 'hl':      ['fg', 'Comment'],
                                        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                                        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                                        \ 'hl+':     ['fg', 'Statement'],
                                        \ 'info':    ['fg', 'PreProc'],
                                        \ 'border':  ['fg', 'Ignore'],
                                        \ 'prompt':  ['fg', 'Conditional'],
                                        \ 'pointer': ['fg', 'Exception'],
                                        \ 'marker':  ['fg', 'Keyword'],
                                        \ 'spinner': ['fg', 'Label'],
                                        \ 'header':  ['fg', 'Comment'] }

                " Global line completion (not just open buffers. ripgrep required.)
                inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
                                        \ 'prefix': '^.*$',
                                        \ 'source': 'rg -n ^ --color always',
                                        \ 'options': '--ansi --delimiter : --nth 3..',
                                        \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

                "Reducer example
                function! s:make_sentence(lines)
                        return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
                endfunction

                inoremap <expr> <c-x><c-s> fzf#vim#complete({
                                        \ 'source':  'cat /usr/share/dict/words',
                                        \ 'reducer': function('<sid>make_sentence'),
                                        \ 'options': '--multi --reverse --margin 15%,0',
                                        \ 'left':    20})

                function! s:fzf_statusline()
                        " Override statusline as you like
                        highlight fzf1 ctermfg=161 ctermbg=251
                        highlight fzf2 ctermfg=23 ctermbg=251
                        highlight fzf2 ctermfg=237 ctermbg=251
                        setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
                endfunction
                autocmd! User FzfStatusLine call <SID>fzf_statusline()
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" color solarized

"?" if has('statusline')
"?"         set laststatus=2
"?"         " Broken down into easily includeable segments
"?"         set statusline=%<%f\                     " Filename
"?"         set statusline+=%w%h%m%r                 " Options
"?"         set statusline+=%{fugitive#statusline()} " Git Hotness
"?"         set statusline+=\ [%{&ff}/%Y]            " Filetype
"?"         set statusline+=\ [%{getcwd()}]          " Current dir
"?"         set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"?" endif

" " Use ag for Search
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
" endif
" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"       \ 'ignore_pattern', join([
"       \ '\.git/',
"       \ ], '\|'))
" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
" let g:unite_force_overwrite_statusline = 0
" let g:unite_winheight = 10
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec/async','sorters','sorter_rank')
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   let b:SuperTabDisabled=1
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"   imap <silent><buffer><expr> <C-x> unite#do_action('split')
"   imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
"
"   nmap <buffer> <ESC> <Plug>(unite_exit)
" endfunction
"
" "---------------------------------------------------------------------------------
" if has("autocmd")
"         " Kill visual bell! kill!
"         augroup GUI
"                 au!
"                 au GUIEnter * set t_vb=
"         augroup END
"
"         augroup LastPositionJump
"                 au!
"                 au BufReadPost *
"                                         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
"                                         \ |   exe "normal! g`\""
"                                         \ | endif
"         augroup END
" endif
"
" "---------------------------------------------------------------------------------
" " Make fugitive's fake buffers visually distinguishable
" augroup MakeFugitiveVisible
" au!
" au BufNew,BufReadPost fugitive://* Margin 0
" augroup END
" "---------------------------------------------------------------------------------
" if ! exists('g:TagHighlightSettings')
"         let g:TagHighlightSettings = {}
" endif
"
" let g:TagHighlightSettings['ForcedPythonVariant'] = 'if_pyth'
" let g:TagHighlightSettings['CtagsExecutable'] = 'etags'
"
" let g:TagHighlightSettings['TagFileName'] = 'tags'
" nmap <leader>re :UpdateTypesFile<CR>
"
" "---------------------------------------------------------------------------------
" "cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" "map <leader>e  :e %%
"
" "-------------------------------------------------------------------------------
" " nnoremap <C-a> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" "-------------------------------------------------------------------------------
" " nnoremap <silent> R :GitGrep <cword><CR>
" "----------------------------------------------------------------------------------
"
" "---------------------------------------------------------------------------------
" "#one#
" vnoremap <F5>  i(
" vnoremap <S-F5>  a(
" "#two#
" vnoremap <F6> ipk$
" vnoremap <S-F6> ip
" vnoremap <C-F6> ap
" "#three#
" vnoremap <F7> i{k$
" vnoremap <S-F7> i{
" vnoremap <C-F7> a{k$
" "#vier#
" inoremap <C-q> ()<esc>i
" inoremap <C-w> {<esc>o}<esc>O
" "---------------------------------------------------------------------------------
" map  <A-!>  1gt
" map  <A-@>  2gt
" map  <A-#>  3gt
" map  <A-$>  4gt
" map  <A-%>  5gt
" map  <A-^>  6gt
" map  <A-&>  7gt
" map  <A-*>  8gt
"
" "nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>
" "bind \ (backward slash) to grep shortcut
" "nnoremap \ :Ag<SPACE>
"
" nnoremap <leader>l :lgrep -R <cword> .<cr>
" nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"
" "-???- XXX YankRing stuff
"         let g:yankring_history_dir = '$HOME/.vim/tmp'
"
" "XXX ??? ToDo Insert line under cursor (builtin in vim 8.0.1787)
"         cnoremap        <C-R><C-L>      <C-R>=getline(".")<CR>
"
" "Alt-Backspace  deletes word backwards
"         cnoremap        <A-BS>          <C-W>
"
" "Do not lose -complete all- (gvim-only)
"         cnoremap        <C-S-A>         <C-A>
"
" " Define operator-pending mappings to quickly apply commands to function names
" "XXX and/or parameter lists in the current line
"         onoremap inf :<c-u>normal! 0f(hviw<cr>
"         onoremap anf :<c-u>normal! 0f(hvaw<cr>
"         onoremap in( :<c-u>normal! 0f(vi(<cr>
"         onoremap an( :<c-u>normal! 0f(va(<cr>
"
" "-Next--TAG---
"         onoremap int :<c-u>normal! 0f<vit<cr>
"         onoremap ant :<c-u>normal! 0f<vat<cr>
"
" " Function argument selection (change "around argument", change "inside argument")
"         onoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
"         vnoremap M :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
"
" "1. vnew - collect words lines
" map <C-F2> "zyiw<C-w>wo<Esc>"zp<C-w>W
" map <S-F2> "zY<C-w>wo<Esc>"zp<C-w>W
"
"
" " Agutomatically clean / delete whitespace, trailing dos returns
" autocmd BufRead * silent! %s/[\r \t]\+\$//
"
" " Delete trailing white space on save, useful for some filetypes ;)
" fun! CleanExtraSpaces()
"   let save_cursor = getpos(".")
"   let old_query = getreg('/')
"   silent! %s/\s\+$//e
"   call setpos('.', save_cursor)
"   call setreg('/', old_query)
" endfun
" "#==>
" if has("autocmd")
"   autocmd BufWritePre *.vim,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
" endif
"
"
" "-AAA12-[unite-completion]--------------------------------------------------------------{{{
" " unite.vim Ultimate interface to unite all sources
" "   - :Unite [{options}] {source's'}
" "       - {source's'}
" "           - parameters of source
" "               - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
" "               - e.g. file:foo\:bar -- use \ to escape
" "               - e.g. file:foo::bar -- ['foo', '', 'bar']
" "   - press 'I' to search after prompt '>'
" "       - *word,
" "       - **/foo (directory recursively)
" "       - foo bar (AND)
" "       - foo|bar (OR)
" "       - foo !bar (negative)
" "   - :UniteResume, :UniteBookmarkAdd
" " let g:unite_no_default_keymappings = 1 " don't map default key mappings
" "let g:unite_update_time = 500 " update time interval of candidates
" "let g:unite_enable_start_insert = 1 " startup into insert mode
" "let g:unite_split_rule = "topleft"
" "let g:unite_enable_split_vertically = 0 " 1:split unite window vertically
" "let g:unite_winheight = 15
" "let g:unite_winwidth = 50
" "let g:unite_kind_openable_cd_command = "cd"
" "let g:unite_kind_openable_lcd_command = "lcd"
" "let g:unite_cursor_line_highlight = "PmenuSel"
" "let g:unite_abbr_highlight = "Normal"
" "let g:unite_enable_use_short_source_names = 0
" "let g:unite_quick_match_table = {}
" "let g:unite_data_directory = expand('~/.unite')
" "-12-Unite-}}}
"
" if neobundle#tap('unite')
"   " enable yank history
"   let g:unite_source_history_yank_enable         = 1
"   let g:unite_source_history_yank_save_clipboard = 1
"   let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
"         \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
"   let g:yankring_replace_n_pkey                  = 'gp'
"   let g:yankring_replace_n_nkey                  = 'gn'
"   let g:unite_marked_icon                        = '✓'
"   " use ag in unite grep source
"   if executable('ag')
"     let g:unite_source_grep_command = 'ag'
"     let g:unite_source_grep_default_opts =
"           \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
"           \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
"     let g:unite_source_grep_recursive_opt = ''
"   endif
"   " change prompt and start NOT in insert mode
"   call unite#custom#profile('default', 'context',
"         \ { 'prompt': '➤ ',
"         \   'start_insert' : '0'})
"   call unite#filters#matcher_default#use(['matcher_fuzzy'])
"   call unite#filters#sorter_default#use(['sorter_rank'])
"   nnoremap [unite]   <nop>
"   nmap     <leader>f [unite]
"   nnoremap <silent>  [unite]a :<c-u>Unite -toggle -buffer-name=files
"         \ file_rec/async<cr><c-u>
"   nnoremap <silent>  [unite]b :<c-u>Unite -toggle -buffer-name=file
"         \ file<cr>
"   nnoremap <silent>  [unite]c :<c-u>Unite -toggle -buffer-name=command\ history
"         \ history/command history/search<cr>
"   nnoremap <silent>  [unite]d :<c-u>Unite -toggle -buffer-name=mru\ directory
"         \ neomru/directory<cr><c-u>
"   nnoremap <silent>  [unite]f :<c-u>Unite -toggle -buffer-name=buffer
"         \ buffer<cr><c-u>
"   nnoremap <silent>  [unite]g :<c-u>Unite -toggle -buffer-name=grep
"         \ grep:<cr>
"   nnoremap <silent>  [unite]h :<c-u>Unite -toggle -buffer-name=yank\ history
"         \ history/yank register<cr>
"   nnoremap <silent>  [unite]l :<c-u>Unite -toggle -buffer-name=line
"         \ line<cr>
"   nnoremap <silent>  [unite]m :<c-u>Unite -toggle -buffer-name=mark
"         \ mark<cr>
"   nnoremap <silent>  [unite]o :<c-u>Unite -toggle -buffer-name=outline
"         \ outline<cr>
"   nnoremap <silent>  [unite]p :<c-u>Unite -toggle -buffer-name=help
"         \ help<cr>
"   nnoremap <silent>  [unite]k :<c-u>Unite -quick-match -buffer-name=quick\ match
"         \ -no-split buffer<cr>
"   nnoremap <silent>  [unite]r :<c-u>Unite -toggle -buffer-name=register
"         \ register<cr>
"   nnoremap <silent>  [unite]s :<c-u>Unite -toggle -buffer-name=session
"         \ session<cr>
"   nnoremap <silent>  [unite]t :<c-u>Unite -toggle -buffer-name=tag
"         \ tag<cr>
"   nnoremap <silent>  [unite]u :<c-u>Unite -toggle -buffer-name=mru\ file
"         \ neomru/file<cr>
"
"
"
" "?" "-AAA13-CtrlP---------------------------------------------------------------------------{{{
"
" let g:ctrlp_match_window_bottom = 0
" let g:ctrlp_match_window_reversed = 0
" let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_dotfiles = 0
" let g:ctrlp_switch_buffer = 0
"
" let g:ctrlp_dont_split = 'NERD_tree_2'
" let g:ctrlp_jump_to_buffer = 0
" let g:ctrlp_split_window = 0
" let g:ctrlp_max_height = 20
" let g:ctrlp_extensions = ['tag']
"
" nnoremap ; :CtrlPBuffer<CR>
" let g:ctrlp_map = '<leader>,'
" nnoremap <leader>. :CtrlPTag<cr>
"
" let g:ctrlp_prompt_mappings = {
"       \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
"       \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
"       \ 'PrtHistory(-1)':       ['<c-n>'],
"       \ 'PrtHistory(1)':        ['<c-p>'],
"       \ 'ToggleFocus()':        ['<c-tab>'],
"       \ }
"
" let my_ctrlp_ffind_command = "ffind --semi-restricted --dir %s --type e -B -f"
" let g:ctrlp_user_command = my_ctrlp_ffind_command
"
" "-13-CtrlP-}}}
