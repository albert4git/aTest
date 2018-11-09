VimTip	{{{1 94: Questions & Answers about using tags with Vim
http://vim.sourceforge.net/tip_view.php?tip_id=

Using tags file with Vim
------------------------
This document gives you a idea about the various facilities available
in Vim for using a tags file to browse through program source files.
You can read the Vim online help, which explains in detail the tags
support, using :help tagsearch.txt.  You can also use the help
keywords mentioned in this document to read more about a particular
command or option.  To read more about a particular command or option
use, :help <helpkeyword> in Vim.

1. How do I create a tags file?

   You can create a tags file either using the ctags utility or using
   a custom script or utility.

   Help keyword(s): tag

2. Where can I download the tools to generate the tags file?

   There are several utilities available to generate the tags file.
   Depending on the programming language, you can use any one of them.

   1. Exuberant ctags generates tags for the following programming
      language files: 
      
      Assembler, AWK, ASP, BETA, Bourne/Korn/Zsh Shell, C, C++, COBOL,
      Eiffel, Fortran, Java, Lisp, Make, Pascal, Perl, PHP, Python,
      REXX, Ruby, S-Lang, Scheme, Tcl, and Vim.

      You can download exuberant ctags from
      http://ctags.sourceforge.net/

   2. On Unix, you can use the /usr/bin/ctags utility.  This utility
      is present in most of the Unix installations.
   
   3. You can use jtags for generating tags file for java programs.
      You can download jtags from: http://www.fleiner.com/jtags/

   4. You can use ptags for generating tags file for perl programs.
      You can download ptags from:
      http://www.eleves.ens.fr:8080/home/nthiery/Tags/

   5. You can download scripts from the following links for
      generating tags file for verilog files:
   
            http://www.probo.com/vtags.htm
            http://www.cs.albany.edu/~mosh/Perl/veri-tags
            http://www.verilog.net/vrtags.txt

   6. You can download Hdrtag from the following linke:

            http://www.erols.com/astronaut/vim/index.html#Tags

      This utility generates tags file for the following programming
      languages: assembly, c/c++, header files, lex, yacc,LaTeX, vim,
      and Maple V.

   7. You can also use the following scripts which are part of the Vim
      runtime files:

          pltags.pl - Create tags file for perl code
          tcltags - Create tags file for TCL code
          shtags.pl - Create tags file for shell script

   Help keyword(s): ctags

3. How do I generate a tags file using ctags?

   You can generate a tags file for all the C files in the current
   directory using the following command:

        $ ctags *.c

   You can generate tags file for all the files in the current
   directory and all the sub-directories using (this applies only to
   exuberant ctags):

        $ ctags -R .

   You can generate tags file for all the files listed in a text file
   named flist using (this applies only to exuberant ctags)

       $ ctags -L flist

4. How do I configure Vim to locate a tags file?

   You can set the 'tags' option in Vim to specify a particular tags
   file.

        set tags=/my/dir/tags

   Help keyword(s): 'tags', tags-option

5. How do I configure Vim to use multiple tags files?

   The 'tags' option can specify more than one tags file.  The tag
   filenames are separated using either comma or spaces.

        set tags=/my/dir1/tags, /my/dir2/tags

6. How do I configure Vim to locate a tags file in a directory tree?

   Note that the following will work only in Vim 6.0 and above.  You
   can set the 'tags' option to make Vim search for the tags file in a
   directory tree.  For example, if the 'tags' option is set like
   this:

        set tags=tags;/

   Vim will search for the file named 'tags', starting with the
   current directory and then going to the parent directory and then
   recursively to the directory one level above, till it either
   locates the 'tags' file or reaches the root '/' directory.

   Help keyword(s): file-searching

7. How do I jump to a tag?

   There are several ways to jump to a tag location.
        1. You can use the 'tag' ex command.  For example,

               :tag <tagname>
   
           will jump to the tag named <tagname>.
        2. You can position the cursor over a tag name and then press
           Ctrl-].
        3. You can visually select a text and then press Ctrl-] to
           jump to the tag matching the selected text.
        4. You can click on the tag name using the left mouse button,
           while pressing the <Ctrl> key.
        5. You can press the g key and then click on the tag name
           using the left mouse button.
        6. You can use the 'stag' ex command, to open the tag in a new
           window.  For example,

                :stag func1

           will open the func1 definition in a new window.
        7. You can position the cursor over a tag name and then press
           Ctrl-W ].  This will open the tag location in a new window.

   Help keyword(s): :tag, Ctrl-], v_CTRL_], <C-LeftMouse>,
                    g<LeftMouse>, :stag, Ctrl-W_]

