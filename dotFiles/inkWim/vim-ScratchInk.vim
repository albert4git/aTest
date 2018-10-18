" Key Reference Table {
    "<BS>           Backspace
    "<Tab>          Tab
    "<CR>           Enter
    "<Enter>        Enter
    "<Return>       Enter
    "<Esc>          Escape
    "<Space>        Space
    "<Up>           Up arrow
    "<Down>         Down arrow
    "<Left>         Left arrow
    "<Right>        Right arrow
    "<F1> - <F12>   Function keys 1 to 12
    "#1, #2..#9,#0  Function keys F1 to F9, F10
    "<Insert>       Insert
    "<Del>          Delete
    "<Home>         Home
    "<End>          End
    "<PageUp>       page-up
    "<PageDown>     page-down
" }

" Key Mappings {

    let $MAPDIR=$HOME."/.yuhc-vim/bundle/mappings"

    "Map Leader key
    let mapleader = ","

    " Copy and paste
    map <Leader><C-c> "+y
    map <Leader><C-v> "+gP

    " Select all and copy
    map <Leader>a ggVG"+y

    " Toogle Mouse
    map <Leader>m :set mouse=a<CR>
    map <Leader>M :set mouse=<CR>

    " Insert the current date
    map <Leader>d :read !date --rfc-3339=date<CR>kJ$
    map <Leader>D :read !date -R<CR>kJ

    " Add a reStructuredText link
    map <Leader>l o``_<CR>.. _``: link<ESC>k2b

    " Python Debugging
    map <Leader>p Oimport pdb; pdb.set_trace()
    map <Leader>P Oprint("variable=%s" % variable)<Esc>

    """ Reformat text
    "map <Leader>f gq}
    "map <Leader>F gqG

    " Reformat codes
    """ Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    """ Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    " Tabs control
    """ <C-t> create a new tab
    nnoremap <C-t>                :tabnew<Space>
    inoremap <C-t> <Esc>          :tabnew<Space>
    """ <C-Tab> next tab
    noremap  <C-Tab>              :<C-U>tabnext<CR>
    inoremap <C-Tab> <C-\><C-N>   :tabnext<CR>
    cnoremap <C-Tab> <C-C>        :tabnext<CR>
    """ <C-SHIFT-Tab> previous tab
    noremap  <C-S-Tab>            :<C-U>tabprevious<CR>
    inoremap <C-S-Tab> <C-\><C-N> :tabprevious<CR>
    cnoremap <C-S-Tab> <C-C>      :tabprevious<CR>
    """ vim key-mappings
    nnoremap th  :tabfirst<CR>
    nnoremap tj  :tabnext<CR>
    nnoremap tk  :tabprev<CR>
    nnoremap tl  :tablast<CR>
    nnoremap tt  :tabedit<Space>
    nnoremap tn  :tabnew<CR>
    nnoremap tm  :tabm<Space>
    nnoremap td  :tabclose<CR>

    """ Navigate between split panes
    nnoremap gh <C-W><C-H>
    nnoremap gj <C-W><C-J>
    nnoremap gk <C-W><C-K>
    nnoremap gl <C-W><C-L>
    nnoremap g\ <C-W><C-V>
    nnoremap g- <C-W><C-S>

    " Toggle paste mode
    nnoremap <F3> :set invpaste paste?<CR>
    set pastetoggle=<F3>
    set showmode

    " Auto format codes
    noremap <F4> :Autoformat<CR>
    """ formatt upon saving
    """ au BufWrite * :Autoformat

    " CScope
    source $MAPDIR/cscope_maps.vim
    nmap <F8> :TagbarToggle<CR>

" }

