"-AAA-Move----------------------------------------------------------------------------------------------------------{{{
        " FOKUS-POKUS 
        omap <F6> a{
        vmap <F6> a{
        "XXX let g:move_key_modifier = 'C'

        map <LocalLeader>v :e $MYVIMRC<CR>
        map <LocalLeader>s :source $MYVIMRC<CR>

        "-Auto-Commands----------------------
        augroup vimrc
                autocmd!
        augroup END
"-}}}

"-AAA-Misc----------------------------------------------------------------------------------------------------------{{{
        imap jj <Esc>
        noremap ss :wa<cr>
        noremap sq :wa<cr> :qa<cr>
        noremap qq :w<cr> :bd<cr>
        noremap xz :qa!<cr>
        noremap xc :q<cr>
        "-toggle---------------
        nmap ge :w<CR>:e #<CR>
        noremap ee :e#<CR>
        " Bash like keys for the command line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "------------------------
        nnoremap <C-P> <Up>
        nnoremap <C-N> <Down>
        "-It's-2018------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        "Better x
        "nnoremap x "_x
        "Disable Ex-mode.
        nnoremap Q  q
        "Underline the current line with '-'
        nmap <silent> <leader>- :t.<CR>Vr-
        "Select entire buffer
        nnoremap aa ggVG
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Useful save mappings.
        nnoremap <silent> <Leader>u :<C-u>update<CR>
        "Search
        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        " Yank to end of line
        nnoremap Y y$
        " Formatting, TextMate-style
        vnoremap W gq
        nnoremap W gqip
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
        "#- go to last edit position when opening files -#
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        "nnoremap vv ^vg_
        nnoremap <silent> vv <C-w>v
        "-Line Transporter-------------
        nnoremap <C-down> :m .+1<CR>==
        nnoremap <C-up> :m .-2<CR>==
        "-------------------------------------------------------------------------
"-Misc-}}}

"-AAA11-QuickFix---Search-------------------------------------------------------------------------------------------{{{
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
        "-------------------------------------------------------------------------
        function! OnlineDoc8()
                let s:browser = "firefox"
                let s:wordUnderCursor = expand("<cword>")
                let s:langs = ["c", "cpp", "ruby", "python", "php", "java", "css"]
                if  ((match(s:langs, &ft) > -1) && (&ft != ""))
                        let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor."+lang:".&ft
                else
                        let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor
                endif
                let s:cmd ="silent ! " . s:browser . " " . s:url
                execute s:cmd
                redraw!
        endfunction
        map <F10> :call OnlineDoc8()<CR>
        "------------------------------------------------------------------------ 
        function! OpenUrlUnderCursor()
                let path="/Applications/Safari.app"
                execute "normal BvEy"
                let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
                if url != ""
                        silent exec "!open -a ".path." '".url."'" | redraw! 
                        echo "opened ".url
                else
                        echo "No URL under cursor."
                endif
        endfunction
        nmap <leader>o :call OpenUrlUnderCursor()<CR>

        " OnlineDoc8
"-14-Search-QFix-}}}

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        nnoremap <c-z> :call FocusLine()<cr>
        nnoremap zO zczO    " Make zO recursively open whatever fold 
        " Focus the current line.  Basically:
        function! FocusLine()
                let oldscrolloff = &scrolloff
                set scrolloff=0
                execute "keepjumps normal! mzzMzvzt25\<c-y>\<cr>"
                let &scrolloff = oldscrolloff
        endfunction
"-}}}

"-AAA1--Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter-----------------------------------------------{{{
        if &compatible | set nocompatible | endif
        " magic
                silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
                set nospell
        " Appearance  # matchtime=1
                silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
                silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
                silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
                silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
                silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
                silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
                silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
                silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
                silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
                set splitbelow splitright
                set number
                "-AAA1.1-Extra vi-compatibility---------------------------------------------------{{{
                        set switchbuf=useopen    " reveal already opened files from the
                        set formatoptions-=o     " don't start new lines w/ com leader on press 'o'
                        au filetype vim set formatoptions-=o
                "1.1}}}
        " Editing
                silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
                silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=4 smarttab softtabstop=8
                silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
                silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
                silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
                silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
                "silent! set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
                "silent! set tags=tags,./tags 
                "set tw = 300
                "easier on the eyes
                "-???- set formatoptions = tcqw
                highlight Folded ctermbg=1
                setlocal foldmarker={{{,}}}
                setlocal foldmethod=marker
                setlocal foldminlines=6
                set foldcolumn=1 
                " Mappings to easily toggle fold levels
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap z2 :set foldlevel=2<cr>
                nnoremap z3 :set foldlevel=3<cr>
                nnoremap z4 :set foldlevel=4<cr>
                nnoremap z5 :set foldlevel=5<cr>
                "set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
        " Clipboard
                silent! set clipboard=unnamed
                silent! set clipboard+=unnamedplus
        " Performance
                silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        " Bell-Bell-Bell
                silent! set noerrorbells visualbell t_vb=
        " Move to the directory each buffer
                autocmd vimrc BufEnter * silent! lcd %:p:h
        " Fix window position of help
                autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        " Always open read-only when a swap file is found
                autocmd vimrc SwapExists * let v:swapchoice = 'o'
        " Automatically set expandtab
        " autocmd vimrc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'

        " Setting lazyredraw causes a problem on startup
                autocmd vimrc VimEnter * redraw
        " Enter, I never use the default behavior of <cr> and this saves me a keystroke...
                nnoremap <cr> o<esc>
        " Smart Enter -???-
                inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")
        " Go to the first non-blank character of the line after paragraph motions
                noremap } }^
        " select last paste
                nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
        " Command line history
                set history=4024
        " Visual shifting (does not exit Visual mode)
                vnoremap < <gv
                vnoremap > >gv
        " Allow using the repeat operator with a visual selection (!)
        " http://stackoverflow.com/a/8064607/127816
                vnoremap . :normal .<CR>
        " For when you forget to sudo.. Really Write the file.
                cmap w!! w !sudo tee % >/dev/null
        " SWITCH TO THE DIRECTORY OF THE OPEN BUFFER
                map cd :cd %:p:h<cr>
                set nowrap
                set mouse=a
