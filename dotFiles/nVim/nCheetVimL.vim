
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

        "Boolean logic
        if g:use_dispatch && s:has_dispatch
            echo 'yes'
        endif
        "----------
        let mylist = [1, 'two', 3, 'four']
        echo mylist 
        let shortlist = mylist[2:-1]
        echo shortlist
        let shortlist = mylist[2:]     " same
        echo shortlist
        let shortlist = mylist[2:2]    " one item
        echo shortlist


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

        augroup filetypedetect
            au! BufNewFile,BufRead *.json setf javascript
        augroup END

        au Filetype markdown setlocal spell

        "=============Exec===========================
        command! Saave :set fo=want tw=80 nowrap

        execute "vsplit"
        execute "e " . fnameescape(filename)


        "============================================
        let colors = {
            \ "apple": "red",
            \ "banana": "yellow" }

        "==================================
        for key in keys(colors)
            echo key.'-::-'.key 
        endfor
        "==================================

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
        :help E715
        :if has_key(dict, 'foo')	      " TRUE if dict has entry with key "foo"
        :if empty(dict)		    	      " TRUE if dict is empty
        :let l = len(dict)		          " number of items in dict
        :let big = max(dict)		      " maximum value in dict
        :let small = min(dict)		      " minimum value in dict
        :let xs = count(dict, 'x')	      " count nr of times 'x' appears in dict
        :let s = string(dict)		      " String representation of dict
        :call map(dict, '">> " . v:val')  " prepend >>  to each item



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



        "==Err===============================================================================
        if empty(colors){
            echo 'is empty..'
            } else
            {
            echo 'is not empty..'
            }
        "==Err===============================================================================
        if has_key(colors, 'red'){
            echo 'RED is in..'
            }
