
        "------------------------------------------------------------------------------------------
        "-   call unite#custom#profile('source/vim_bookmarks', 'context', {
        "-                           \   'winheight': 13,
        "-                           \   'direction': 'botright',
        "-                           \   'start_insert': 0,
        "-                           \   'keep_focus': 1,
        "-                           \   'no_quit': 1,
        "-                           \ })

        "matchtime=1
        "nnoremap x "_x
        "Disable Ex-mode.
        " colorscheme anderson
        " colorscheme molokayo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Formatting, TextMate-style
        "vnoremap W gq
        "nnoremap W gqip
        "-Line Transporter---------------------
        "nnoremap <C-down> :m .+1<CR>==
        "nnoremap <C-up> :m .-2<CR>==
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-AAA---------------------------------------------------------------------------------------------------------------{{{
"-}}}
"-AAA---------------------------------------------------------------------------------------------------------------{{{
"-}}}
"-AAA---------------------------------------------------------------------------------------------------------------{{{
"-}}}
        " let g:easytags_on_cursorhold = 1 let g:easytags_auto_update = 1 If
        " you like one of the existing styles you can link them: highlight
        " link cMember Special As mentioned above the plug-in will store your
        " tags in `~/.vimtags`
        " let g:easytags_file = '~/.vim/tags'

        " command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
        "                        \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
        "-------------------------------------------------------------------------
        "!" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        "-------------------------------------------------------------------------

        " autocmd vimrc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'

        " set tags=~/git/aTest/dotFiles/nVim/tags
        " set tags=tags,./tags,../tags,../../tags,../../../tags
        " set tags=./tags,~/.vimtags
        " set tags=""
        " set tags=tags,./tags 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "inoremap <expr><C-g> pumvisible() ? "\<C-n>" : "\<Tab>"
        "inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        "inoremap <expr><C-e> neocomplete#cancel_popup()
        "inoremap <expr><C-g> neocomplete#undo_completion()
        "inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        " inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        " inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        " inoremap <expr> <C-1>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        " inoremap <expr> <C-2>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MRU plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let MRU_Max_Entries = 400
        map <leader>f :MRU<CR>

"emulate eclipse and VS build hotkey
map          <F4> :sign unplace *<CR> <bar>:ccl<CR>
imap         <F4> <C-O>:sign unplace *<CR>
map          <F5> :make<CR>
imap         <F5> <C-O>:make<CR>

" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

"-TODO------------------------------------------------------------------------------------------------------------------
execute 'nnoremap \. :edit' resolve(expand('~/.config/nvim/init.vim')) '<CR>'
execute 'nnoremap \, :edit' resolve(expand('~/.bashrc')) '<CR>'
"-TODO------------------------------------------------------------------------------------------------------------------
"-SCROLL-------
noremap <expr> <C-f> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-b> (line('w$') >= line('$') ? 'j' : "\<C-e>")
"-TODO------------------------------------------------------------------------------------------------------------------
" Fix window position of help
autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif

"-Insert-Completion----------------------------------------------------------------------------------------------------
silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c

"-Reselect last-pasted text -------------------------------------------------------------------------------------------
nnoremap gv `[v`]

"------------------------------------------------------------------------------------------
"------------------------------------------------------------------------------------------
        " setlocal spell spelllang=en
        " set spellfile=~/.vim/spellfile.add
        " set spellfile=$HOME/.vim/spell/local.en.add
        " set spellsuggest=best,15
        " Spell commands
        nmap ?n ]s
        nmap ?p [s
        nmap ?+ zg
        nmap ?? z=
        " Fix from spellcheck
        " I can never remember if it's zg or z=, and the wrong one adds the word to
        " the DB (lol), so fuck it, just add an easier mapping.
        nnoremap zz z=
        nnoremap z= :echo "use zz you idiot"<cr>
"====[ Mappings to activate spell-checking alternatives ]================
    nmap  ;s     :set invspell spelllang=en<CR>
    nmap  ;ss    :set    spell spelllang=en-basic<CR>

    " To create the en-basic (or any other new) spelling list:
    "
    "     :mkspell  ~/.vim/spell/en-basic  basic_english_words.txt
    "
    " See :help mkspell
" Fix from spellcheck
" I can never remember if it's zg or z=, and the wrong one adds the word to
" the DB (lol), so fuck it, just add an easier mapping.
nnoremap zz z=
nnoremap z= :echo "use zz you idiot"<cr>
"------------------------------------------------------------------------------------------
"------------------------------------------------------------------------------------------

" zt is okay for putting something at the top of the screen, but when I'm
" writing prose I often want to put something at not-quite-the-top of the
" screen.  zh is "zoom to head level"
nnoremap zh mzzt10<c-u>`z

" HTML tag closing
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a

"-------------------------------------------------------------------------
nnoremap <F12> :TagbarToggle<CR>
"-------------------------------------------------------------------------
autocmd filetype vim noremap! <buffer> <F2> <Esc>:help <C-r><C-w><CR>
"-------------------------------------------------------------------------

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
        let g:ctrlp_working_path_mode = 0

        let g:ctrlp_map = '<c-f>'
        map <leader>j :CtrlP<cr>
        map <c-b> :CtrlPBuffer<cr>

        let g:ctrlp_max_height = 20
        let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
" Ctrl-P {{{
        let g:ctrlp_dont_split = 'NERD_tree_2'
        let g:ctrlp_jump_to_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_match_window_reversed = 1
        let g:ctrlp_split_window = 0
        let g:ctrlp_max_height = 20
        let g:ctrlp_extensions = ['tag']

        let g:ctrlp_map = '<leader>,'
        nnoremap <leader>. :CtrlPTag<cr>
        nnoremap <leader>b :CtrlPBuffer<cr>
        nnoremap <c-b> :CtrlPBuffer<cr>

        let g:ctrlp_prompt_mappings = {
                                \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
                                \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
                                \ 'PrtHistory(-1)':       ['<c-n>'],
                                \ 'PrtHistory(1)':        ['<c-p>'],
                                \ 'ToggleFocus()':        ['<c-tab>'],
                                \ }

        let my_ctrlp_ffind_command = "ffind --semi-restricted --dir %s --type e -B -f"
        let g:ctrlp_user_command = my_ctrlp_ffind_command

" }}}

" Unite {{{

" menus {{{
        let g:unite_source_menu_menus = {}
        nnoremap [menu] <Nop>
        nmap <LocalLeader> [menu]
        nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>
        " }}}

        " files
        nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
        nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/async<CR>
        nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
        " buffers
        nnoremap <silent><Leader>b :Unite -silent buffer<CR>
        " tabs
        nnoremap <silent><Leader>B :Unite -silent tab<CR>
        " buffer search
        nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
                                \ line<CR>
        nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
                                \ line<CR>
        " yankring
        nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
        " help
        nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
        " tasks
        nnoremap <silent><Leader>; :Unite -silent -toggle
                                \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
        " outlines (also ctags)
        nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
                                \ -direction=topleft -toggle outline<CR>

        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                    \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

        let g:unite_source_history_yank_enable = 1
        let g:unite_enable_start_insert = 0
        let g:unite_enable_short_source_mes = 0
        let g:unite_force_overwrite_statusline = 0
        let g:unite_prompt = '>>> '
        let g:unite_marked_icon = '✓'
        " let g:unite_candidate_icon = '∘'
        let g:unite_winheight = 15
        let g:unite_update_time = 200
        let g:unite_split_rule = 'botright'
        let g:unite_data_directory =OH_MY_VIM.'/tmp/unite'
        let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

" }}}

" Shortcut for [] {{{
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[
" }}}
" Numbers {{{

" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
        let num = '\v[0-9]'

        " If the current char isn't a number, walk forward.
        while getline('.')[col('.') - 1] !~# num
                normal! l
        endwhile

        " Now that we're on a number, start selecting it.
        normal! v

        " If the char after the cursor is a number, select it.
        while getline('.')[col('.')] =~# num
                normal! l
        endwhile

        " If we want an entire word, flip the select point and walk.
        if a:whole
                normal! o

                while col('.') > 1 && getline('.')[col('.') - 2] =~# num
                        normal! h
                endwhile
        endif
endfunction

" }}}


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

" nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f4> :QFixToggle<cr>
nmap <silent> <f3> :LocationToggle<cr>
"-TODO------------------------------------------------------------------------------------------------------------------
"-TODO------------------------------------------------------------------------------------------------------------------
" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
" nnoremap vv ^vg_
"-Highlight Group(s)--------------------------------
" nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"                         \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"                         \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"-TODO------------------------------------------------------------------------------------------------------------------
"-TODO------------------------------------------------------------------------------------------------------------------
" if ! exists('g:TagHighlightSettings')
"         let g:TagHighlightSettings = {}
" endif
" let g:TagHighlightSettings['TagFileName'] = 'tags'
" let g:TagHighlightSettings = {'TagFileName': 'tags', 'CtagsExecutable': 'etags.exe'}
"-TODO------------------------------------------------------------------------------------------------------------------
" Session
set sessionoptions=buffers,curdir,folds,tabpages,winsize
let s:sessiondir  = expand("~/.vim/sessions", 1)
let s:sessionfile = expand(s:sessiondir . "/session.vim", 1)
let s:sessionlock = expand(s:sessiondir . "/session.lock", 1)

        " Paredit {{{

        let g:paredit_smartjump = 1
        let g:paredit_shortmaps = 0
        let g:paredit_electric_return = 1
        let g:paredit_matchlines = 200
        let g:paredit_disable_lisp = 1
        let g:paredit_disable_clojure = 1

        function! EnableParedit()
            call PareditInitBuffer()
            " Quit fucking with my split-line mapping, paredit.
            nunmap <buffer> S
            " Also quit fucking with my save file mapping.
            nunmap <buffer> s
            " Please just stop
            nunmap <buffer> <leader>W
            nunmap <buffer> <leader>O
            nunmap <buffer> <leader>S
            " Oh my god will you fuck off already
            " nnoremap <buffer> dp :diffput<cr>
            " nnoremap <buffer> do :diffobtain<cr>
            " Eat shit
            nunmap <buffer> [[
            nunmap <buffer> ]]
            " Better mappings
            noremap <buffer> () :<c-u>call PareditWrap("(", ")")<cr>
            noremap <buffer> )( :<c-u>call PareditSplice()<cr>
            noremap <buffer> (( :<c-u>call PareditMoveLeft()<cr>
            noremap <buffer> )) :<c-u>call PareditMoveRight()<cr>
            noremap <buffer> (j :<c-u>call PareditJoin()<cr>
            noremap <buffer> (s :<c-u>call PareditSplit()<cr>
            noremap <buffer> )j :<c-u>call PareditJoin()<cr>
            noremap <buffer> )s :<c-u>call PareditSplit()<cr>
            " ))
        endfunction
        " }}}

"-AAA-------------------------------------------------------------------------------------------------------{{{
        " UndoTree {
        if isdirectory(expand("~/.vim/bundle/undotree/"))
                nnoremap <Leader>u :UndotreeToggle<CR>
                " If undotree is opened, it is likely one wants to interact with it.
                let g:undotree_SetFocusWhenToggle=1
        endif
        " }

        " Use local gvimrc if available and gui is running {
        if has('gui_running')
                if filereadable(expand("~/.gvimrc.local"))
                source ~/.gvimrc.local
                endif
        endif
        " }
"}}}




