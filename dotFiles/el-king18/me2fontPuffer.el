
(use-package hl-todo
  :diminish hl-todo-mode
  :commands hl-todo-mode
  :init (add-hook 'prog-mode-hook 'hl-todo-mode t))

(setq hl-todo-keyword-faces
      `(("TODO"  . ,(face-foreground 'warning))
        ("FIXME" . ,(face-foreground 'error))
        ("NOTE"  . ,(face-foreground 'success)))) 

;;(define-key hl-todo-mode-map (kbd "C-c p") 'hl-todo-previous)
;;(define-key hl-todo-mode-map (kbd "C-c n") 'hl-todo-next)
;;(define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)
;;(require 'hl-todo)
;;(global-hl-to-mode 1)
;;
;;(use-package highlight-quoted
;;  :diminish highlight-quoted-mode
;;  :commands highlight-quoted-mode
;;  :init (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode t))
;;
;;(use-package highlight-escape-sequences
;;  :diminish hes-mode
;;  :commands hes-mode
;;  :init (add-hook 'prog-mode-hook 'hes-mode t))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; FACE - FONT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq hrs/default-font "Inconsolata")
;;(setq hrs/default-font-size 14)
;;(setq hrs/current-font-size hrs/default-font-size)
;;
;;(setq hrs/font-change-increment 1.1)
;;
;;(defun hrs/font-code ()
;;  "Return a string representing the current font (like \"Inconsolata-14\")."
;;  (concat hrs/default-font "-" (number-to-string hrs/current-font-size)))
;;
;;(defun hrs/set-font-size ()
;;  "Set the font to `hrs/default-font' at `hrs/current-font-size'.
;;Set that for the current frame, and also make it the default for
;;other, future frames."
;;  (let ((font-code (hrs/font-code)))
;;    (add-to-list 'default-frame-alist (cons 'font font-code))
;;    (set-frame-font font-code)))
;;
;;(defun hrs/reset-font-size ()
;;  "Change font size back to `hrs/default-font-size'."
;;  (interactive)
;;  (setq hrs/current-font-size hrs/default-font-size)
;;  (hrs/set-font-size))
;;
;;(defun hrs/increase-font-size ()
;;  "Increase current font size by a factor of `hrs/font-change-increment'."
;;  (interactive)
;;  (setq hrs/current-font-size
;;        (ceiling (* hrs/current-font-size hrs/font-change-increment)))
;;  (hrs/set-font-size))
;;
;;(defun hrs/decrease-font-size ()
;;  "Decrease current font size by a factor of `hrs/font-change-increment', down to a minimum size of 1."
;;  (interactive)
;;  (setq hrs/current-font-size
;;        (max 1
;;             (floor (/ hrs/current-font-size hrs/font-change-increment))))
;;  (hrs/set-font-size))
;;
;;(define-key global-map (kbd "C-)") 'hrs/reset-font-size)
;;(define-key global-map (kbd "C-+") 'hrs/increase-font-size)
;;(define-key global-map (kbd "C-=") 'hrs/increase-font-size)
;;(define-key global-map (kbd "C-_") 'hrs/decrease-font-size)
;;(define-key global-map (kbd "C--") 'hrs/decrease-font-size)
;;
;;(hrs/reset-font-size)



;; ==(use-package org-bullets
;; ==  :ensure t
;; ==  :config
;; ==  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; ==
;; ==(require 'org-bullets)
;; ==(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