"-1-}}}


"-AAA--SyntaxColor--------------------------------------------------------------------------------------------------{{{
         set list
         set listchars=tab:▸\
        "set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
         "set listchars=tab:▸\ ,eol:¬,trail:⋅

        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>

        " Show syntax highlighting groups for word under cursor
        nmap <F4> :call <SID>SynStack()<CR>
        function! <SID>SynStack()
                if !exists("*synstack")
                        return
                endif
                echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc

        " Synstack {{{
                " Show the stack of syntax hilighting classes affecting whatever is under the
                " function! SynStack2()
                "         echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
                " endfunc
                " nnoremap <F5> :call SynStack2()<CR>
        " }}}
        "----------------------------------------------------------------------------------
        function! ShowFuncKeys(bang)
                for i in range(1,12)
                        redir! => map
                        exe "silent " . (a:bang == "!" ? 'verbose' : '') . " map<F" . i . ">"
                        redir end
                        if map !~ 'No mapping found'
                                echomsg map
                        endif
                endfor
        endfunction
        com! -bang ShowFuncKeys :call ShowFuncKeys(<q-bang>)
        "----------------------------------------------------------------------------------


        "----------------------------------------------------------------------------------
        function! s:ShowMaps()
                let old_reg = getreg("a")          " save the current content of register a
                let old_reg_type = getregtype("a") " save the type of the register as well
                try
                        redir @a                           " redirect output to register a
                        " Get the list of all key mappings silently, satisfy"
                        " Press ENTER to continue"
                        silent map | call feedkeys("\<CR>")
                        redir END                          " end output redirection
                        vnew                               " new buffer in vertical window
                        put a                              " put content of register
                        " Sort on 4th character column which is the key(s)
                        %!sort -k1.4,1.4
                finally                              " Execute even if exception is raised
                        call setreg("a", old_reg, old_reg_type) " restore register a
                endtry
        endfunction
        com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function
        nnoremap \m :ShowMaps<CR>            " Map keys to call the function
"-16-vnoremap-}}}


"-AAA--CScope-------------------------------------------------------------------------------------------------------{{{
        nnoremap ff :call CscopeFindInteractive(expand('<cword>'))<CR>
        nnoremap <leader>f :call CscopeFindInteractive(expand('<cword>'))<CR>
        nnoremap <leader>\ :call ToggleLocationList()<CR>
        " s: Find this C symbol
        nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
        " g: Find this definition
        nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
        " d: Find functions called by this function
        nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
        " c: Find functions calling this function
        nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
        " t: Find this text string
        nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
        " e: Find this egrep pattern
        nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
        " f: Find this file
        nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
        " i: Find files #including this file
        nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
"-}}}