" End of mappings.vimCOMPLETION CAN BE DONE FOR:

        1. Whole lines                                          i_CTRL-X_CTRL-L
        2. keywords in the current file                         i_CTRL-X_CTRL-N
        3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
        4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T
        5. keywords in the current and included files           i_CTRL-X_CTRL-I
        6. tags                                                 i_CTRL-X_CTRL-]
        7. file names                                           i_CTRL-X_CTRL-F
        8. definitions or macros                                i_CTRL-X_CTRL-D
        9. Vim command-line                                     i_CTRL-X_CTRL-V
        10. User defined completion                             i_CTRL-X_CTRL-U
        11. omni completion                                     i_CTRL-X_CTRL-O
        12. Spelling suggestions                                i_CTRL-X_s
        13. keywords in 'complete'                              i_CTRL-N

        "------------------------------------------
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set ruler

        augroup NrHighlight
        autocmd!
        autocmd WinEnter * hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
        autocmd WinLeave * hi LineNr ctermfg=274 guifg=#e9e9e9 ctermbg=133 guibg=#212121
        augroup END


        "------------------------------------------
        if has('statusline')
                set laststatus=2
                set statusline=%<%f\                     " Filename
                set statusline+=%w%h%m%r                 " Options
                set statusline+=\ [%{&ff}/%Y]            " Filetype
                set statusline+=\ [%{getcwd()}]          " Current dir
                set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        endif

setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal completefunc=thesaurus_query#auto_complete_integrate
setlocal errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

        "hi StatusLineNC  ctermbg=3 ctermfg=6  cterm=NONE
        hi CursorLine term=bold cterm=bold
        "set showtabline
        imap <c-s> <plug>(fzf-complete-line)
        "set makeprg='$HOME/.vim/cmake_makeprg.sh'
        "echo syntastic#util#system('echo "$PATH"')
        "------------------------------------------------------------------------------------------
        "set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\*;else\ some_custom_command;fi

        " remove spaces at the end of lines
        nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>



hi StatusLine                  ctermfg=8     ctermbg=2     cterm=NONE
hi StatusLineNC                ctermfg=2     ctermbg=8     cterm=NONE

        ""My stuff --------------------------------------------------------------------------
        let g:quickrun_known_file_types = {
                \"cpp": ["!g++ %", "./a.out"],
                \"c": ["!gcc %", "./a.out"],
                \"php": ["!php %"],
                \"vim": ["source %"],
                \"py": ["!python %"],
        \}

        " Underline the current line with '-'
        "nmap <silent> <leader>ul :t.<CR>Vr-
        "nmap <silent> ll :t.<CR>Vr-

        " Pushing
        nnoremap <leader>Go :Start! git push origin<cr>
        nnoremap <leader>Gu :Start! git push upstream<cr>
"---AAA2---------------------------------------------------------------------------------------------------------- {{{
        "?"" switch between header/source with F4
        "?"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
        "?"" recreate tags file with F5
        "?"map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
        " Rebuild Ctags (mnemonic RC -> CR -> <cr>)
        " nnoremap <leader><cr> :silent !myctags >/dev/null 2>&1 &<cr>:redraw!<cr>
        "?"" create doxygen comment
        "?"map <F6> :Dox<CR>
        "?"" build using makeprg with <F7>
        "?"map <F7> :make<CR>
        "?"" build using makeprg with <S-F7>
        "?"map <S-F7> :make clean all<CR>
        "?"" goto definition with F12
        "?"map <F12> <C-]>
        " Highlight Group(s)
        "nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        "                       \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        "                       \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
        "--++-+-----------------------------------------------------------------------------
        "?" nnoremap <C-c> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
        "?" map <F7> :w <CR> :!gcc % -o %< && ./%< <CR>
        "?" map <F8> :!./%<<CR>
        "?" autocmd filetype cpp nnoremap <F6> :!g++ % -ggdb -o %:r <CR>
        "?" autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
        "?" autocmd filetype cpp nnoremap <F8> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
        "?" map <F7> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d")<CR>p'tzt`s
        "'showtabline'
        "--++-+-----------------------------------------------------------------------------
