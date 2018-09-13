        "colorscheme redstring
        "colorscheme Benokai
        "-------------------------------------------------------------------------------
        set nowrap
        set wmh=0
        "-------------------------------------------------------------------------------
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=
        "-------------------------------------------------------------------------------
        nnoremap <S-j> :bn<cr>
        nnoremap <S-k> :bp<cr>
        nnoremap <m-j> :bn<cr>
        nnoremap <m-k> :bp<cr>
        "-------------------------------------------------------------------------------
        "brackets show match
        set nosm
        "-------------------------------------------------------------------------------
        highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
        "=================[ Comments are important ]====================================
        "highlight Comment term=bold ctermfg=white
        "-------------------------------------------------------------------------------
        set cursorline
        set cursorcolumn
        "-------------------------------------------------------------------------------
        "highlight CursorLine ctermbg=0 term=bold
        highlight LineNr ctermfg=1 ctermbg=120
        set nuw =5
        highlight cursorcolumn ctermbg=0
        highlight CursorLine ctermbg=0
        highlight Cursor ctermbg=1 term= bold
        highlight Normal ctermbg=234 "-!!!-XXX-
        "-------------------------------------------------------------------------------
        if &term =~ "xterm\\|rxvt"
                "use an orange cursor in insert mode
                let &t_SI = "\<Esc>]12;orange\x7"
                "use a red cursor otherwise
                let &t_EI = "\<Esc>]12;green\x7"
                silent !echo -ne "\033]12;green\007"
                "reset cursor when vim exits
                autocmd VimLeave * silent !echo -ne "\033]112\007"
                "use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
        endif
        "-------------------------------------------------------------------------------
        "noremap <F7> :Autoformat<CR>
        """ formatt upon saving
        """ au BufWrite * :Autoformat
        """ hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212

        sign define fixme text=!! linehl=Error
        function! SignFixme()
                execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
        endfunction
        map <Leader>1 :call SignFixme()<CR>
        """"
        """"
        function! SignLines() range
                let n = a:firstline
                execute(":sign define fixme text=?! texthl=Error")
                while n <= a:lastline
                        if getline(n) =~ '\(TODO\|FIXME\)'
                                execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
                        endif
                        let n = n + 1
                endwhile
        endfunction
        map <Leader>2 :call SignLines()<CR>