"-AAA--TextObjects-------------------------------------------------------------------------------------------------{{{
        "QUTES?"
        xmap q iq
        omap q iq

        call textobj#user#plugin('datetime', {
                                \   'date': {
                                \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
                                \     'select': ['ad', 'id'],
                                \   },
                                \   'time': {
                                \     'pattern': '\<\d\d:\d\d:\d\d\>',
                                \     'select': ['at', 'it'],
                                \   },
                                \ })

        "-TOP--------------------------------------------------------------------------------------
        call textobj#user#plugin('line', {
                                \   '-': {
                                \     'select-a-function': 'CurrentLineA',
                                \     'select-a': 'al',
                                \     'select-i-function': 'CurrentLineI',
                                \     'select-i': 'il',
                                \   },
                                \ })
        "-TOP--------------------------------------------------------------------------------------
        function! CurrentLineA()
                normal! 0
                let head_pos = getpos('.')
                normal! $
                let tail_pos = getpos('.')
                return ['v', head_pos, tail_pos]
        endfunction

        "-TOP--------------------------------------------------------------------------------------
        function! CurrentLineI()
                normal! ^
                let head_pos = getpos('.')
                normal! g_
                let tail_pos = getpos('.')
                let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
                return
                                        \ non_blank_char_exists_p \ ? ['v', head_pos, tail_pos] \ : 0
        endfunction
"-}}}


"-AAA---------------------------------------------------------------------------------------------------------------{{{
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabCrMapping = 1
"-}}}


"-AAA-Complete------------------------------------------------------------------------------------------------------{{{
        " Insert completion
        silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
        "-[completion]-auto popup menu: Tab, C-x + C-?, C-y, C-e
        set complete=.,w,b,t,i,u,k       " completion buffers
        "            | | | | | | |
        "            | | | | | | `-dict
        "            | | | | | `-unloaded buffers
        "            | | | | `-include files
        "            | | | `-tags
        "            | | `-other loaded buffers
        "            | `-windows buffers
        "            `-the current buffer
        "set completeopt-=preview " dont show preview window
        set completeopt=menu
        set completeopt=menuone " menu,menuone,longest,preview
        set completeopt=longest,menuone
        set completeopt=preview,menuone
"-16-Complete-}}}

"-AAA--Deoplete-----------------------------------------------------------------------------------------------------{{{
        call deoplete#custom#option('sources', {
                                \ 'tex' : ['buffer', 'dictionary', 'file', 'omni']
                                \})
        call deoplete#custom#source('omni', 'input_patterns', {
                                \ 'tex' : '\\(?:'
                                \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                                \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                                \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                                \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                                \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                                \ . '|\w*'
                                \ .')',
                                \}
                                \)
        " auto 
        "----------------------------------------------------------------------------------
        call deoplete#custom#option('refresh_always', v:true)
        let g:deoplete#enable_ignore_case = 1
        let g:deoplete#enable_smart_case = 1
        let g:deoplete#enable_camel_case = 1
        let g:deoplete#enable_refresh_always = 1
        let g:deoplete#max_abbr_width = 0
        let g:deoplete#max_menu_width = 0
        call deoplete#custom#source('_', 'min_pattern_length', 4)
        "inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        inoremap <silent> <C-o> <C-x><C-o>
        inoremap <silent> <C-k> <C-x><C-k>
        inoremap <silent> <C-d> <C-x><C-d>
        inoremap <silent> <C-f> <C-x><C-f>
        inoremap <silent> <C-l> <C-x><C-l>

        call deoplete#custom#source('dictionary', 'mark', '⊶')
        call deoplete#custom#source('syntax',        'mark', '♯')
        call deoplete#custom#source('tag',           'mark', '⌦')
        call deoplete#custom#source('omni',          'mark', '⌾')
        call deoplete#custom#source('vim',           'mark', 'vi')
        call deoplete#custom#source('neosnippet',    'mark', '⌘')
        call deoplete#custom#source('jedi',          'mark', '⌁')
        call deoplete#custom#source('around',        'mark', '↻')
        call deoplete#custom#source('buffer',        'mark', 'ℬ')
        call deoplete#custom#source('member', 'mark', '.')
"-Deoplete-}}}



"-AAA-Ag-----------------------------------------------------------------------------------------------------------{{{
        " command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
        "                        \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
        "-------------------------------------------------------------------------
        "!" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        "-------------------------------------------------------------------------
        " The Silver Searcher
        if executable('ag')
                let g:ag_working_path_mode="r"
                " Use ag over grep
                set grepprg=ag\ --nogroup\ --nocolor
                " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                " ag is fast enough that CtrlP doesn't need to cache
                let g:ctrlp_use_caching = 0
        endif
"-}}}

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        let g:ctrlp_map='<c-q>'
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_working_path_mode = 'ar'
        "-------------------------------------------------------------------------------
        "let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
        "nnoremap <silent> <C-o> :let g:cpsm_match_empty_query = 0<CR>:CtrlPMRU<CR>
        "nnoremap <silent> <C-p> :let g:cpsm_match_empty_query = 1<CR>:CtrlP<CR>
        "-------------------------------------------------------------------------------
"-}}}

