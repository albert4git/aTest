(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '
	     ("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Theme
(use-package color-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(set-frame-font "Monaco 14" nil t)

(add-to-list 'default-frame-alist
             '(font . "Monaco 14"))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package nlinum
  :config
  (global-nlinum-mode))

;; TRY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package try
  :ensure t)
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package which-key
  :ensure t
  :config (which-key-mode))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package nlinum
  :ensure t
  :config (global-nlinum-mode))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package flycheck               ;;
  :ensure t                         ;;
  :init                             ;;
  (global-flycheck-mode t))         ;;
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package ggtags
  :ensure t
  :config 
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
  )
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode)
  :bind ("s-/" . undo-tree-visualize))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind ("s-h" . highlight-symbol))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package smartparens
:ensure t
:config
(use-package smartparens-config)
(use-package smartparens-html)
(use-package smartparens-python)
(use-package smartparens-latex)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
:bind
( ("C-<down>" . sp-down-sexp)
 ("C-<up>"   . sp-up-sexp)
 ("M-<down>" . sp-backward-down-sexp)
 ("M-<up>"   . sp-backward-up-sexp)
("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)



 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)

 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)

 ("C-S-f" . sp-forward-symbol)
 ("C-S-b" . sp-backward-symbol)

 ("C-<right>" . sp-forward-slurp-sexp)
 ("M-<right>" . sp-forward-barf-sexp)
 ("C-<left>"  . sp-backward-slurp-sexp)
 ("M-<left>"  . sp-backward-barf-sexp)

 ("C-M-t" . sp-transpose-sexp)
 ("C-M-k" . sp-kill-sexp)
 ("C-k"   . sp-kill-hybrid-sexp)
 ("M-k"   . sp-backward-kill-sexp)
 ("C-M-w" . sp-copy-sexp)

 ("C-M-d" . delete-sexp)

 ("M-<backspace>" . backward-kill-word)
 ("C-<backspace>" . sp-backward-kill-word)
 ([remap sp-backward-kill-word] . backward-kill-word)

 ("M-[" . sp-backward-unwrap-sexp)
 ("M-]" . sp-unwrap-sexp)

 ("C-x C-t" . sp-transpose-hybrid-sexp)

 ("C-c ("  . wrap-with-parens)
 ("C-c ["  . wrap-with-brackets)
 ("C-c {"  . wrap-with-braces)
 ("C-c '"  . wrap-with-single-quotes)
 ("C-c \"" . wrap-with-double-quotes)
 ("C-c _"  . wrap-with-underscores)
("C-c `"  . wrap-with-back-quotes)
))


;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package flx-ido
  :demand
  :init
  (setq
   ido-enable-flex-matching t
   ;; C-d to open directories
   ;; C-f to revert to find-file
   ido-show-dot-for-dired nil
   ido-enable-dot-prefix t)
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq inhibit-startup-message t)  ;; will inhibit startup messages.
(setq require-final-newline t)    ;;will make the last line end in a carriage return.
(fset 'yes-or-no-p 'y-or-n-p)     ;;will allow you to type just "y" instead of "yes" when you exit.
(setq next-line-add-newlines nil) ;;will disallow creation of new lines when you press the "arrow-down key" at end of the buffer.
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq modifier-keys-are-sticky t)
(setq display-time-day-and-date t) (display-time)  ;;will make the display of date and time persistent.
(require 'paren) (show-paren-mode t)               ;;will highlight matching parentheses next to cursor.
(setq-default indent-tabs-mode nil)                ;;will introduce spaces instead of tabs by default.
(setq-default truncate-lines t)                    ;;will trucate lines if they are too long.
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(split-window-horizontally)   ;; want two windows at startup 
(other-window 1)              ;; move to other window
(shell)                       ;; start a shell
(rename-buffer "shell-first") ;; rename it
(other-window 1)              ;; move back to first window 
;;(my-key-swap my-key-pairs)    ;; zap keyboard
;; XXX ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

