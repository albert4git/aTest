
The second piece is the :nohlsearch command. This simply clears the search highlighting from the search we just performed so it's not distracting.

The final piece is a sequence of three normal mode commands:

    k: move up a line. Since we were on the first character of the line of equal signs, we're now on the first character of the heading text.
    v: enter (characterwise) visual mode.
    g_: move to the last non-blank character of the current line. We use this instead of $ because $ would highlight the newline character as well, and this isn't what we want.

Results

That was a lot of work, but now we've looked at each part of the mapping. To recap:

    We created a operator-pending mapping for "inside this section's heading".
    We used execute and normal! to run the normal commands we needed to select the heading, and allowing us to use special characters in those.
    Our mapping searches for the line of equal signs which denotes a heading and visually selects the heading text above that.
    Vim handles the rest.

Let's look at one more mapping before we move on. Run the following command:

:onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

Try it by putting your cursor in a section's text and typing cah. This time Vim will delete not only the heading's text but also the line of equal signs that denotes a heading. You can think of this movement as "around this section's heading".

What's different about this mapping? Let's look at them side by side:

:onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
:onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

The only difference from the previous mapping is the very end, where we select the text to operate on:

inside heading: kvg_
around heading: g_vk0

The rest of the mapping is the same, so we still start on the first character of the line of equal signs. From there:

    g_: move to the last non-blank character in the line.
    v: enter (characterwise) visual mode.
    k: move up a line. This puts us on the line containing the heading's text.
    0: move to the first character of the line.
        """A   (>^.^<)  A"""""""""""""""""
        """"""""""""""""""""""""""""""""""
        """A   (>^.^<)  A"""""""""""""""""
        """"""""""""""""""""""""""""""""""
        """A   (>^.^<)  A"""""""""""""""""
        """"""""""""""""""""""""""""""""""

        /home/red/git/aTest/1scrap.vim
        /home/red/git/aTest

        /home/red/git/aTest

        echo "Hello, world!"
        echom "Hello again, world!"
        messages
        imap <c-d> <esc>dd
        imap <c-d> <esc>ddi

        map <space> viw
        map <c-d> dd
        map <space> viw " Select word

        nnoremap -d dd
        nnoremap -c ddO
        """"""""""""""""""""""""""""""""""
        let mapleader = ","

        echo mapleader
        echo leader

        let maplocalleader = "\\"
        echo localleader

        """"""""""""""""""""""""""""""""""
        nnoremap <leader>ev :splitMYVIMRC<cr>

        nnoremap <leader>e :splitMYVIMRC<cr>

        iabbrev @@    albert@stevelosh.com
        iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.

        steve@stevelosh.com
        Copyright 2013 Steve Losh, all rights reserved.


        nnoremap <leader>m viw<esc>a"<esc>bi"<esc>lel
        inoremap jj <esc>
        "inoremap <esc> <nop>
        setlocal nonumber

        "world"
        "world"
        "world"
        "world"

        autocmd BufNewFile * :write
        autocmd BufNewFile *.txt :write

        :normal gg=G
        :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
        :autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

        iabbrev <buffer> --- &mdash;

        autocmd FileType vim :iabbrev <buffer> iff if ()<left>
        autocmd FileType vim :iabbrev <buffer> iff if ()<left>

        iabbrev <buffer> iff if ()<left>

        i

        iff
        if ()

            " Keys   Operator   Movement
            " ----   --------   -------------
            " dw     Delete     to next word
            " ci(    Change     inside parens
            " yt,    Yank       until comma

            augroup testgroup
                autocmd!
                autocmd BufWrite * :echom "Cats"
            augroup END


            augroup testgroup
                autocmd BufWrite * :echom "Foo"
                autocmd BufWrite * :echom "Bar"
            augroup END

            " ----   --------   -------------
            " ----   --------   -------------
            onoremap p i(
            onoremap p i(
            iabbrev <buffer> iff if ()<left>
            nnoremap <leader>m viw<esc>a"<esc>bi"<esc>lel
            onoremap b /return<cr>

            "-onoremap in( :<c-u>normal! f(vi(<c
            "-onoremap il( :<c-u>normal! F)vi(<cr>

            print foo(bar)
            print foo(bar)
            print foo(bar)

            return person.get_pets(type="cat", fluffy_only=True)
            " ----   --------   -------------
            def count(i):
            i += 1
            print i
        execute "normal! gg"
        normal! gg/a<cr>




        normal! /^==\+$<cr>:hlsearch<cr>kvg_

        set statusline=%f         " Path to the file
        set statusline=%f\ --------------\ FileType:\ %y
        set statusline+=\ -\      " Separator
        set statusline+=FileType: " Label
        set statusline+=%y        " Filetype of the file
        set statusline+=%l    " Current line
        set statusline+=/    " Separator
        set statusline+=%L   " Total lines

        set statusline=[%4l]
        set statusline+=%f         " Path to the file

        set statusline=Current:\ %4l\ Total:\ %4L
        :set statusline=Current:\ %-4l\ Total:\ %-4L

        set statusline=%04l
        set statusline=%F


        set statusline=%.20F

        "" %-0{minwid}.{maxwid}{item}

        " Vimscript za line settings ---------------------- {{{
        :set statusline=%f         " Path to the file
        :set statusline+=%=        " Switch to the right side
        :set statusline+=%l        " Current line
        :set statusline+=/         " Separator
        :set statusline+=%L        " Total lines
        " }}}

        " Vimscript file settings za ---------------------- {{{
        augroup filetype_vim
            autocmd!
            autocmd FileType vim setlocal foldmethod=marker
        augroup END
        " }}}
        "

        set textwidth=40
        echo &textwidth

        set nowrap
        echo &wrap

        set wrap
        echo &wrap

        let &textwidth = 100
        set textwidth?

        let &textwidth = &textwidth + 10
        set textwidth?

        let &l:number = 0

        let &l:number = 1

        let @a = "hello!"
        echo @a
        echo @"
        echo @/

        let b:hello = "world"

        echo b:hello

        augroup testgroup
            autocmd BufWrite * :echom "Baz"
        augroup END

        echom "foo" | echom "bar"

        if 1
            echom "ONE"
        endif

        if 0
            echom "ZERO"
        endif

        if "something"
            echom "INDEED"
        endif

        if "9024"
            echom "WHAT?!"
        endif

        echom "hello" + 10
        echom "10hello" + 10
        echom "hello10" + 10

        if 0
            echom "if"
        elseif "nope!"
            echom "elseif"
        else
            echom "finally!"
        endif

        if 10 == 11
            echom "first"
        elseif 10 == 10
            echom "second"
        endif

        if "foo" == "bar"
            echom "one"
        elseif "foo" == "foo"
            echom "two"
        endif

        set noignorecase
        if "foo" == "FOO"
            echom "vim is case insensitive"
        elseif "foo" == "foo"
            echom "vim is case sensitive"
        endif

        set ignorecase
        if "foo" == "FOO"
            echom "no, it couldn't be"
        elseif "foo" == "foo"
            echom "this must be the one"
        endif

        set noignorecase
        if "foo" ==? "FOO"
            echom "first"
        elseif "foo" ==? "foo"
            echom "second"
        endif

        set ignorecase
        if "foo" ==# "FOO"
            echom "one"
        elseif "foo" ==# "foo"
            echom "two"
        endif

        function Meow()
          echom "Meow!"
        endfunction

        call Meow()

        function GetMeow()
          return "Meow String!"
        endfunction

        echom GetMeow()


        call Meow()
        call GetMeow()

        function TextwidthIsTooWide()
          if &l:textwidth ># 80
            return 1
            else
                echom "finally!"
          endif
        endfunction

        if TextwidthIsTooWide()
          echom "WARNING: Wide text!"
        endif
        """"""""""""""""""""""""""""""""""""""""""""""""""""""
        function DisplayName(name)
          echom "Hello!  My name is:"
          echom a:name
        endfunction

        call DisplayName("YName")

        function UnscopedDisplayName(name)
          echom "Hello!  My name is:"
          echom name
        endfunction

        call UnscopedDisplayName("iName")

        function Varg(...)
          echom a:0
          echom a:1
          echo a:000
        endfunction

        call Varg("a", "b")

        function Varg2(foo, ...)
          echom a:foo
          echom a:0
          echom a:1
          echo a:000
        endfunction

        call Varg2("a", "b", "c")

        function Assign(foo)
          let a:foo = "Nope"
          echom a:foo
        endfunction

        call Assign("test")

        function AssignGood(foo)
          let foo_tmp = a:foo
          let foo_tmp = "Yep"
          echom foo_tmp
        endfunction

        call AssignGood("test")

        echo "3 mice" + "2 cats"

        echo "Hello, " . "world"


        if "foo"
          echo "yes"
        else
          echo "no"
        endif


        echom "foo \"bar\""
        echom "foo\\bar"
        echo "foo\nbar"
        echom "foo\nbar"
        echom '\n\\'
        echom 'That''s enough.'

        if "foo"
          echo "yes"
        else
          echo "no"
        endif

        echom strlen("foo")
        echom len("foo")

        echo split("one two three")
        echo split("one,two,three", ",")

        echo join(["foo", "bar"], "...")
        echo join(split("foo bar"), ";")

        echom tolower("Foo")
        echom toupper("Foo")

        It's up to you to decide whether to use tolower and ==#, or just ==? to perform case-sensitive comparisons. There doesn't seem to be any strong preference in the Vimscript community.


        execute "echom 'Hello, world!'"
        execute "rightbelow vsplit " . bufname("#")


        normal ggdd

        normal! G

        execute "normal! gg/foo\<cr>dd"

        execute "normal! mqA;\<esc>`q"


        max = 10

        print "Starting"

        for i in range(max):
            print "Counter:", i

        print "Done"

        <leader>giw: Grep for the word under the cursor.
        <leader>giW: Grep for the WORD under the cursor.
        <leader>gi': Grep for the contents of the single-quoted string u're currently in.

        viwe<leader>g: Visually select a word, extend the selection to the end of the word after it, then grep for the selected text.


        let leader = "<space>"
        let leader = ","
        echo leader