"-UnitE ------------------------------------------------------------------------------------------------------------{{{
         " nnoremap <Leader>e :Unite bookmark<CR>
         " nnoremap <Leader>d :UniteBookmarkAdd<CR>
         "----------------------------------------------------------------------------------------
        nmap <C-u> :Unite file buffer file_mru <CR>
        "nnoremap <C-\> :Unite line<CR>
        "nnoremap <Leader>u :Unite file buffer file_mru <CR>
        "nnoremap <Leader>\ :Unite grep<CR>
        nnoremap <Leader>i :Unite -silent history/yank<CR>
        nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
        " buffer search--------------------------------------
        " nnoremap <Leader>f :Unite -silent -no-split -start-insert -auto-preview
        "         \ line<CR>
        "-outlines (also ctags)-----------------------------------------------------------
        "nnoremap <Leader>t :Unite -silent -vertical -winwidth=40
        "                        \ -direction=topleft -toggle outline<CR>
        "-Line----------------------------------------------------------------------------
        nnoremap <Leader>v :UniteWithCursorWord -silent -no-split -auto-preview
                \ line<CR>
        "---------------------------------------------------------------------------------
                nnoremap <Leader>' :Unite  buffer bookmark  <CR>
                call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                \ 'ignore_pattern', join([
                \ '\.git/',
                \ ], '\|'))
                " nnoremap <Leader>' :Unite file buffer bookmark file_mru history/yank file_rec <CR>
                " call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                " \ 'ignore_pattern', join([
                " \ '\.git/',
                " \ ], '\|'))
        "-------------------------------------------------------------------------------
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
        "-------------------------------------------------------------------------------
        call unite#filters#matcher_default#use(['matcher_fzf'])
        "-------------------------------------------------------------------------------
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        "-------------------------------------------------------------------------------
        if executable('ag')
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                let g:unite_source_grep_recursive_opt = ''
        endif
        "-------------------------------------------------------------------------------
        let g:unite_source_history_yank_save_clipboard = 1
        let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
                \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
        "-------------------------------------------------------------------------------
        " let g:unite_candidate_icon = '∘'
        let g:unite_source_history_yank_enable = 1
        let g:unite_enable_start_insert = 0
        let g:unite_enable_short_source_mes = 0
        let g:unite_force_overwrite_statusline = 0
        let g:unite_prompt = '>>> '
        let g:unite_marked_icon = '✓'
        let g:unite_winheight = 15
        let g:unite_update_time = 200
        let g:unite_split_rule = 'botright'
        let g:unite_data_directory ='~/.vim/tmp/unite'
        let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
"-UnitE-}}}


"-AAA5--GitGutter-----------------------------------------------------------------------{{{
        "let g:gitgutter_highlight_lines = 1
        let g:gitgutter_signs = 1
        let g:gitgutter_max_signs = 2000
        "-???-XXX
        nmap ]c <Plug>GitGutterNextHunk
        nmap [c <Plug>GitGutterPrevHunk
        nmap <Leader>hs <Plug>GitGutterStageHunk
        nmap <Leader>hu <Plug>GitGutterUndoHunk
        "-???-XXX
        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
        "--------------------------------------------------------------
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif
"-5-}}}


"-AAA4--EnterO--ReSel-LastPast--FormatBlock--UnFuck--Join--Typos--Maps--Abbr------------{{{
"??? Sel (charwise) cont of the cur line, Great for pasting Python lines into REPLs
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
"DDD Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

iabbrev yyy "---------------------------------------------------------------------------------
iabbrev yyy1 "---------------------------------------------------------------------------------------------
iabbrev yyy2 "-----------------------------------------------------------------------------------------------------{{{
iabbrev yyy3 "-}}}
iabbrev yyyr "....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10....+...11....+..12<esc>

iabbrev str start
iabbrev supe superuser
iabbrev que question
iabbrev #i #include
iabbrev #d #define
iabbrev cmnt /*<CR><CR>*/<Up>
iabbrev @@  alf@nomail.com
iabbrev ccopy Copyright 2013 Alf , no rights reserved.
iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iabbrev ydate <c-r>=strftime("%Y %b %d")<cr>
iabbrev todo TODO
"-4-}}}

"-AAA3--CleanExtrSps--WindResiz--Jump-------------------------------------------------------------------------------{{{
        set hidden
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "----------------------------------------------------------------------------------
        nnoremap <m-right> :vertical resize +3<cr>
        nnoremap <m-left> :vertical resize -3<cr>
        nnoremap <m-up> :resize +3<cr>
        nnoremap <m-down> :resize -3<cr>
        "----------------------------------------------------------------------------------
                function! JumpTo(jumpcommand)
                        execute a:jumpcommand
                        call FocusLine()
                        Pulse
                endfunction

                function! JumpToInSplit(jumpcommand)
                        execute "normal! \<c-w>v"
                        execute a:jumpcommand
                        Pulse
                endfunction

                function! JumpToTag()
                        call JumpTo("normal! \<c-]>")
                endfunction

                function! JumpToTagInSplit()
                        call JumpToInSplit("normal! \<c-]>")
                endfunction

                nnoremap <C-]> :silent! call JumpToTag()<cr>
                nnoremap <C-s> :silent! call JumpToTagInSplit()<cr>

                function PreviewTag3(top)
                        set previewheight=25
                        exe "silent! pclose"
                        if &previewwindow " don't do this in the preview window
                                return
                        endif
                        let w = expand("<cword>") " get the word under cursor
                        exe "ptjump " . w
                        " if any non False arg, open in simple horiz window so simply return
                        if a:top
                                return
                        endif
                        " otherwise, make it vertical
                        exe "silent! wincmd P"
                        if &previewwindow " if we really get there...
                                if has("folding")
                                        silent! .foldopen " don't want a closed fold
                                endif
                                wincmd L " move preview window to the left
                                wincmd p " back to caller
                                if !&previewwindow " got back
                                        wincmd _ endif
                        endif
                endfunction
        "inoremap <C-]> <Esc>:call PreviewTa2(0)<CR>
        "nnoremap <C-]> :call PreviewTag3(0)<CR>
        ""-------------------------------------------------------------------------------
        " wincmd _ make caller full size (I use minibufexplorer and for some reason
        " the window is altered by the preview window split and manipulation
        " so wincmd _ sets it back... your mileage may vary
        ""-------------------------------------------------------------------------------
"-3-}}}


"-AAA---TextObjects-------------------------------------------------------------------------------------------------{{{
        "QUTES?"
        "xmap q iq
        "omap q iq
        "QUTES?"
        call textobj#user#plugin('datetime', {
                                \   'date': {
                                \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
                                \     'select': ['ad', 'id'],
                                \   },
                                \   'time': {
                                \     'pattern': '\<\d\d:\d\d:\d\d\>',
                                \     'select': ['at', 'it'],
                                \   },
                                \ })
        "-TOP--------------------------------------------------------------------------------------
        call textobj#user#plugin('line', {
                                \   '-': {
                                \     'select-a-function': 'CurrentLineA',
                                \     'select-a': 'al',
                                \     'select-i-function': 'CurrentLineI',
                                \     'select-i': 'il',
                                \   },
                                \ })
        "-TOP--------------------------------------------------------------------------------------
        function! CurrentLineA()
                normal! 0
                let head_pos = getpos('.')
                normal! $
                let tail_pos = getpos('.')
                return ['v', head_pos, tail_pos]
        endfunction
        "-TOP--------------------------------------------------------------------------------------
        function! CurrentLineI()
                normal! ^
                let head_pos = getpos('.')
                normal! g_
                let tail_pos = getpos('.')
                let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
                return
                                        \ non_blank_char_exists_p \ ? ['v', head_pos, tail_pos] \ : 0
        endfunction
