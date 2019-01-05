
        let nar = "hello"
        echo g:nar

        let name = "John"
        echo "Hello, " . name

        "==================================
        let w:foo = 'bar'    " w: window
        let b:state = 'on'   " b: buffer
        let t:state = 'off'  " t: tab

        echo w:foo
        echo b:state
        echo t:state
        "==================================

        let var = 4
        let var -= 2
        let var += 5
        echo g:var
        let var .= 'string'   " concat
        echo g:var

        "-Casting-------
        str2float("2.3")
        str2nr("3")
        float2nr("3.14")

        "==================================
        let str = "String"
        let str = "String with \n newline"
        echo g:str

        let literal = 'literal, no \ escaping'
        echo g:literal 
        " double '' => '
        let literal = 'that''s enough' 
        echo g:literal 

        " concatenation
        let re ='Alf'
        echo "result = " . re  

        "==================================
        " prefix with s: for local script-only functions
        function! s:Initialize(cmd, args)
            " a: prefix for arguments
            echo "Command: " . a:cmd

            return true
        endfunction


        function! myfunction() abort
                echo 'euro'
        endfunction

        function! myplugin#hello()

        call s:Initialize()
        call s:Initialize("hello")
        echo "Result: " . s:Initialize()

        "==???=WhatsThat=====================
        function! infect(...)
                echo a:0    "=> 2
                echo a:1    "=> jake
                echo a:2    "=> bella

                for s in a:000  " a list
                        echon 'cambridge' . s
                endfor
        endfunction

        infect('jake', 'bella')

        "==Err================================
        let x =0
        while x < 9
            x +=1
            echo x
        endwhile
        "==Nope===============================
        for s in list
            echo s
            continue  " jump to start of loop
            break     " breaks out of a loop
        endfor

        "----------
        if 3 > 2
        if a && b
        if (a && b) || (c && d)
        if !c
        "----------
        a is b
        a isnot b
        "----------
        echo 'tabstop is ' . &tabstop

        "----???--- Prefix Vim options with & ----------------
        if &insertmode
                echo &g:option
                echo &l:option
        endif
        "----------
        let g:ack_options = '-s -H'    " g: global
        let s:ack_program = 'ack'      " s: local (to script)
        let l:foo = 'bar'              " l: local (to function)


        "Boolean logic
        if g:use_dispatch && s:has_dispatch
            echo 'yes'
        endif
        "---------------------------------------
        let mylist = [1, 5, 3, 0]
        let mylist = [1, 'two', 3, 'four']
        echo mylist 
        let shortlist = mylist[2:-1]
        echo shortlist
        let shortlist = mylist[2:]     " same
        echo shortlist
        let shortlist = mylist[2:2]    " one item
        echo shortlist

        echo len(mylist)
        "??? empty(mylist)
        echo mylist 

        let sortedlist = sort(copy(mylist))
        echo sortedlist 
        echo mylist 

        echo sort(mylist)
        echo mylist 

        strlen(str)    " length
        len(str)       " same
        strchars(str)  " character length

        "------------------------------------------------------
        let mylist = split('hello there world', ' ')
        echo mylist 

        split("one two three")       "=> ['one', 'two', 'three']
        split("one.two.three", '.')  "=> ['one', 'two', 'three']

        echo join(['a', 'b'], ',')
        "------------------------------------------------------
        let longlist = mylist + [5, 6]
        let mylist += [7, 8]
        echo longlist 

        let alist = [1, 2, 3]
        let alist = add(alist, 4)
        echo alist 

        "------------------------------------------------------
        "----------
        echoerr 'oh it failed'
        echomsg 'hello there'
        echo 'hello'
        let msg = 'NY'
        echohl WarningMsg | echomsg "=> " . g:msg | echohl None
        "a?? echohl WarningMsg | echomsg "=> " . a:msg | echohl None
        "----------

        "-???Map-------
        let var = "hello"
        echo g:var
        call map(files, "bufname(v:val)")  " use v:val for value
        call filter(files, 'v:val != ""')
        <buffer> 	only in current buffer
        <silent> 	no echo
        <nowait> 	 

        "-----------------------
        au Filetype markdown setlocal spell
        "----------------------
        augroup filetypedetect
            au! BufNewFile,BufRead *.json setf javascript
        augroup END
        "-----------------------


        "-Silencing----------
        silent g/Aap/p
        "=============Exec===========================
        "Command are often used as shortcut for
        " functions and subprograms:

        command C -nargs=* call F ( <f-args> )
        command C source ~/vimfiles/s.vim

        command! Saave :set fo=want tw=80 nowrap

        "--------------------------------------------
        "Prefixes (s:, g:, l:, etc) are actually dictionaries.
        "------------<SID>-s:unic-ID-----------------
        command! Save call <SID>foo()

        function! s:foo()
                echo 'USA'
        endfunction

        function! SuperTab()
          let l:part = strpart(getline('.'),col('.')-2,1)
          if (l:part=~'^\W\?$')
              return "\<Tab>"
          else
              return "\<C-n>"
          endif
        endfunction

        imap <Tab> <C-R>=SuperTab()<CR>
        "===========================================



        " command! -nargs=? Save call script#foo(<args>)
        "         -nargs=0 	0 arguments, default
        "         -nargs=1 	1 argument, includes spaces
        "         -nargs=? 	0 or 1 argument
        "         -nargs=* 	0+ arguments, space separated
        "         -nargs=+ 	1+ arguments, space reparated

        "-----------------------
        execute "vsplit"
        execute "e " . fnameescape(filename)

        "-----------------------
        normal G
        normal! G   " skips key mappings
        "--Nice-----------------
        execute "normal! gg/foo\<cr>yy"
        "-----------------------

        " Use :normal to execute keystrokes as if you are typing them in normal mode.
        " Combine with :execute for special keystrokes. See: Running keystrokes

        "============================================
        let colors = {
            \ "apple": "red",
            \ "banana": "yellow" }
        "==================================
        for key in keys(colors)
            echo key.'-::-'.key 
        endfor
        "==================================
        "-???-let colors = remove(colors, "apple")
        "==================================
        for key in keys(colors)
            echo key.'-::-'.key 
        endfor

        "==================================
        echo get(colors, "apple")
        echo colors["apple"]
        echo colors["banana"]
        echo len(colors)
        "==================================
        " call map(colors, '">> " . v:val') 
        " echo colors["apple"]
        " echo colors["banana"]
        "==================================
        let strg = string(colors)
        echo strg

        "==NoErr===============================================================================
        let l = len(colors)
        echo l

        if( l == 0)
            echo 'is empty..'
        else
            echo 'is not empty..'
        endif

        "??empty??Single line
        "if empty(mylist) | return [] | endif
        a ? b : c

        if 1 | echo "true"  | endif
        if 0 | echo "false" | endif

        "-???-
        " if ("hello" =~ '/e/')
        "     echo 'is empty..'
        " endif 
        "hello" !~ '/x/'


        "==NoErr===============================================================================
        if empty(colors)
            echo 'is empty..'
        else
            echo 'is not empty..'
            let strg = string(colors)
            echo strg
        endif
        "==NoErr=Err==============================================================================
        let r='red'
        if has_key(colors,r)
            echo 'RED is in..'
            let strg = string(colors)
            echo strg
        else
            echo 'is not empty..'
            let strg = string(colors)
            echo strg
        endif



        "==================================
        let mylist = [1, 'two', 3, 'four']
        echo mylist
        let first = mylist[0]
        echo first
        let last  = mylist[-1]
        echo last
        let second = get(mylist, 1)
        echo second
        let second = get(mylist, 1, "NONE")
        echo second
        "==================================
        let ldot = getline('.')          " current line as a string
        echo 'ldot: '.ldot
        let l1 = getline(1)            " get line 1
        echo 'l1:'.l1
        let l15 = getline(4, 6)         " get lines 1-5
        echo l15
        "==================================
        let p1 =getcurpos()           " [bufnum, lnum, col, off, curswant]
        echo 'p1:'
        echo p1
        let p2 =getpos('.')           " [bufnum, lnum, col, off]
        echo 'p2:'
        echo p2

        "==================================
        "setpos("'z",...)
        let m1 = getpos("'a")          " position of a mark
        echo 'm1:'
        echo m1
        "==================================
        let m2 = getpos("'<")          " position of selection start
        echo 'm2:'
        echo m2
        "==================================
        let ff = expand('%')            " current file
        echo ff
        "==================================
        let fs =getfsize('./nPlug.vim')
        echo fs
        ":pwd
        let fc =getcwd()
        echo fc
        "global :pwd NICE
        let gp = globpath(&rtp, "plugin/commentary.vim")
        echo gp
        "==================================
        " :ls NICE
        echo system('ls '.shellescape(expand('%:h')))

        "==================================
        echo str2float('0.2')
        echo str2nr('240')
        echo str2nr('ff', '16')
        echo string(0.3)
        "==================================
        echo strftime('%c')
        echo strftime('%c',getftime('./noPlug.vim'))

        "==================================
        let s1 =strpart("abcdef", 3, 2)    " == "de" (substring)
        echo s1
        let str = 'xabc'
        echo str
        echo stridx("abcdef", "c")

        "==================================
        " echo synID(line('.'),col('.'),1)
        " echo synstack(line('.'),col('.'))
        " echo synIDattr(id,"bg")
        " echo synIDattr(id,"name")
        " echo synIDtrans()
        "==================================
        " let r1 =getreg('*')
        " echo r1
        " " v(char), V(line) <ctrl-v>(block)
        " let r2 =getregtype('*')
        " echo r2
        "======================================
        " also: is#, is?, >=#, >=?, and so on
        let name ='john'
        if name ==# 'John' 
            echo '#yes'
        endif

        if name ==? 'John'
            echo '?yes'
        endif

        if name == 'John' 
            echo 'yes'
        endif
        "======================================
        if "hello" =~ '.*'
            echo 'hell1'
        endif

        if "hello" !~ '.*'
            echo 'hell2'
        endif
        "======================================
        "?? normal 'ddahello'
        "?? exe 'normal ^C'

        "==================================
        " strpart("abcdef", 3, 2)    " == "de" (substring)
        " strpart("abcdef", 3)       " == "def"
        " stridx("abcdef", "e")      " == "e"
        " strridx()                  " reverse

        "==================================
        matchstr('testing','test')  " == 'test' (or '')
        match('testing','test')     " == 0
        matchend('testing','test')  " == 4
        match('testing','\ctest')   " ignore case
        "==================================

        " split(str, '\zs')           " split into characters

        " strlen(str)
        " strchars()                  " accounts for composing chars
        " strwidth()                  " accounts for ambig characters
        " strdisplaywidth()           " accounts for tab stops

        " toupper(str)
        " tolower(str)
        " tr('foo', '_-', '  ')

        "=================================================================================
        "Functions that can be used with a Dictionary: >
        " :help E715
        " :if has_key(dict, 'foo')	      " TRUE if dict has entry with key "foo"
        " :if empty(dict)		    	      " TRUE if dict is empty
        " :let l = len(dict)		          " number of items in dict
        " :let big = max(dict)		      " maximum value in dict
        " :let small = min(dict)		      " minimum value in dict
        " :let xs = count(dict, 'x')	      " count nr of times 'x' appears in dict
        " :let s = string(dict)		      " String representation of dict
        "??? :call map(dict, '">> " . v:val')  " prepend >>  to each item

        "??? remove(colors, "apple")
        " if has_key(dict, 'foo')
        " if empty(dict)
        " keys(dict)
        " len(dict)
        " max(dict)
        " min(dict)
        " count(dict, 'x')
        " string(dict)
        "??? map(dict, '<>> " . v:val')

        "======================================
        let Dictionary_1 = {
                                \ 1: 'one', 
                                \ 2: 'two',
                                \ 3: 'three'}

        for key in keys(Dictionary_1)
            echo key.'-::-'.val
        endfor
        "=======================================

        "=======================================
        expand('<cword>')      " word under cursor
        expand('%')            " current file
        " <cword>  current word on cursor
        " :p    full path
        " :h    head
        " :p:h  dirname   (/Users/rsc/project)
        " :t    tail      (file.txt)
        " :r    root      (file)
        " :e    extension (.txt)
        " see :h cmdline-special
        echo expand("%:p:h")  
        echo expand("%")      
        echo expand("%:t")    
        echo expand("%:r")    
        echo expand("%:e")    



        "-Conceal
        set conceallevel=2
        syn match newLine "<br>" conceal cchar=}
        hi newLine guifg=green

        syn region inBold concealends matchgroup=bTag start="<b>" end="</b>"
        hi inBold gui=bold
        hi bTag guifg=blue

        "-Syntax
        syn match :name ":regex" :flags
        syn region Comment  start="/\*"  end="\*/"
        syn region String   start=+"+    end=+"+	 skip=+\\"+

        flags:
        keepend
        oneline
        nextgroup=
        contains=
                syn cluster :name contains=:n1,:n2,:n3...
        contained

        hi def link markdownH1 htmlH1

        "**Include guards**************************************
        if exists('g:loaded_myplugin')
        finish
        endif

        let g:loaded_myplugin = 1
        "******************************************************



        "==Built-ins=========================================================================

            has("feature")  " :h feature-list
            executable("python")
            globpath(&rtp, "syntax/c.vim")

            exists("$ENV")
            exists(":command")
            exists("variable")
            exists("+option")
            exists("g:...")

        "******************************************************
        runtime :uses a search path and allows wildcards to findr
                the sub-program while
        source  :needs the full path.

        runtime setup.vim
        source  ~/vimfiles/setup.vim
        "******************************************************


        "******************************************************

        "******************************************************