8. How do I come back from a tag jump?

   There are several ways to come back to the old location from a tag
   jump.
        1. You can use the 'pop' ex command.
        2. You can press Ctrl-t.
        3. You can click the right mouse button, while pressing the
           <Ctrl> key.
        4. You can press the g key and then click the right mouse
           button.

   Help keyword(s): :pop, Ctrl-T, <C-RightMouse>, g<RightMouse>

9. How do I jump again to a previously jumped tag location?

   You can use the 'tag' ex command to jump to a previously jumped tag
   location, which is stored in the tag stack.

   Help keyword(s): tag

10. How do I list the contents of the tag stack?

   Vim remembers the location from which you jumped to a tag in the
   tag stack.  You can list the current tag stack using the 'tags' ex
   command.

   Help keyword(s): :tags, tagstack

11. How do I jump to a particular tag match, if there are multiple
    matching tags?

    In some situations, there can be more than one match for a tag.
    For example, a C function or definition may be present in more
    than one file in a source tree.  There are several ways to jump to
    a specific tag from a list of matching tags.
    
        1. You can use the 'tselect' ex command to list all the tag
           matches.  For example,

                :tselect func1

          will list all the locations where func1 is defined.  You can
          then enter the number of a tag match to jump to that
          location.
        2. You can position the cursor over the tag name and press g]
           to get a list of matching tags.
        3. You can visually select a text and press g] to get a list
           of matching tags.
        4. You can use the 'stselect' ex command.  This will open the
           selected tag from the tag list in a new window.
        5. You can position the cursor over the tag name and press
           Ctrl-W g] to do a :stselect.

    Help keyword(s): tag-matchlist, :tselect, g], v_g], :stselect,
                     Ctrl-W_g]

12. I want to jump to a tag, if there is only one matching tag,
    otherwise a list of matching tags should be displayed.  How do I
    do this? 

    There are several ways to make Vim to jump to a tag directly, if
    there is only one tag match, otherwise present a list of tag
    matches.

        1. You can use the 'tjump' ex command.  For example,

                :tjump func1

           will jump to the definition func1, if it is defined only
           once.  If func1 is defined multiple times, a list of
           matching tags will be presented.
        2. You can position the cursor over the tag and press g
           Ctrl-].
        3. You can visually select a text and press g Ctrl-] to jump
           or list the matching tags.
        4. You can use the 'stjump' ex command.  This will open the
           matching or selected tag from the tag list in a new window.
        5. You can press Ctrl-W g Ctrl-] to do a :stjump.

    Help keyword(s): :tjump, g_Ctrl-], v_g_CTRL-], :stjump,
                     Ctrl-W_g_Ctrl-]

13. How do browse through a list of multiple tag matches?

    If there are multiple tag matches, you can browse through all of
    them using several of the Vim ex commands.

    1. To go to the first tag in the list, use the 'tfirst' or
       'trewind' ex command.
    2. To go to the last tag in the list, use the 'tlast' ex command.
    3. To go to the next matching tag in the list, use the 'tnext' ex
       command.
    4. To go to the previous matching tag in the list, use the
       'tprevious' or 'tNext' ex command.

    Help keyword(s): :tfirst, :trewind, :tlast, :tnext, :tprevious,
                     :tNext

