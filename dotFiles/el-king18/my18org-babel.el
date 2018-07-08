(use-package org
             :ensure org-plus-contrib
             ;; stuff you want done before org loaded
             :init
             :commands (org-mode)
             :bind ("C-c a" . org-agenda)
             ;; stuff you want doen after org loaded
             :config
             (setq org-log-done 'time
                   org-startup-folded nil))

;;===================================
(require 'org)
; and some more org stuff
;;===================================
; And add babel inline code execution
; babel, for executing code in org-mode.
(org-babel-do-load-languages
 'org-babel-load-languages
 ; load all language marked with (lang . t).
 '((C . t)
   (R . t)
   (asymptote)
   (awk)
   (calc)
   (clojure)
   (comint)
   (css)
   (ditaa )
   (dot )
   (emacs-lisp . t)
   (fortran)
   (gnuplot . t)
   (haskell)
   (io)
   (java . t)
   (js)
   (latex)
   (ledger)
   (lilypond)
   (lisp)
   (matlab)
   (maxima)
   (mscgen)
   (ocaml)
   (octave . t)
   (org . t)
   (perl)
   (picolisp)
   (plantuml)
   (python . t)
   (ref)
   (ruby)
   (sass)
   (scala)
   (scheme)
   (screen)
   (sh . t)
   (shen)
   (sql . t)
   (sqlite . t)))

(set-background-color "azure1") ;; misty rose