"-}}}

"-AAA--Bookmarks----------------------------------------------------------------------------------------------------{{{
        "let g:bookmark_save_per_working_dir = 1`     
        "let g:bookmark_manage_per_buffer = 1`        
        "let g:bookmark_auto_save_file = '/bookmarks'`
        " |------------------------------------------|-------------|------------------------------|
        " | Action                                   | Shortcut    | Command                      |
        " |------------------------------------------|-------------|------------------------------|
        " | Add/remove bookmark at current line      | `mm`        | `:BookmarkToggle`            |
        " | Add/edit/remove annotation at current li | `mi`        | `:BookmarkAnnotate <TEXT>`   |
        " | Jump to next bookmark in buffer          | `mn`        | `:BookmarkNext`              |
        " | Jump to previous bookmark in buffer      | `mp`        | `:BookmarkPrev`              |
        " | Show all bookmarks (toggle)              | `ma`        | `:BookmarkShowAll`           |
        " | Clear bookmarks in current buffer only   | `mc`        | `:BookmarkClear`             |
        " | Clear bookmarks in all buffers           | `mx`        | `:BookmarkClearAll`          |
        " | Move up bookmark at current line         | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
        " | Move down bookmark at current line       | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
        " | Move bookmark at current line to another | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
        " | Save all bookmarks to a file             |             | `:BookmarkSave <FILE_PATH>`  |
        " | Load bookmarks from a file               |             | `:BookmarkLoad <FILE_PATH>`  |
        " |------------------------------------------|-------------|------------------------------|
        let g:bookmark_auto_close = 1
        let g:bookmark_highlight_lines = 1          
        let g:bookmark_show_warning = 0           
        let g:bookmark_show_toggle_warning = 0      
        let g:bookmark_sign = '♥'
        let g:bookmark_highlight_lines = 1
        let g:bookmark_save_per_working_dir = 1
        let g:bookmark_auto_save = 1
        "------------------------------------------------------------------------ 
        nmap <Leader>m <Plug>BookmarkShowAll
        "------------------------------------------------------------------------ 
        call unite#custom#profile('source/vim_bookmarks', 'context', {
                                \   'winheight': 13,
                                \   'direction': 'botright',
                                \   'start_insert': 0,
                                \   'keep_focus': 1,
                                \   'no_quit': 1,
                                \ })
        "------------------------------------------------------------------------ 
        let g:bookmark_no_default_key_mappings = 1
        function! BookmarkMapKeys()
                nmap mm :BookmarkToggle<CR>
                nmap mi :BookmarkAnnotate<CR>
                nmap mn :BookmarkNext<CR>
                nmap mp :BookmarkPrev<CR>
                nmap ma :BookmarkShowAll<CR>
                nmap mc :BookmarkClear<CR>
                nmap mx :BookmarkClearAll<CR>
                nmap mkk :BookmarkMoveUp
                nmap mjj :BookmarkMoveDown
        endfunction
        "------------------------------------------------------------------------ 
        function! BookmarkUnmapKeys()
                unmap mm
                unmap mi
                unmap mn
                unmap mp
                unmap ma
                unmap mc
                unmap mx
                unmap mkk
                unmap mjj
        endfunction
        autocmd BufEnter * :call BookmarkMapKeys()
        autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
