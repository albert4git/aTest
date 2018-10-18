        " [ grep ]
        " internal(vimgrep) : use Vim search patterns, slower(read into memory)
        " external(grep) : used when the vim grep does not do what you want.
        if system("grep 'Ubuntu' /etc/issue") =~? 'Ubuntu' || executable("ack-grep")
                " set grepprg=ack-grep\ -H\ --nogroup\ --nocolor
                set grepprg=ack-grep\ -a
        elseif executable("ack")
                " set grepprg=ack\ -H\ --nogroup\ --nocolor
                set grepprg=ack\ -a
        else
                " 'grep -n', 'grep -n* /dev/null'
                set grepprg=grep\ -n\*\ /dev/null
        endif

        " [ match ]
        set showmatch
        set matchpairs+=(:),{:},[:],<:>
        set matchpairs+=':'
        set matchtime=5
        " }}}

        " [ spell check ] {{{ C-X,C-N,C-P ]s [s zg zw zuw zug z= :help spell.txt
        set nospell
        set dictionary=/usr/share/dict/words " dictionary for spell.
        augroup ToggleSpell
                au!
                au FileType mail,tex,markdown,vimwiki,org,tpp setlocal spell
        augroup END
        set spelllang=en " en: all, en_gb: Great Britain.
        set spellsuggest=best " default and fast list.
        set spellfile=~/.vim/spell/en.utf-8.add " 'zg': add, 'zw': remove.
        " :mkspell command to generate a vim spell file from word lists.
        nnoremap <silent> <Leader>sc :set invspell spell?<CR>
        " }}}


        " [ completion ] {{{ auto popup menu: Tab, C-x + C-?, C-y, C-e
        " [ completion options ]
        set complete=.,w,b,t,i,u,k       " completion buffers
        "            | | | | | | |
        "            | | | | | | `-dict
        "            | | | | | `-unloaded buffers
        "            | | | | `-include files
        "            | | | `-tags
        "            | | `-other loaded buffers
        "            | `-windows buffers
        "            `-the current buffer
        set completeopt=menuone " menu,menuone,longest,preview
        set completeopt-=preview " dont show preview window

        " [ popup menu ]
        set pumheight=20 " popup menu height. 0: long




        " SuperCleverTab() for omni-completion or insert <Tab> {{{
        function! SuperCleverTab()
            if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
                return "\<Tab>"
            else
                " use omnifunc
                if &omnifunc != ''
                    return "\<C-X>\<C-O>"
                " use dictionary option with /usr/share/dict/words
                elseif &dictionary != ''
                    return "<C-X>\<C-K>"
                else
                    return "\<C-X>\<C-N>"
                endif
            endif
        endfunction



    " [ tab ] {{{
    set smarttab " <Tab> insert shiftwidth at beginning of a line.
    set shiftwidth=2 " Number of spaces for each indent level
    set softtabstop=2 " Even when using <Tab>'s
    set expandtab " When pressing <Tab>, replace with spaces
    " set tabstop=8 " number of spaces that a <Tab> counts for.
    " }}}



    " [ indent ] {{{
    " help indent.txt
    set backspace=indent,eol,start " Better handling of backspace key
    set autoindent " Sane indenting when filetype not recognised
    " set smartindent  " autoindent, smartindent, cindent, indentexpr.
        " use 'filetype indent on' to per-filetype indent
    set nostartofline   " Emulate typical editor navigation behaviour
  " set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    " }}}



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
            let g:template_basedir = ['$HOME/.vim/template/template']
            let g:template_files = 'template/**'
            let g:template_free_pattern = 'template'
        " }}}
