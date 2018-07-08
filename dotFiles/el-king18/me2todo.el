
(global-set-key
   (kbd "C-5")
   (defhydra hydra-buffer-menu (:color pink
                             :hint nil)
  "
^Mark^             ^Unmark^           ^Actions^          ^Search
^^^^^^^^-----------------------------------------------------------------                        (__)
_m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch                         (oo)
_s_: save          _U_: unmark up     _b_: bury          _I_: isearch                      /------\\/
_d_: delete        ^ ^                _g_: refresh       _O_: multi-occur                 / |    ||
_D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only^^    *  /\\---/\\
_~_: modified      ^ ^                ^ ^                ^^                                 ~~   ~~
"
  ("m" Buffer-menu-mark)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))
   )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -- (use-package ibuffer
;; --   :commands
;; --   (ibuffer)
;; --   :bind (:map ibuffer-mode-map
;; -- 			  ("a a" . ibuffer-mark-by-mode)
;; -- 			  ("a s" . ibuffer-mark-special-buffers)
;; -- 			  ("a m" . ibuffer-mark-unsaved-buffers)
;; -- 			  ("a u" . ibuffer-mark-modified-buffers)
;; -- 			  ("a r" . ibuffer-mark-by-name-regexp)
;; -- 			  ("a f" . ibuffer-mark-by-file-name-regexp)
;; -- 			  ("a d" . ibuffer-mark-dired-buffers)
;; -- 			  ("a h" . ibuffer-mark-hel-buffers)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -- (use-package multiple-cursors
;; -- :ensure t)
;; expand the marked region ToDo (negative prefix to reduce region ???)


(setq save-interprogram-paste-before-kill t)
(global-auto-revert-mode 1) ;; you might not want this
(setq auto-revert-verbose nil) ;; or this
;; (global-set-key (kbd "<f6>") 'revert-buffer)

(use-package ace-window
:ensure t
:init
(progn
(setq aw-scope 'frame)
(global-set-key (kbd "C-x O") 'other-frame)
(global-set-key [remap other-window] 'ace-window)
(custom-set-faces
 '(aw-leading-char-face
   ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; --  (use-package avy
;; --  :ensure t
;; --  :bind ("M-s" . avy-goto-word-1)) ;; changed from char as per jcs


(use-package auto-complete 
:ensure t
:init
(progn
(ac-config-default)
(global-auto-complete-mode t)
))
;;;;

(use-package cc-mode
  :defer t
  :config
  (add-hook 'c-mode-hook
	    (lambda ()
	      (c-set-style "bsd")))
  (add-hook 'c++-mode-hook 'google-set-c-style)
  (add-hook 'java-mode-hook
	    (lambda ()
	      (setq c-basic-offset 4
		    tab-width 4
		    indent-tabs-mode t))))

(use-package magit
  :commands (magit-status-internal
	     magit-status
	     magit-diff
	     magit-log)
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  :config
  (use-package magithub)
  (setq magit-push-always-verify nil)
  (setq magit-completing-read-function 'helm--completing-read-default)

  (defun display-buffer-full-screen (buffer alist)
    (delete-other-windows)
    (set-window-dedicated-p nil nil)
    (set-window-buffer nil buffer)
    (get-buffer-window buffer))

  (setq magit-display-buffer-function
	(lambda (buffer)
	  (if magit-display-buffer-noselect
	      (magit-display-buffer-traditional buffer)
	    (display-buffer buffer '(display-buffer-full-screen)))))

  (advice-add 'magit-visit-item :after 'reposition-window)
  ) ;; - magit -

(use-package git-timemachine
  :commands git-timemachine
  :config
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  ;; force update evil keymaps after git-timemachine-mode loaded
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))

(use-package help-mode
  :init
  (defun my-help-button-action-advice (orig-fun &rest args)
    "Reuse current window when following links."
    (cl-letf (((symbol-function 'pop-to-buffer)
	       'switch-to-buffer))
      (apply orig-fun args)))
  (advice-add 'help-button-action :around 'my-help-button-action-advice))

 ;; abbrev
 (use-package abbrev
   :diminish abbrev-mode
   :init
   (setq save-abbrevs 'silently)
   :config
   (if (file-exists-p abbrev-file-name)
       (quietly-read-abbrev-file)))

 ;; subword navigation
 (use-package subword
   :hook (prog-mode . subword-mode)
   :diminish subword-mode
   :config
   (subword-mode 1))
 ;; was ist das ?
 (use-package visual-line
   :hook ((text-mode . visual-line-mode)
 		 (visual-line-mode . sk/diminish-visual-line))
   :commands
   (visual-line-mode))
 ;; visual line - soft wrap
 (defun sk/diminish-visual-line ()
   "diminish visual line mode"
   (interactive)
   (diminish 'visual-line-mode " ω"))

 ;; string manipulation library
 (use-package s
   :ensure t)
 ;; list library
 (use-package dash
   :ensure t)

 ;; debugging gdb
 (use-package gud
   :init
   (setq gdb-many-windows t
         gdb-show-main t)
   :commands
   (gud-run
    gud-down
    gud-up
    gud-next
    gud-step
    gud-next
    gud-finish
    gud-cont
    gud-goto-info
    gud-basic-call
    gud-print
    gud-refresh
    gud-find-c-expr
    gdb-toggle-breakpoint
    gdb-delete-breakpoint
    gdb))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package exec-path-from-shell
  :if (eq system-type 'darwin)
  :init
  (exec-path-from-shell-initialize))

(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :commands volatile-highlights-mode
  :init (add-hook 'after-init-hook 'volatile-highlights-mode t))

(use-package highlight-numbers
  :diminish highlight-numbers-mode
  :commands highlight-numbers-mode
  :init (add-hook 'prog-mode-hook 'highlight-numbers-mode t))

(use-package highlight-quoted
  :diminish highlight-quoted-mode
  :commands highlight-quoted-mode
  :init (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode t))

(use-package highlight-escape-sequences
  :diminish hes-mode
  :commands hes-mode
  :init (add-hook 'prog-mode-hook 'hes-mode t))


  (use-package helm-firefox
    :commands helm-firefox-bookmarks
    :config
    (defun helm-get-firefox-user-init-dir ()
      "Return name of Firefox profile to list bookmarks for."
      "~/.mozilla/firefox/mwad0hks.default/"))



((auto-completion :variables auto-completion-enable-sort-by-usage t)
 bepo better-defaults
 (c-c++ :variables c-c++-enable-clang-support t)
 colors emacs-lisp git github
 (haskell :variables haskell-enable-ghci-ng-support t)
 markdown
 (org :variables org-enable-github-support t)
 shell shell-scripts syntax-checking
 (rust :variables rust-enable-racer t)
 yaml)

;;;;;;;;;;;;;;;;;;;;FOXI start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  https://gitlab.ida.liu.se/jonve547/dotfiles/blob/e3d7101c88c6f1f3ab01998b88599e3bb1feb671/.emacs.d/init.el


(use-package evil-leader   :ensure t   :diminish evil-leader-mode   :config   (evil-leader/set-leader ",")   (evil-leader/set-key   "f" 'find-file   "b" 'switch-to-buffer   "B" 'buffer-menu   "k" 'kill-buffer   "pp" 'projectile-switch-project   "pf" 'projectile-find-file   "pk" 'projectile-kill-buffers   "pt" 'projectile-find-other-file   "ss" 'split-window-horizontally   "vv" 'split-window-vertically   "dw"	'delete-window   "do" 'delete-other-windows   "sf" 'save-buffer   "sa" 'save-some-buffers   "g" 'magit-status   "r" 'replace-string   "R" 'ggtags-query-replace   "x" 'ansi-term   "jd" 'ggtags-find-definition   "D" 'dired   "c" 'idomenu)   (global-evil-leader-mode)) (use-package evil   :ensure t   :bind (:map evil-normal-state-map 	      ("j" . evil-next-visual-line) 	      ("k" . evil-previous-visual-line) 	      ("C-h" . evil-window-left) 	      ("C-j" . evil-window-down) 	      ("C-k" . evil-window-up) 	      ("C-l" . evil-window-right) 	      ("M-k" . evil-scroll-up) 	      ("M-j" . evil-scroll-down))   :config   (evil-set-initial-state 'dired-mode 'emacs)   (evil-set-initial-state 'magit-mode 'emacs)   (setq evil-move-cursor-back nil)   (evil-mode 1)) (use-package evil-surround   :ensure t   :config (global-evil-surround-mode 1)) (use-package gruvbox-theme :ensure t) (use-package diminish   :ensure t   :config   (diminish 'visual-line-mode)   (with-eval-after-load 'undo-tree (diminish 'undo-tree-mode))   (with-eval-after-load	 'eldoc (diminish 'eldoc-mode))   (with-eval-after-load 'abbrev (diminish 'abbrev-mode))) (defun my-dired-parent-dir ()   (interactive)   (find-alternate-file "..")) (use-package dired   :bind (:map dired-mode-map 	      ("RET" . dired-find-alternate-file) 	      ("<return>" . dired-find-alternate-file) 	      ("a" . dired-find-file) 	      ("q" . kill-this-buffer) 	      ("p" . my-dired-parent-dir) 	      ("f" . isearch-forward) 	      ("F" . isearch-backward))) (use-package term   :bind ("C-x C-d" . term-send-eof)   :config (setq term-buffer-maximum-size 0)) ;;; yasnippet ;;; should be loaded before auto complete so that they can work together (use-package yasnippet   :ensure t   :defer t   :diminish yas-minor-mode   :init (add-hook 'prog-mode-hook (lambda () (yas-minor-mode)))   :config   (setq yas-snippet-dirs '("~/.emacs.d/snippets"))   (yas-reload-all)) (use-package company   :ensure t   :defer t   :diminish company-mode   :bind (("C-RET" . company-manual-begin) 	 ("<C-return>" . company-manual-begin) 	 :map company-active-map 	 ("TAB" . nil) 	 ("<tab>" . nil))   :init (add-hook 'prog-mode-hook (lambda () (company-mode)))   :config   (setq company-idle-delay 0)   (setq company-minimum-prefix-length 2)   (setq company-clang-executable "/usr/bin/clang-3.7")) (use-package projectile   :ensure t   :diminish projectile-mode   :config   (setq projectile-other-file-alist '(("c" "h") 				      ("h" "c" "cc" "cpp") 				      ("cc" "h") 				      ("cpp" "h")))   (setq projectile-globally-ignored-file-suffixes '(".fls"                                                     ".log"                                                     ".fdb_latexmk"                                                     ".aux"                                                     ".dvi"))   (projectile-global-mode)) (use-package flycheck   :ensure t   :defer t   :diminish flycheck-mode   :init (add-hook 'prog-mode-hook 'flycheck-mode)   :config   (setq flycheck-c/c++-gcc-executable "gcc-5")   (setq flycheck-gcc-language-standard "c++14")   (use-package flycheck-pos-tip     :ensure t     :config (flycheck-pos-tip-mode))) ;; PYTHON SETTINGS (use-package company-jedi   :ensure t   :defer t   :init   (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))) ;; RUST SETTINGS (use-package rust-mode   :ensure t   :mode ("\\.rs\\'" . rust-mode)   :config   (use-package flycheck-rust     :ensure t     :config     (add-hook 'rust-mode-hook 'flycheck-rust-setup))) (use-package ggtags   :ensure t   :defer t   :diminish ggtags-mode   :init (add-hook 'prog-mode-hook 'ggtags-mode)) (use-package magit   :ensure t   :defer t   :bind (:map magit-status-mode-map 	      ("q" . kill-this-buffer))   :diminish auto-revert-mode) (use-package powerline-evil   :ensure t   :diminish powerline-minor-modes   :config (powerline-evil-vim-color-theme)) (use-package ido   :ensure t   :config   (setq ido-vertical-define-keys 'C-n-and-C-p-only)   (ido-mode 1)   (use-package ido-vertical-mode     :ensure t     :config (ido-vertical-mode 1))   (use-package ido-ubiquitous     :ensure t     :config (ido-ubiquitous-mode 1))   (use-package idomenu :ensure t)) (use-package smex   :ensure t   :bind ("M-x" . smex)) (use-package irony   :ensure t   :defer t   :diminish irony-mode   :init   (defun my-irony-mode-hook ()     (define-key irony-mode-map [remap completion-at-point]       'irony-completion-at-point-async)     (define-key irony-mode-map [remap complete-symbol]       'irony-completion-at-point-async))   (add-hook 'c++-mode-hook 'irony-mode)   (add-hook 'c-mode-hook 'irony-mode)   (add-hook 'objc-mode-hook 'irony-mode)   (add-hook 'irony-mode-hook 'eldoc-mode)   (add-hook 'irony-mode-hook 'my-irony-mode-hook)   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)   :config   (setq irony-additional-clang-options '("-std=c++14"))   (use-package company-irony     :ensure t     :config (add-to-list 'company-backends '(company-irony)))   (use-package flycheck-irony     :ensure t     :config (flycheck-irony-setup))   (use-package company-irony-c-headers     :ensure t     :config (add-to-list 'company-backends '(company-irony-c-headers)))   (use-package irony-eldoc     :ensure t     :config (add-hook 'irony-mode-hook 'irony-eldoc))) ;; esc quits (defun minibuffer-keyboard-quit ()   "Abort recursive edit. In Delete Selection mode, if the mark is active, just deactivate it; then it takes a second \\[keyboard-quit] to abort the minibuffer."   (interactive)   (if (and delete-selection-mode transient-mark-mode mark-active)       (setq deactivate-mark  t)     (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))     (abort-recursive-edit))) (define-key evil-normal-state-map [escape] 'keyboard-quit) (define-key evil-visual-state-map [escape] 'keyboard-quit) (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit) (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit) (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit) (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit) (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit) (custom-set-faces  ;; custom-set-faces was added by Custom.  ;; If you edit it by hand, you could mess it up, so be careful.  ;; Your init file should contain only one such instance.  ;; If there is more than one, they won't work right.  '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight semi-bold :height 98 :width normal))))  '(linum ((t (:foreground "#666462"))))  '(linum-relative-current-face ((t (:foreground "#a89984"))))  '(term-color-blue ((t (:background "deep sky bluei" :foreground "cornflower blue"))))  '(term-color-green ((t (:background "#aeee00" :foreground "#aeee00"))))) (provide 'init)

;;;;;;;;;;;;;;;;;;;;FOXI end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     (add-hook 'c-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\):" 1
                    font-lock-warning-face t)))))






;;; Color theme based on Moria for VIM.
(defun color-theme-moria ()
  "A color theme based on Moria for VIM."
  (interactive)
  (color-theme-install
   '(color-theme-moria
     ((foreground-color . "#000000") ;done
      (cursor-color . "#ffffff")
      (background-color . "#f0f0f0") ;done
      (background-mode . light)) ;done
     (default ((t (nil)))) ;done
     (underline ((t (:underline t)))) ;done
     (modeline ((t (:foreground "black" :background "#000000"))))
     (modeline-buffer-id ((t (:foreground "red" :background "#0000ff"))))
     (modeline-mousable ((t (:foreground "cyan" :background "#007080"))))
     (modeline-mousable-minor-mode ((t (:foreground "cyan" :background "#007080"))))
     (highlight ((t (:background "#d0d0d0")))) ;done
     (region ((t (:background "#c0c0c0")))) ;done
     (font-lock-builtin-face ((t (:foreground "black"))))
     (font-lock-constant-face ((t (:foreground "#ff0000")))) ;hmmm
     (font-lock-comment-face ((t (:foreground "#786000")))) ;done
     (font-lock-function-name-face ((t (:foreground "#000000" )))) ;done
     ; highlight ma brackets
     (font-lock-add-keywords nil '(("\\([\{\}\\[\]\(\)]+\\)" 1 font-lock-keyword-face prepend)))
     (font-lock-preprocessor-face ((t (:foreground "#912F11" :bold t))))
     (font-lock-keyword-face ((t (:foreground "#1f3f81" :bold t)))) ; done e.g. defun

     (font-lock-string-face ((t (:foreground "#077807")))) ;done
     (font-lock-variable-name-face ((t (:foreground "#ff0000" )))) ;hmmm
     (font-lock-warning-face ((t (:foreground "#ff0000"))))
     (highlight-changes-face ((t (:background "#ff0000"))))
     (highlight-changes-delete-face ((t (:foreground "red" :background "pink"))))
     (show-paren-match ((t (:foreground "#2e3436" :background "#73d216"))))

     (widget-field-face ((t (:foreground "pink" :background "red"))))
     (widget-inactive-face ((t (:foreground "gray"))))
     (custom-button-face ((t (:foreground "yellow" :background "dark blue"))))
     (custom-state-face ((t (:foreground "mediumaquamarine"))))
     (custom-face-tag-face ((t (:foreground "goldenrod" :underline t))))
     (custom-documentation-face ((t (:foreground "#10D010"))))
     (custom-set-face ((t (:foreground "#2020D0"))))
     )
   )
  )
