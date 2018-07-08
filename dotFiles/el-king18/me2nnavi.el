
;;** Example 3: jump to error
(when (bound-and-true-p hydra-examples-verbatim)
  (defhydra hydra-error (global-map "M-g")
    "goto-error"
    ("h" first-error "first")
    ("j" next-error "next")
    ("k" previous-error "prev")
    ("v" recenter-top-bottom "recenter")
    ("q" nil "quit")))

;; This example introduces only one new thing: since the command
;; passed to the "q" head is nil, it will quit the Hydra without doing
;; anything. Heads that quit the Hydra instead of continuing are
;; referred to as having blue :color. All the other heads have red
;; :color, unless other is specified.

;;** Example 4: toggle rarely used modes
(when (bound-and-true-p hydra-examples-verbatim)
  (defvar whitespace-mode nil)
  (global-set-key
   (kbd "C-c C-v")
   (defhydra hydra-toggle-simple (:color blue)
     "toggle"
     ("a" abbrev-mode "abbrev")
     ("d" toggle-debug-on-error "debug")
     ("f" auto-fill-mode "fill")
     ("t" toggle-truncate-lines "truncate")
     ("w" whitespace-mode "whitespace")
     ("q" nil "cancel"))))

;; Note that in this case, `defhydra' returns the `hydra-toggle-simple/body'
;; symbol, which is then passed to `global-set-key'.
;;
;; Another new thing is that both the keymap and the body prefix are
;; skipped.  This means that `defhydra' will bind nothing - that's why
;; `global-set-key' is necessary.
;;
;; One more new thing is that you can assign a :color to the body. All
;; heads will inherit this color. The code above is very much equivalent to:
;;
;;     (global-set-key (kbd "C-c C-v a") 'abbrev-mode)
;;     (global-set-key (kbd "C-c C-v d") 'toggle-debug-on-error)
;;
;; The differences are:
;;
;; * You get a hint immediately after "C-c C-v"
;; * You can cancel and call a command immediately, e.g. "C-c C-v C-n"
;;   is equivalent to "C-n" with Hydra approach, while it will error
;;   that "C-c C-v C-n" isn't bound with the usual approach.