" }}}

        "--------------------------------------------------
        "### ExPanSion ###
        "--------------------------------------------------
        " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        "    \ <SID>check_back_space() ? "\<TAB>" :
        "    \ neocomplete#start_manual_complete()
        " inoremap <S-TAB> <C-p>
        "--------------------------------------------------
        "------------------------------------------
        "- " omnicompletion : words
        "- inoremap <leader>, <C-x><C-o>
        "- " omnicompletion : filenames
        "- inoremap <leader>: <C-x><C-f>
        "- " omnicompletion : lines
        "- inoremap <leader>= <C-x><C-l>
        "------------------------------------------


        "- hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        "- hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        "- hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
        "- Some convenient mappings
        "- inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        "- if exists('g:spf13_map_cr_omni_complete')
        "- inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
        "- endif
        "- inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        "- inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        "- inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        "- inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
        vmap sb "zdi"<C-R>z"<ESC>
        vmap st "zdi( <C-R>z )<ESC>

        " Marks and Quotes
        noremap ' `

        " Reverse Strig
        nnoremap ll :let @z=@"<cr>x$p:let @"=@z<cr>

        " HTML tag closing
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
        " Stop it, hash key.
        inoremap # X<BS>#
        ""My stuff --------------------------------------------------------------------------
        let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' :CACHE.'/vimshell/command-history',
        \ 'java' : '~/.vim/dict/java.dict,~/.vim/dict/ruby.dict',
        \ 'ruby' : '~/.vim/dict/ruby.dict',
        \ 'scala' : '~/.vim/dict/scala.dict',
        \ }

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Pressing ,ss will toggle and untoggle spell checking
        map <leader>ss :setlocal spell!<cr>
        map <leader>sn ]s
        map <leader>sp [s
        map <leader>sa zg
        map <leader>s? z=
        " Fix from spellcheck
        " I can never remember if it's zg or z=, and the wrong one adds the word to
        " the DB (lol), so fuck it, just add an easier mapping.

         Files, backups and undo
         Turn backup off, since most stuff are in git anyway...
         enable persistent undo
         if has('persistent_undo')
             set undodir=$HOME/.vim/.undofile
             set undofile
             set undolevels=1000            " maximum number of changes that can be undone
             set undoreload=10000           " maximum number lines to save for undo on a buffer reload
             if ! isdirectory(&undodir)
                 call mkdir(&undodir, 'p')
             endif
         endif
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        noremap <leader>a =ip
        noremap cp yap<S-}>p

        <b>
                "###"
                onoremap <F7>  i{
                onoremap <F8>  a{
                vnoremap <F7>  i{
                vnoremap <F8>  a{
                <t>
                        onoremap <F9> i[
                        onoremap <F10> a[
                        vnoremap <F9> i[
                        vnoremap <F10> a[
                </t>
                onoremap <F9> i>
                onoremap <F10> a>
                vnoremap <F9> i>
                vnoremap <F10> a>
                "###"
        </b>

        "?"- onoremap aa  a>
        "?"- xnoremap aa  a>
        "?"- onoremap ia  i>
        "?"- xnoremap ia  i>

        "#NEW#"
        onoremap <F7>  i(
        onoremap <F8>  a(
        vnoremap <F7>  i(
        vnoremap <F8>  a(

        onoremap <F9> i{
        onoremap <F10> a{
        vnoremap <F9> i{
        vnoremap <F10> a{

        onoremap <F12> a[
        vnoremap <F12> a[
        "#NEW#"
        "###"
        onoremap <F7>  i(
        onoremap <S-F7>  a(
        vnoremap <F7>  i(
        vnoremap <S-F7>  a(

        onoremap <F9> i{
        onoremap <S-F9> a{
        vnoremap <F9> i{
        vnoremap <S-F9> a{

        vnoremap <F12> i[
        vnoremap <S-F12> a[
        "###"
        "###"
        vnoremap <F7>  i(
        vnoremap <S-F7>  a(

        vnoremap <F8> i{
        vnoremap <S-F8> a{

        vnoremap <F9> i[
        vnoremap <S-F9> a[

        noremap <F10> =ip
        noremap <F12> yap<S-}>p

        "###"
        "-----------------------------------------------------------------------------------------------
                        [
                        <b>
                                function ( nothing is > somthing)
                                        {
                                                SignLines() range
                                        let n = a:firstline
                                        execute(":sign define fixme text=!! texthl=Todo")
                                        while n <= a:lastline
                                                if getline(n) =~ '\(TODO\|FIXME\)'
                                                execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
                                                endif
                                                let n = n + 1
                                        endwhile
                                        }
                                endfunction
                        </b>
                        ]
        "map <FF> :call SignLines()<CR>


        "-----------------------------------------------------------------------------------------------
        function! SignLines() range
            let n = a:firstline
            execute(":sign define fixme text=!! texthl=Todo")
            while n <= a:lastline
                if getline(n) =~ '\(TODO\|FIXME\)'
                    execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
                endif
                let n = n + 1
            endwhile
        endfunction
        "map <FF> :call SignLines()<CR>

        "?"- onoremap aa  a>
        "?"- xnoremap aa  a>
        "?"- onoremap ia  i>
        "?"- xnoremap ia  i>

        "?"- onoremap if :<c-u>normal! [zv]z<cr>
        "?"- onoremap af :<c-u>normal! [zV]z<cr>
        "?"- vnoremap if :<c-u>normal! ]zv[z<cr>
        "?"- vnoremap af :<c-u>normal! ]zV[z<cr>
        "?"-
        "?"- onoremap ir i[
        "?"- onoremap ar a[
        "?"- vnoremap ir i[
        "?"- vnoremap ar a[
        "?"-
        "?"- " Better x
        "?"- nnoremap x "_x
        "?"-
        "?"- " a>, i], etc...
        "?"- " <angle>
        "?"- onoremap aa  a>
        "?"- xnoremap aa  a>
        "?"- onoremap ia  i>
        "?"- xnoremap ia  i>
        "?"-
        "?"- " [rectangle]
        "?"- onoremap ar  a]
        "?"- xnoremap ar  a]
        "?"- onoremap ir  i]
        "?"- xnoremap ir  i]
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- """"""""""""""""""""""""""""""
        "?"- " => Vim grep
        "?"- """"""""""""""""""""""""""""""
        "?"- let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
        "?"- set grepprg=/bin/grep\ -nH
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- " => surround.vim config
        "?"- " Annotate strings with gettext
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- vmap Si S(i_<esc>f)
        "?"- au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- " => Git gutter (Git diff)
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- let g:gitgutter_enabled=0
        "?"- nnoremap <silent> <leader>d :GitGutterToggle<cr>
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- " => Vim-go
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- let g:go_fmt_command = "goimports"
        "?"-
        "?"-
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- " => Syntastic (syntax checker)
        "?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"- let g:ale_linters = {
        "?"- \   'javascript': ['jshint'],
        "?"- \   'python': ['flake8'],
        "?"- \   'go': ['go', 'golint', 'errcheck']
        "?"- \}
        "?"-
        "?"- nmap <silent> <leader>a <Plug>(ale_next_wrap)
        "?"-
        "?"- " Disabling highlighting
        "?"- let g:ale_set_highlights = 0
        "?"-
        "?"- " Only run linting when saving the file
        "?"- let g:ale_lint_on_text_changed = 'never'
        "?"- let g:ale_lint_on_enter = 0
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Map alt-v in command-line mode to replace the commandline
        " with the Ex command-line beneath the cursor in the buffer
        "cnoremap <Esc>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        "?"-"My stuff --------------------------------------------------------------------------
        "?"-"https://github.com/Shougo/neocomplete.vim/issues/332
        "?"- if !exists('g:neocomplete#sources#omni#input_patterns')
        "?"-   let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
        "?"-   let g:neocomplete#enable_at_startup = 1
        "?"-   let g:neocomplete#enable_auto_select = 1
        "?"-   let g:neocomplete#enable_smart_case = 1
        "?"-   let g:neocomplete#auto_completion_start_length = 2
        "?"-   let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
        "?"-   let g:neocomplete#enable_fuzzy_completion = 1
        "?"-   if !exists('g:neocomplete#same_filetypes')
        "?"-     let g:neocomplete#same_filetypes = {}
        "?"-   endif
        "?"-
        "?"-   let g:neocomplete#same_filetypes._ = '_'
        "?"-   g:neocomplcache_enable_at_startup = 1
        "?"-   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"-   " disable for Python
        "?"-   """"""""""""""""""""
        "?"-   " \'')
        "?"-   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"-   " Plugin key-mappings.
        "?"-   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "?"-   inoremap <expr> <C-g> neocomplete#undo_completion()
        "?"-   inoremap <expr> <C-l> neocomplete#complete_common_string()
        "?"-   """ <CR>: cancel popup and insert newline.
        "?"-   """ <TAB>: completion.
        "?"-   inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        "?"-   inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
        "?"-   inoremap <expr> <C-e> neocomplete#cancel_popup()
        "?"-   " <C-h>, <BS>: close popup and delete backword char.
        "?"- endif
        "
        "
        "
        "
"========================================================================
" let g:ycm_semantic_triggers.tex = [
"       \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
"       \ 're!\\hyperref\[[^]]*',
"       \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\(include(only)?|input){[^}]*'
"       \ ]
"========================================================================
" if !exists('g:ycm_semantic_triggers')
"   let g:ycm_semantic_triggers = {}
" endif
" let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" let g:ycm_key_invoke_completion = '<C-a>'
"========================================================================
The resources can also be set with arguments to Vim:
argument		meaning	~
*-gui*
-display {display}	Run vim on {display}		*-display*
-iconic		Start vim iconified		*-iconic*
-background {color}	Use {color} for the background	*-background*
-bg {color}		idem				*-bg*
-foreground {color}	Use {color} for normal text	*-foreground*
-fg {color}		idem				*-fg*
-ul {color}		idem				*-ul*
-font {font}		Use {font} for normal text	*-font*
-fn {font}		idem				*-fn*
-boldfont {font}	Use {font} for bold text	*-boldfont*
-italicfont {font}	Use {font} for italic text	*-italicfont*
-menufont {font}	Use {font} for menu items	*-menufont*
-menufontset {fontset} Use {fontset} for menu items	*-menufontset*
-mf {font}		idem				*-mf*
-geometry {geom}	Use {geom} for initial geometry	*-geometry*
-geom {geom}		idem, see |-geometry-example|	*-geom*
-borderwidth {width}	Use a border width of {width}	*-borderwidth*
-bw {width}		idem				*-bw*
*-scrollbarwidth*
-scrollbarwidth {width}	Use a scrollbar width of {width}
-sw {width}		idem				*-sw*
-menuheight {height}	Use a menu bar height of {height} *-menuheight*
-mh {height}		idem				*-mh*
NOTE: On Motif the value is ignored, the menu height
is computed to fit the menus.
-reverse		Use reverse video		*-reverse*
-rv			idem				*-rv*
+reverse		Don't use reverse video		*-+reverse*
+rv			idem				*-+rv*
-xrm {resource}	Set the specified resource	*-xrm*

Note about reverse video: Vim checks that the result is actually a light text
on a dark background.  The reason is that some X11 versions swap the colors,
and some don't.  These two examples will both give yellow text on a blue
background:
    gvim -fg Yellow -bg Blue -reverse
    gvim -bg Yellow -fg Blue -reverse
