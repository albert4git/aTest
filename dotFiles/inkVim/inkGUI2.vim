"---AAA13---------------------------------------------------------------------------------------------------------- {{{
        if has('gui_running') | set lines=999 columns=999 | else | set t_Co=256 | endif
        set guifont=Monospace\ Bold\ 16
        set guioptions-=T
        set guioptions-=t
        set guioptions-=m
        set guioptions-=M
        ""set gfn=Lucida_Sans_Typewriter:h14:cANSI
        ""5amenu First.first :echo 'first'<cr>
        """ Disable scrollbars (real hackers don't use scrollbars for navigation!)
        ""hi Pmenu ctermbg=208 gui=bold
        ""hi Pmenu guibg=brown gui=bold
        """set guioptions-=mTrlb
        ""set nolinebreak
        """set grepprg=ack
        """set grepformat=%f:%l:%m
        """set keywordprg=man, ri, perldoc, <== K, 7K ??
        Split a line at the cursor, and put a > at the beginning of the next
        line.  (For quoting Usenet, etc). I had some trouble with my old
        version of this under some versions, so I've redone it, and I think
        that it should work.
" }}}
