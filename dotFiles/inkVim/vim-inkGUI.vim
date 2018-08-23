"---AAA13---------------------------------------------------------------------------------------------------------- {{{
        if has('gui_running') | set lines=999 columns=999 | else | set t_Co=256 | endif
        ""set gfn=Lucida_Sans_Typewriter:h14:cANSI
        ""set guifont=Monospace\ Bold\ 18
        ""5amenu First.first :echo 'first'<cr>
        """ Disable scrollbars (real hackers don't use scrollbars for navigation!)
        ""set guioptions-=r
        ""set guioptions-=R
        ""set guioptions-=l
        ""set guioptions-=L
        ""hi Pmenu ctermbg=208 gui=bold
        ""hi Pmenu guibg=brown gui=bold
        ""set guioptions+=T
        """set guioptions-=mTrlb
        ""set nolinebreak
        """amenu Help.usr_08.txt
        """nmap Q gqap
        """amenu Help.-SEP- :
        """set grepprg=ack
        """set grepformat=%f:%l:%m
        """set keywordprg=man, ri, perldoc, <== K, 7K ??
" }}}
