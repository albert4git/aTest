
 ACTION:               DEFAULT BINDINGS (NOTES):
           abort                 ctrl-c  ctrl-g  ctrl-q  esc
           accept                enter   double-click
           accept-non-empty      (same as accept except that it prevents fzf from exiting without selection)
           backward-char         ctrl-b  left
           backward-delete-char  ctrl-h  bspace
           backward-kill-word    alt-bs
           backward-word         alt-b   shift-left
           beginning-of-line     ctrl-a  home
           cancel                (clears query string if not empty, aborts fzf otherwise)
           clear-screen          ctrl-l
           delete-char           del
           delete-char/eof       ctrl-d
           deselect-all
           down                  ctrl-j  ctrl-n  down
           end-of-line           ctrl-e  end
           execute(...)          (see below for the details)
           execute-silent(...)   (see below for the details)
           execute-multi(...)    (deprecated in favor of {+} expression)
           forward-char          ctrl-f  right
           forward-word          alt-f   shift-right
           ignore
           jump                  (EasyMotion-like 2-keystroke movement)
           jump-accept           (jump and accept)
           kill-line
           kill-word             alt-d
           next-history          (ctrl-n on --history)
           page-down             pgdn
           page-up               pgup
           half-page-down
           half-page-up
           preview-down          shift-down
           preview-up            shift-up
           preview-page-down
           preview-page-up
           previous-history      (ctrl-p on --history)
           print-query           (print query and exit)
           replace-query         (replace query string with the current selection)

 replace-query         (replace query string with the current selection)
           select-all
           toggle                (right-click)
           toggle-all
           toggle+down           ctrl-i  (tab)
           toggle-in             (--layout=reverse* ? toggle+up : toggle+down)
           toggle-out            (--layout=reverse* ? toggle+down : toggle+up)
           toggle-preview
           toggle-preview-wrap
           toggle-sort
           toggle+up             btab    (shift-tab)
           top                   (move to the top result)
           unix-line-discard     ctrl-u
           unix-word-rubout      ctrl-w
           up                    ctrl-k  ctrl-p  up
           yank                  ctrl-y

       Multiple actions can be chained using + separator.

           fzf --bind 'ctrl-a:select-all+accept'

       With  execute(...)  action,  you  can execute arbitrary commands without leaving fzf. For example, you can turn fzf into a simple file
       browser by binding enter key to less command like follows.

           fzf --bind "enter:execute(less {})"

       You can use the same placeholder expressions as in --preview.


