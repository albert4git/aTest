        nnoremap <F12> :TagbarToggle<CR>


        " Unimpaired {{{ provides several pairs of bracket maps.
            " [, ],
                " a - :Next/:Previous
                " b - buffer
                " l - location list
                " q - quickfix
                " t - tag
                " n - SCM conflict marker
            " encoding & decoding
                " [ - encoding -> <foo bar="baz"> => &lt;foo bar=&quot;baz&quot&gt;
                " ] - decoding ->
                " .....
        " }}}

        highlight TagListTagName    ctermfg=250
        highlight TagListTagScope   ctermfg=045
        highlight TagListTitle      ctermfg=226
        highlight TagListComment    ctermfg=235
        highlight TagListFileName   ctermfg=255 ctermbg=232


        " Tagbar {{{ <F12> Display tags of a file ordered by scope.
            " <Space> display prototype of a tag. <Enter> jump to tag o: toggle fold
            " access symbols:
            "   - + -> public
            "   - # -> protected
            "   - - -> private
            let g:tagbar_ctags_bin = '/usr/bin/ctags' " default empty, '/usr/bin/ctags'
            let g:tagbar_width = 25
            let g:tagbar_compact = 0 " omitting heading help line and blank lines.
            let g:tagbar_left = 0
            let g:tagbar_autoshowtag = 1 " auto open folds when tag in folds.
            let g:tagbar_autofocus = 0 " autofocus to tagbar window when opened.
            let g:tagbar_autoclose = 0 " auto close tagbar when you jump to tag
            let g:tagbar_sort = 1 " sort according to their name.
            let g:tagbar_expand = 1 " window be expanded by width of tagbar win if GVim.
            let g:tagbar_foldlevel = 2 " level higher than this number will be closed.
            let g:tagbar_usearrows = 0 " { Windows only }
            let g:tagbar_iconchars = ['▶', '▼'] " default on Linux and Mac.
            let g:tagbar_indent = 1 " indent for compact view.
            let g:tagbar_updateonsave_maxlines = 10000 " update when file has fewer
            " let g:tagbar_systemenc = "utf-8" " value of 'encoding'.
            " let g:tagbar_type_javascript = {
            "             \ 'ctagsbin' : '/usr/local/bin/jsctags',
            "             \ }


            " Go {{{
            let g:tagbar_type_go = {
                        \ 'ctagstype': 'go',
                        \ 'kinds' : [
                            \'p:package',
                            \'f:function',
                            \'v:variables',
                            \'t:type',
                            \'c:const'
                            \ ]
                        \ }
            " }}}

            " Markdown {{{
            let g:tagbar_type_markdown = {
                        \ 'ctagstype' : 'markdown',
                        \ 'kinds' : [
                        \ 'h:Heading_L1',
                        \ 'i:Heading_L2',
                        \ 'k:Heading_L3'
                        \ ]
                        \ }
            " }}}

            " Xquery {{{
            let g:tagbar_type_xquery = {
                        \ 'ctagstype' : 'xquery',
                        \ 'kinds'     : [
                            \ 'f:function',
                            \ 'v:variable',
                            \ 'm:module',
                            \ ]
                        \ }
            " }}}

            nnoremap <F12> :TagbarToggle<CR>

            " 1. auto open for any files.
            " autocmd VimEnter * nested :TagbarOpen
            " 2. auto open for supported filetypes.
            " augroup TagbarAutoToggle
            "     au!
            "     au VimEnter * nested :call tagbar#autoopen(1)
            " augroup END

            " {{{ colors for Tagbar.vim
            " cyan
            highlight TagbarHighlight       ctermfg=051 ctermbg=none cterm=bold
            " gray
            highlight TagbarComment         ctermfg=238 ctermbg=none cterm=none
            " green
            highlight TagbarKind            ctermfg=154 ctermbg=none cterm=bold
            " dark green
            highlight TagbarNestedKind      ctermfg=070 ctermbg=none cterm=none
            " blue
            highlight TagbarScope           ctermfg=039 ctermbg=none cterm=none
            " yellow
            highlight TagbarType            ctermfg=190 ctermbg=none cterm=none
            " orange
            highlight TagbarSignature       ctermfg=202 ctermbg=none cterm=none
            " pink
            highlight TagbarPseudoID        ctermfg=205 ctermbg=none cterm=bold
            " red
            highlight TagbarFoldIcon        ctermfg=197 ctermbg=none cterm=none
            " dark green
            highlight TagbarAccessPublic    ctermfg=022 ctermbg=none cterm=none
            " dark red
            highlight TagbarAccessProtected ctermfg=088 ctermbg=none cterm=bold
            " red
            highlight TagbarPrivate         ctermfg=196 ctermbg=none cterm=italic
            " }}}
        " }}}



    " [ tags/cscope ] {{{ <F12>
        " Tagbar {{{ <F12> Display tags of a file ordered by scope.
            " <Space> display prototype of a tag. <Enter> jump to tag o: toggle fold
            " access symbols:
            "   - + -> public
            "   - # -> protected
            "   - - -> private
            let g:tagbar_ctags_bin = '/usr/bin/ctags' " default empty, '/usr/bin/ctags'
            let g:tagbar_width = 25
            let g:tagbar_compact = 0 " omitting heading help line and blank lines.
            let g:tagbar_left = 0
            let g:tagbar_autoshowtag = 1 " auto open folds when tag in folds.
            let g:tagbar_autofocus = 0 " autofocus to tagbar window when opened.
            let g:tagbar_autoclose = 0 " auto close tagbar when you jump to tag
            let g:tagbar_sort = 1 " sort according to their name.
            let g:tagbar_expand = 1 " window be expanded by width of tagbar win if GVim.
            let g:tagbar_foldlevel = 2 " level higher than this number will be closed.
            let g:tagbar_usearrows = 0 " { Windows only }
            let g:tagbar_iconchars = ['▶', '▼'] " default on Linux and Mac.
            let g:tagbar_indent = 1 " indent for compact view.
            let g:tagbar_updateonsave_maxlines = 10000 " update when file has fewer
            " let g:tagbar_systemenc = "utf-8" " value of 'encoding'.
            " let g:tagbar_type_javascript = {
            "             \ 'ctagsbin' : '/usr/local/bin/jsctags',
            "             \ }



    " [ skeleton/template ] {{{
        " SonicTemplate {{{ Easy and high speed coding method.
            " :Template <Tab>
            let g:template_vim_template_dir = [
                        \ '$HOME/.vim/template/SonicTemplate/'
                        \ ]
                " template filename rule:
                " [kind]-[name].[extension]
                "  `- 'base' or 'snip'
                " template file keyword: {{_name_}}, {{_cursor_}}, {{_input_:var}} ....
        " }}}

        " template {{{ read the template file automatically when edit new file.
            " Usage:
            "   - :[line]TemplateLoad[!] [pattern]
            let g:template_basedir = ['$HOME/.vim/template/template']
            let g:template_files = 'template/**'
            let g:template_free_pattern = 'template'
        " }}}

        " qtmplsel {{{ select a template on creating a new file.
            "   - Search Rules:
            "       - by filetype:
            "           filetype=python -> template/python_*
            "       - by suffix:
            "           *.cpp -> template/*.cpp
            "       - by filename:
            "           Makefile -> template/Makefile_*
            " Note that especially in case 3, 'Makefile_' is a legal template
            " name but 'Makefile' is not even if you have no other template file.
            " String surrounded by '@{@' '@}@' in the template file is regarded
            " as a vim expression, and will be eval()ed on loading.
            "   e.g.
            "       @{@expand('%:t')@}@          ->  newfile.py
            "       @{@strftime('%Y-%m-%d')@}@   ->  2009-08-30
            let g:qts_templatedir = "$HOME/.vim/template/qtmplsel"
        " }}}

        " TagmaLast : Update the 'Last Changed' line in a file.
    " }}}
