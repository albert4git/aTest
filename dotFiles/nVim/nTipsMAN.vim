
VimTip	{{{1 167: Using vim as a man-page viewer under Unix
http://vim.sourceforge.net/tip_view.php?tip_id=

To use vim as a man-page viewer involves setting an environment variable:

    sh, ksh:  export MANPAGER="col -b | view -c 'set ft=man nomod nolist' -"
    csh    :  setenv MANPAGER "col -b | view -c 'set ft=man nomod nolist' -"

Put one of the above two lines into your <.profile> or <.login> file as
appropriate for your shell.

The man pages will then be displayed with vim called as "view" and will use
the <man.vim> syntax highlighting.  I myself use some additional highlighting
which is enabled by putting the following file into <.vim/after/syntax/man.vim>.
I usually use the <astronaut> colorscheme (also available from this archive);
those who use bright backgrounds may find the colors selected for
manSubSectionStart and manSubSection something they'll want to change:

  ---------------------------------------------------------------------
" DrChip's additional <man.vim> stuff

syn match  manSectionHeading    "^\s\+[0-9]\+\.[0-9.]*\s\+[A-Z].*$" contains=manSectionNumber
syn match  manSectionNumber     "^\s\+[0-9]\+\.[0-9]*"              contained
syn region manDQString          start='[^a-zA-Z"]"[^", )]'lc=1      end='"'         contains=manSQString
syn region manSQString          start="[ \t]'[^', )]"lc=1           end="'"
syn region manSQString          start="^'[^', )]"lc=1               end="'"
syn region manBQString          start="[^a-zA-Z`]`[^`, )]"lc=1      end="[`']"
syn region manBQSQString        start="``[^),']"                    end="''"
syn match  manBulletZone        transparent "^\s\+o\s" contains=manBullet
syn case    match
syn keyword manBullet contained o
syn match   manBullet contained "\[+*]"
syn match   manSubSectionStart  "^\*"   skipwhite nextgroup=manSubSection
syn match   manSubSection       ".*$"   contained

hi link manSectionNumber    Number
hi link manDQString         String
hi link manSQString         String
hi link manBQString         String
hi link manBQSQString       String
hi link manBullet           Special
hi manSubSectionStart       term=NONE cterm=NONE gui=NONE ctermfg=black ctermbg=black guifg=navyblue guibg=navyblue
hi manSubSection            term=underline cterm=underline gui=underline ctermfg=green guifg=green
set ts=8
  ---------------------------------------------------------------------
