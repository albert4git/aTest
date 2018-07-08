(set-background-color "lightYellow1") ;; misty rose
;;============================================================================================
(use-package ibuffer
             :bind ("C-x C-b" . ibuffer)
             :config
             (defun ibuffer-group-buffers ()
               (ibuffer-switch-to-saved-filter-groups "Default"))
             (add-hook 'ibuffer-mode-hook #'ibuffer-group-buffers)
             (add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)

             (setq-default ibuffer-saved-filter-groups
                           '(("Default"
                              ("Dired" (mode . dired-mode))
                              ("Magit" (name . "\*magit.+*"))
                              ("Org" (mode . org-mode))
                              ("Grep" (name . "\*grep-.*"))
                              ("Temporary" (name . "\*.*\*"))))))

;;============================================================================================
(global-set-key (kbd "C-x b") 'ibuffer)

;;=================-i-Do-=====================================================================
(use-package ido
             :config
             (setq ido-enable-flex-matching t)
             (ido-everywhere t)
             (ido-mode 1))

(use-package flx-ido
             :ensure t
             :config
             (progn
               (setq ido-use-faces nil) ; disable ido faces to see flx highlights
               (flx-ido-mode 1)))

(use-package ido-vertical-mode
             :ensure t
             :config
             (progn
               (ido-vertical-mode 1))) ; flx-ido looks better with ido-vertical-mode

(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;;=======================-i-Do-=====================================================================
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background "yellow"
                    :foreground "green3")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)
(ido-vertical-mode 1)

;; smex ============================================================================================
(use-package smex
             :bind (("M-x" . smex)
                    ("<menu>" . smex-major-mode-commands))
             :config
             (setq smex-save-file "~/.emacs.d/.smex-items"))

;; dmenu ============================================================================================
(use-package dmenu
             :ensure t
             :bind
             ("s-m d" . 'dmenu))

;; imenu ============================================================================================
(use-package imenu
             :custom
             (imenu-auto-rescan t)
             :hook
             (emacs-lisp-mode . hemacs-imenu-elisp-expressions)
             :config
             (defun hemacs-imenu-elisp-expressions ()
               (dolist (pattern '((nil "^(def \\(.+\\)$" 1)
                                  ("sections" "^;;;;; \\(.+\\)$" 1)))
                 (add-to-list 'imenu-generic-expression pattern))))

;;==============================================================================================
;;==============================================================================================
(use-package counsel
             :ensure t
             :bind
             (("M-y" . counsel-yank-pop)
              :map ivy-minibuffer-map
              ("M-y" . ivy-next-line)))

;; xxxx ==================================================
(use-package ivy
             :ensure t
             :diminish (ivy-mode)
             :bind (("C-x b" . ivy-switch-buffer))
             :config
             (ivy-mode 1)
             (setq ivy-use-virtual-buffers t)
             (setq ivy-count-format "%d/%d ")
             (setq ivy-display-style 'fancy))

;;==================================================
;; xxxx Albert ("M-x" . counsel-M-x) xxxxx
;; ("C-c C-r" . ivy-resume)
;; ("C-x C-f" . counsel-find-file)
;;==================================================
(use-package swiper
             :ensure t
             :bind (("C-s" . swiper)
                    ("C-r" . swiper)
                    )
             :config
             (progn
               (ivy-mode 1)
               (setq ivy-use-virtual-buffers t)
               (setq ivy-display-style 'fancy)
               (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
               ))

;; =================================================================================================
(set-background-color "yellow1") 