"-}}}

"-Wildmenu-completion------------------------------------------------------------------{{{
        " Save when losing focus
        au FocusLost * :silent! wall
        set wildmenu
        set wildmode=list:longest
        set wildignore+=.hg,.git,.svn                    " Version control
        set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
        set wildignore+=*.spl                            " compiled spelling word lists
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=*.DS_Store                       " OSX bullshit
        set wildignore+=*.luac                           " Lua byte code
        set wildignore+=migrations                       " Django migrations
        set wildignore+=*.pyc                            " Python byte code
        set wildignore+=*.orig                           " Merge resolution files
        set wildignore+=*.fasl                           " Lisp FASLs
        set wildignore+=*.dx64fsl                        " CCL
        " Clojure/Leiningen
        set wildignore+=classes
        set wildignore+=lib
"-Wild-}}}



"-AAA--Ulty--Neo----------------------------------------------------------------------------------------------------{{{
        "-TODO- 
        if has("eval")
                " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
                "-???-
                let g:UltiSnipsListSnippets="<C-R><tab>"
        endif
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
                set omnifunc=syntaxcomplete#Complete


        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "inoremap <expr> <C-g> neocomplete#undo_completion()
        "inoremap <expr> <C-l> neocomplete#complete_common_string()
        "inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        "inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
        "inoremap <expr> <C-e> neocomplete#cancel_popup()
        let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#auto_completion_start_length = 2
        let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
        let g:neocomplete#enable_fuzzy_completion = 1
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set previewheight=15
        set report=0 " always report changed lines
"-6-}}}