14. How do I preview a tag?

    You can use the preview window to preview a tag, without leaving
    the original window.  There are several ways to preview a tag:

        1. You can use the 'ptag' ex command to open a tag in the
           preview window.
        2. You can position the cursor on a tag name and press Ctrl-W
           } to open the tag in the preview window.
        3. You can use the 'ptselect' ex command to do the equivalent
           of the 'tselect' ex command in the preview window.
        4. You can use the 'ptjump' ex command to do the equivalent of
           the 'tjump' ex command in the preview window.
        5. You can position the cursor on the tag and press Ctrl-W g}
           to do a :ptjump on the tag.

    Help keyword(s): :preview-window, :ptag, Ctrl-W_}, :ptselect,
                     :ptjump, Ctrl-W_g}

15. How do I browse through the tag list in a preview window?

    If there are multiple tag matches, you can browse through all of
    them in the preview window using several of the Vim ex commands.

    1. To go to the first tag in the list, use the 'ptfirst' or
       'ptrewind' ex command.
    2. To go to the last tag in the list, use the 'ptlast' ex command.
    3. To go to the next matching tag in the list, use the 'ptnext' ex
       command.
    4. To go to the previous matching tag in the list, use the
       'ptprevious' or 'ptNext' ex command.

    Help keyword(s): :ptfirst, :ptrewind, :ptlast, :ptnext,
                     :ptprevious, :ptNext

16. How do I start Vim to start editing a file at a given tag match?

    While starting Vim, you can use the command line option '-t' to
    supply a tag name.  Vim will directly jump to the supplied tag
    location.

    Help keyword(s): -t

17. How do I list all the tags matching a search pattern?

    There are several ways to go through a list of all tags matching a
    pattern.

        1. You can list all the tags matching a particular regular
           expression pattern by prepending the tag name with the '/'
           search character.  For example,

                :tag /<pattern>
                :stag /<pattern>
                :ptag /<pattern>
                :tselect /<pattern>
                :tjump /<pattern>
                :ptselect /<pattern>
                :ptjump /<pattern>

         2. If you have the 'wildmenu' option set, then you can press
            the <Tab> key to display a list of all the matching tags
            in the status bar.  You can use the arrow keys to move
            between the tags and then use the <Enter> key to select a
            tag.

         3. If you don't have the 'wildmenu' option set, you can still
            use the <Tab> key to browse through the list of matching
            tags.

    Help keyword(s): tag-regexp, wildmenu

18. What options are available to control how Vim handles the tags
    file?

    You can use the following options to control the handling of tags
    file by Vim:

    1. 'tagrelative' - Controls how the file names in the tags file
                       are treated.  When on, the filenames are
                       relative to the directory where the tags file
                       is present.

    2. 'taglength' -  Controls the number of significant characters
                      used for recognizing a tag.

    3. 'tagbsearch' - Controls the method used to search the tags file
                      for a tag.  If this option is on, binary search
                      is used to search the tags file.  Otherwise,
                      linear search is used.

    4. 'tagstack' - Controls how the tag stack is used.

    Help keyword(s): 'tagrelative', 'taglength', 'tagbsearch',
                     'tagstack'

19. Is it possible to highlight all the tags in the current file?

    Yes.  Read the Vim online help on "tag-highlight".

20. Is it possible to create a menu with all the tags in the current
    file?

    Yes.  It is possible to create a menu with all the tags in the
    current file using a Vim script.  Download the TagsMenu.vim script
    from the following link: 

    http://members.home.net/jayglanville/tagsmenu/TagsMenu.html

21. Is there a workaround to make the Ctrl-] key not to be treated as
    the telnet escape character?

    The default escape characters for telnet in Unix systems is
    Ctrl-].  While using Vim in a telnet session, if you use Ctrl-] to
    jump to a tag, you will get the telnet prompt.  There are two ways
    to avoid this problem:
    
    1. Map the telnet escape character to some other character using
       the "-e <escape character>" telnet command line option

    2. Disable the telnet escape character using the "-E" telnet
       command line option.

    Help keyword(s): telnet-CTRL-]

