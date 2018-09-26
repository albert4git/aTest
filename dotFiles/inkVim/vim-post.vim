        "colorscheme redstring
        "colorscheme Benokai
        "=================[ Comments are important ]====================================
        "highlight Comment term=bold ctermfg=white
        "-------------------------------------------------------------------------------
        if &term =~ "xterm\\|rxvt"
                "use an orange cursor in insert mode
                let &t_SI = "\<Esc>]12;orange\x7"
                "use a red cursor otherwise
                let &t_EI = "\<Esc>]12;cyan\x7"
                silent !echo -ne "\033]12;green\007"
                "reset cursor when vim exits
                autocmd VimLeave * silent !echo -ne "\033]112\007"
                "use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
        endif
        "-------------------------------------------------------------------------------
        "noremap <F7> :Autoformat<CR>
        """ formatt upon saving
        """ au BufWrite * :Autoformat

        sign define fixme text=!! linehl=Error
        function! SignFixme()
                execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
        endfunction
        map <Leader>1 :call SignFixme()<CR>
        "------------------------------------------------------------------------ 
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