"-AAA---MiniPlugIn--------------------------------------------------------------------------------------------------{{{
        " Error Toggles {{{
                command! ErrorsToggle call ErrorsToggle()
                function! ErrorsToggle() " {{{
                        if exists("w:is_error_window")
                                unlet w:is_error_window
                                exec "q"
                        else
                                exec "Errors"
                                lopen
                                let w:is_error_window = 1
                        endif
                endfunction " }}}

                command! LocationToggle call LocationToggle()
                function! LocationToggle() " {{{
                        if exists("w:is_location_window")
                                unlet w:is_location_window
                                exec "q"
                        else
                                lopen
                                let w:is_location_window = 1
                        endif
                endfunction " }}}

                command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
                function! QFixToggle(forced) " {{{
                        if exists("g:qfix_win") && a:forced == 0
                                cclose
                                unlet g:qfix_win
                        else
                                copen 10
                                let g:qfix_win = bufnr("$")
                        endif
                endfunction " }}}
                " nmap <silent> <fx> :ErrorsToggle<cr>

                "-Open-Quickfix-window-automatically---------------------------
                autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
                autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p
                "--------------------------------------------------------------
                "-Next error/grep match
                map          <F7>       :FirstOrNextInList<CR>
                imap         <F7>       <C-O><F7>
                "-previous error/grep match
                map          <S-F7>      :PrevInList<CR>
                imap         <S-F7>      <C-O><S-F7>
                "-current error/grep match
                map          <C-F7>      :CurInList<CR>
                imap         <C-F7>      <C-O><C-F7>
                "-on-quickfix--------------------------------------------------
                nmap <silent> <F9> :QFixToggle<cr>
                map         <S-F9>     :copen<CR>
                imap        <S-F9>     <C-O><C-F9>
                map         <C-F9>     :cclose<CR>
                imap        <C-F9>     <C-O><C-F9>
                "--------------------------------
                nnoremap <LocalLeader>b :cprev<cr>zvzz
                nnoremap <LocalLeader>n :cnext<cr>zvzz
                "-on-location-list----------------------------------------------
                nmap <silent> <f8> :LocationToggle<cr>
                map         <S-F8>     :lopen<CR>
                imap        <S-F8>     <C-O><C-F8>
                map         <C-F8>     :lclose<CR>
                imap        <C-F8>     <C-O><S-F8>
                nnoremap <Leader>n :lnext<cr>zvzz
                nnoremap <Leader>b :lprev<cr>zvzz
                "---------------------------------------------------------------
                silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
                "Ex: Put Pull word under cursor into LHS of a subs ztitute (replace)
                "nnoremap <LocalLeader>w :%s#\<<C-r>=expand("<cword>")<CR>\>#
                nnoremap <Leader>; :%s#\<<C-r>=getline(".")<CR>\>#
                "-------------------------------------------------------------------------
                " Clear hlsearch and set nopaste
                nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
                "-------------------------------------------------------------------------
                nmap <silent> n nzz
                nmap <silent> N Nzz
                nmap <silent> g* g*zz
                nmap <silent> g# g#zz
                "-------------------------------------------------------------------------
                nnoremap <F12> :TagbarToggle<CR>
                "-------------------------------------------------------------------------
                autocmd filetype vim noremap! <buffer> <F2> <Esc>:help <C-r><C-w><CR>
                "-------------------------------------------------------------------------
                " Super useful! From an idea by Michael Naumann
                vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
                vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
                "----------------------------------------------------------------------------------
                "nnoremap <Leader>g :grep -R <cword> .<cr>
                "----------------------------------------------------------------------------------
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                nnoremap <leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ag <cword> .<cr>
        "-Toggle-}}}

"-Mini}}}


"-NERD-Tree {{{
        noremap  <F3> :NERDTreeToggle<cr>
        inoremap <F3> <esc>:NERDTreeToggle<cr>

        augroup ps_nerdtree
                au!

                au Filetype nerdtree setlocal nolist
                au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
                au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
                " au Filetype nerdtree nnoremap <buffer> K :q<cr>
        augroup END

        let NERDTreeHighlightCursorline = 1
        let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                        \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                        \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                        \ '^tags$',
                        \ '^.*\.meta$',
                        \ '^.*\.fasl$',
                        \ '^.*\.dx64fsl$',
                        \ '.*\.bcf$', '.*\.blg$', '.*\.fdb_latexmk$', '.*\.bbl$', '.*\.aux$', '.*\.run.xml$', '.*\.fls$',
                        \ '.*\.midi$']

        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
        let NERDChristmasTree = 1
        let NERDTreeChDirMode = 2
        let NERDTreeMapJumpFirstChild = 'gK'
" }}}

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        " autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r <CR>
        " autocmd filetype cpp nnoremap<F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
        " autocmd filetype cpp nnoremap<F7> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
"-}}}

"-Fugitive----------------------------------------------------------------------------------------------------------{{{
        augroup ft_fugitive
                au!
                nnoremap <leader>gd :Gdiff<cr>
                nnoremap <leader>gs :Gstatus<cr>
                nnoremap <leader>gw :Gwrite<cr>
                nnoremap <leader>ga :Gadd<cr>
                nnoremap <leader>gb :Gblame<cr>
                nnoremap <leader>gco :Gcheckout<cr>
                nnoremap <leader>gci :Gcommit<cr>
                nnoremap <leader>gm :Gmove<cr>
                nnoremap <leader>gr :Gremove<cr>
                nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
                au BufNewFile,BufRead .git/index setlocal nolist
        augroup END
        " " "Hub"
        " vnoremap <leader>H :Gbrowse<cr>
        " nnoremap <leader>H V:Gbrowse<cr>
        "
        " " "(Upstream) Hub"
        " vnoremap <leader>u :Gbrowse @upstream<cr>
        " nnoremap <leader>u V:Gbrowse @upstream<cr>
"-}}}

"-AAA15-Diff----------------------------------------------------------------------------{{{
         " This is from https://github.com/sgeb/vim-diff-fold/ without the extra
         function! DiffFoldLevel()
                 let l:line=getline(v:lnum)
                 if l:line =~# '^\(diff\|Index\)'     " file
                         return '>1'
                 elseif l:line =~# '^\(@@\|\d\)'  " hunk
                         return '>2'
                 elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
                         return '>2'
                 elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
                         return '>2'
                 else
                         return '='
                 endif
         endfunction
        "----------------------------------------------------------------------------------
         augroup ft_diff
             au!
             " autocmd FileType diff setlocal foldmethod=expr
             autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
         augroup END
         " See :help DiffOrig
                 command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
         " Diffget/diffput in visual mode
                 vmap            dg             :diffget<CR>
                 vmap            dp             :diffput<CR>
         " diff-diff-diff
                 nnoremap <silent> <expr> <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
         " Diffoff-Diffoff
                 nnoremap do :diffoff!<cr>
         " diffoff used to set wrap as a side effect
                 command! Diffoff        diffoff | setlocal nowrap
