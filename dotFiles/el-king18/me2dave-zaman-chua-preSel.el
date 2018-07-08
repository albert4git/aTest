  ;; Commands
  (put 'dired-find-alternate-file 'disabled nil)

  ;; Key Bindings
  (bind-keys :map dired-mode-map
             (")" . dired-hide-details-mode)
             ((vector 'remap 'beginning-of-buffer) . dired-jump-to-top)
             ((vector 'remap 'end-of-buffer) . dired-jump-to-bottom))

  ;; Variables
  (setq dired-dwim-target t)
  (setq dired-isearch-filenames "dwim")
  (setq dired-listing-switches "-alh --time-style=long-iso")
  (setq dired-recursive-copies 'always))
;;;;;;;;;;;;;;;;;;;;
;;; Byte-Compile ;;;
;;;;;;;;;;;;;;;;;;;;

; Commands
(defun recompile-elisp-file ()
  (interactive)
  (when (and buffer-file-name (string-match "\\.el" buffer-file-name))
    (let ((byte-file (concat buffer-file-name "\\.elc")))
      (if (or (not (file-exists-p byte-file))
              (file-newer-than-file-p buffer-file-name byte-file))
          (byte-compile-file buffer-file-name)))))

(add-hook 'after-save-hook #'recompile-elisp-file)
;;;;;;;;;;;;;;;
;;; Buffers ;;;
;;;;;;;;;;;;;;;

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  ;; Functions
  (defun ibuffer-group-buffers ()
    (ibuffer-switch-to-saved-filter-groups "Default"))

  ;; Hooks
  (add-hook 'ibuffer-mode-hook #'ibuffer-group-buffers)
  (add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)

  ;; Variables
  (setq-default ibuffer-saved-filter-groups
                '(("Default"
                   ("Dired" (mode . dired-mode))
                   ("Magit" (name . "\*magit.+*"))
                   ("Org" (mode . org-mode))
                   ("Grep" (name . "\*grep-.*"))
                   ("Temporary" (name . "\*.*\*"))))))

;;=======================================================================================
;;Emacs treats camelCase strings as a single word by default, this changes said behaviour.
(global-subword-mode 1)

(defun config-reload ()
 "Reloads ~/.emacs.d/config.org at runtime"
 (interactive)
 (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
  (global-set-key (kbd "C-c r") 'config-reload)


  (setq electric-pair-pairs '(
                              (?\{ . ?\})
                              (?\( . ?\))
                              (?\[ . ?\])
                              (?\" . ?\")
                             ))


(show-paren-mode 1)

(setq kill-ring-max 100)


(use-package yasnippet
   :ensure t
   :config
   (use-package yasnippet-snippets
    :ensure t)
   (yas-reload-all)
)

(use-package flycheck
   :ensure t)

;;#################################################################################
#+BEGIN_SRC emacs-lisp
  (use-package company
    :ensure t
    :config
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 3))

  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    (define-key company-active-map (kbd "SPC") #'company-abort))
#+END_SRC

** specific languages
Be it for code or prose, completion is a must.
After messing around with =auto-completion= for a while I decided to drop it
in favor of =company=, and it turns out to have been a great decision.

*** c/c++
**** yasnippet
#+BEGIN_SRC emacs-lisp
  (add-hook 'c++-mode-hook 'yas-minor-mode)
  (add-hook 'c-mode-hook 'yas-minor-mode)
#+END_SRC

**** flycheck
#+BEGIN_SRC emacs-lisp
  (use-package flycheck-clang-analyzer
    :ensure t
    :config
    (with-eval-after-load 'flycheck
      (require 'flycheck-clang-analyzer)
       (flycheck-clang-analyzer-setup)))
#+END_SRC

**** company
Requires libclang to be installed.
#+BEGIN_SRC emacs-lisp
  (with-eval-after-load 'company
    (add-hook 'c++-mode-hook 'company-mode)
    (add-hook 'c-mode-hook 'company-mode))

  (use-package company-c-headers
    :ensure t)

  (use-package company-irony
    :ensure t
    :config
    (setq company-backends '((company-c-headers
                              company-dabbrev-code
                              company-irony))))

  (use-package irony
    :ensure t
    :config
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
#+END_SRC
;;#################################################################################