"-15-Diff-}}}


"-AAA--SyntasticCheck----------------------------------------------------------------------------------------------{{{
        noremap <C-F10> :SyntasticCheck<CR>
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""let g:syntastic_java_checkers = ['checkstyle']
        let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
        let g:systastic_python_checkers = ['pylint', 'python']
        let g:syntastic_mode_map = {'mode': 'active'}
        let g:syntastic_python_pylint_quiet_messages = {}
        let g:syntastic_enable_signs = 1
        let g:syntastic_auto_jump = 1
        let g:syntastic_enable_highlighting = 1
        let g:syntastic_echo_current_error  = 1
        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_php_checkers=['php']
        let g:syntastic_css_checkers=['csslint']
        let g:syntastic_check_on_w = 1
"-}}}

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        " cyan
        highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
        highlight TagListTagName    ctermfg=250
"-}}}

"-AAA----fzf--------------------------------------------------------------------------------------------------------{{{
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        "---------------------------------------------------------------------------------
        " This is the default extra key bindings
        let g:fzf_action = {
                                \ 'ctrl-t': 'tab split',
                                \ 'ctrl-x': 'split',
                                \ 'ctrl-v': 'vsplit' }
        " Default fzf layout down / up / left / right
        let g:fzf_layout = { 'down': '~40%' }
        "---------------------------------------------------------------------------------
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

        " Enable per-command history.
        " CTRL-N and CTRL-P will be automatically bound to next-history and
        " previous-history instead of down and up. If you don't like the change,
        " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
        let g:fzf_history_dir = '~/.vim/tmp/fzf-history'
        "---------------------------------------------------------------------------------
        "imap <C-w> <plug>(fzf-complete-word)
        "imap <C-s> <plug>(fzf-complete-line)
        "imap <C-v> <plug>(fzf-complete-file-ag)
        "imap <c-x><c-f> <plug>(fzf-complete-path)
        "imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        "imap <c-x><c-l> <plug>(fzf-complete-line)
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)
        " Advanced customization using autoload functions
        "inoremap <expr> <c-z>fzf#vim#complete#word({'left': '15%'})
        inoremap <expr> <c-k> fzf#vim#complete ('cat  /home/red/git/aTest/dotFiles/DICT/english-words.txt')
        " Global line completion (not just open buffers. ripgrep required.)
        inoremap <expr> <c-c> fzf#vim#complete(fzf#wrap({
                                \ 'prefix': '^.*$',
                                \ 'source': 'rg -n ^ --color always',
                                \ 'options': '--ansi --delimiter : --nth 3..',
                                \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
        "---------------------------------------
        " ('cat /usr/share/dict/words')
        "------------------------------------------------------------
        function! s:fzf_statusline()
                " Override statusline as you like
                highlight fzf1 ctermfg=161 ctermbg=1
                highlight fzf2 ctermfg=23 ctermbg=2
                highlight fzf2 ctermfg=237 ctermbg=0
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()
        "------------------------------------------------------------
        " Override Colors command. You can safely do this in your .vimrc as fzf.vim
        " will not override existing commands.
        command! -bang Colors
                \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
        "------------------------------------------------------------
        "   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
        "   :Ag! - Start fzf in fullscreen and display the preview window above
        command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)

        "------------------------------------------------------------
        " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
        " :Rg 
        command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
        "------------------------------------------------------------
        " Likewise, Files command with preview window
        command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

        "------------------------------------------------------------
"-fzf-}}}

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        nnoremap <leader>j :call g:CursorHistForward()<CR>
        nnoremap <leader>k :call g:CursorHistBack()<CR>
"-TOP-------------------------------------------------------------------------------------------------------------------
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_do_mapping = 0 " Disable default mappings
        "nmap <Leader>/ <Plug>(easymotion-w)
        "map  <Leader>w <Plug>(easymotion-bd-w)
        "------------------------------------------------------------------------ 
        nmap s <Plug>(easymotion-s)
        omap <LocalLeader>l  <Plug>(easyoperator-line-select)
        xmap <LocalLeader>l  <Plug>(easyoperator-line-select)
        nmap <LocalLeader>w <Plug>(easymotion-overwin-w)
        nmap <LocalLeader><LocalLeader> <Plug>(easymotion-w)
"------------------------------------------------------------------------------------------
