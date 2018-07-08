;; npm install -g eslint babel-eslint eslint-plugin-react
;; templates
(use-package pug-mode
  :defer t
  :mode ("\\.pug$" . pug-mode))

(use-package haml-mode
  :defer t)
;;===================================================================
;; general
(use-package general
  :init
  (general-evil-setup t)
  (progn
    (setq
     general-default-prefix "SPC"
     general-default-non-normal-prefix "C-SPC")
    )
  :config
  (progn
    ;; bind a key globally in normal state; keymaps must be quoted
    (setq general-default-keymaps
          '(evil-normal-state-map
            evil-visual-state-map))
    )
  (defun x/hydra-projectile/body()
    "if not in project, invoke counsel-projectile"
    (interactive)
    (if (not (projectile-project-p))
        (counsel-projectile)
      (hydra-projectile/body)))
  (general-define-key

   ;; simple command
   "'" '(multi-term :which-key "shell")
   "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
   "/"   'counsel-ag
   "SPC" '(counsel-M-x :which-key "M-x")
   "TAB" '(ivy-switch-buffer :which-key "prev buffer")
   "." '(avy-goto-word-or-subword-1  :which-key "go to word")

   ;; Applications
   ;"a" '(hydra-application/body :which-key "app")
   ;"f" '(hydra-file/body :which-key "file")
   ;"b" '(hydra-buffer/body :which-key "buffer")
   "w" '(x/hydra-window/body :which-key "window")
   "z" '(text-scale-adjust :which-key "zoom")
   "p" '(x/hydra-projectile/body :which-key "project"))
  )

;;===================================================================
(use-package doom-themes
  :init
  ;; to make the byte compiler happy.
  ;; emacs25 has no color-themes variable
  (setq color-themes '())
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  :config
  ;; load the theme, don't ask for confirmation
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package solaire-mode
  :init
  ;; brighten buffers (that represent real files)
  (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)

  ;; ...if you use auto-revert-mode:
  (add-hook 'after-revert-hook #'turn-on-solaire-mode)

  ;; You can do similar with the minibuffer when it is activated:
  (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

  ;; To enable solaire-mode unconditionally for certain modes:
  (add-hook 'ediff-prepare-buffer-hook #'solaire-mode))


(use-package smart-mode-line)

(use-package smart-mode-line-powerline-theme
  :after (smart-mode-line)
  :config
  (setq sml/theme 'powerline)
  (sml/setup))
;;===================================================================
(use-package which-key
  :defer 2
  :diminish which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  ;; simple then alphabetic order.
  (setq which-key-sort-order 'which-key-prefix-then-key-order)
  (setq which-key-popup-type 'side-window
        which-key-side-window-max-height 0.5
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.5
        which-key-min-display-lines 7))
;;===================================================================
;; apparences
(when window-system
  (tooltip-mode -1)                    ; don't know what that is
  (tool-bar-mode -1)                   ; sans barre d'outil
  ;(menu-bar-mode -1)                    ; barre de menu
  (scroll-bar-mode -1)                 ; enlève la barre de défilement
                                        ;(set-frame-font "Inconsolata 14")    ; police par défault
  (blink-cursor-mode 1)               ; pas de clignotement
  (global-visual-line-mode)
  (diminish 'visual-line-mode ""))

                                        ;(add-to-list 'default-frame-alist '(height . 46))
                                        ;(add-to-list 'default-frame-alist '(width . 85))

(when window-system
  (set-frame-size (selected-frame) 85 61))
;;===================================================================
;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq-default indent-tabs-mode nil
              tab-width 2)
;;===================================================================
  ;;; Sane default
(setq
 delete-old-versions -1
 version-control t
 vc-make-backup-files t
 vc-follow-symlinks t
 inhibit-startup-screen t
 ring-bell-function 'ignore
 coding-system-for-read 'utf-8
 coding-system-for-write 'utf-8
 sentence-end-double-space nil
 default-fill-column 80
 initial-scratch-message ""
 save-interprogram-paste-before-kill t
 help-window-select t
 tab-width 4
 make-backup-files nil
                                        ;debug-on-error 1
 )

(prefer-coding-system 'utf-8)
;;===================================================================
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file
  `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun add-magic-mode (mode &rest patterns)
  "Add entries to `magic-mode-alist' to use `MODE' for all given file
  `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'magic-mode-alist (cons pattern mode))))
;;===================================================================
(defun cleanup-and-save-buffer()
  "Save the buffer and cleanup whitespace."
  (interactive)
  (progn
    (whitespace-cleanup)
    (save-buffer)))

;; map s-s to cleanup-and-save-buffer instead of save-buffer
(global-set-key (kbd "s-s") 'cleanup-and-save-buffer)

;;===================================================================
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))
;;===================================================================

  (use-package neotree
  :config
  (general-evil-define-key 'normal neotree-mode-map
    (kbd "RET") '(neotree-enter)
    (kbd "TAB") '(neotree-enter)
    "q" '(neotree-hide)))
;;===================================================================
(use-package ivy-hydra)
;;===================================================================
(general-define-key
 "a" '(:ignore t :which-key "app")
 "ad" '(dired :which-key "dired")
 "an" '(deft :which-key "deft"))
;;===================================================================
(use-package evil
  :init
  (evil-mode 1)
  :config
  (progn
    (define-key evil-motion-state-map "/" 'swiper)))

(use-package evil-surround
  :init
  (progn
    (global-evil-surround-mode 1)
    ;; `s' for surround instead of `substitute'
    (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
    (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)))
;;===================================================================
(defhydra x/hydra-window
  (:color red :hint nil)
  "
window
"
  ("j" evil-window-down "down")
  ("k" evil-window-up "up")
  ("h" evil-window-left "left")
  ("l" evil-window-right "right")
  ("+" evil-window-increase-height "+ height")
  ("-" evil-window-decrease-height "- height")
  ("=" evil-balance-window "balance")
  (">" evil-window-increase-width "+ width")
  ("<" evil-window-decrease-width "- width")
  ("n" evil-window-next "next")
  ("q" nil "cancel" :color blue))
;;===================================================================

;;===================================================================

;;===================================================================
(use-package ivy
  :diminish ivy-mode
  :commands (ivy-switch-buffer
             ivy-switch-buffer-other-window)
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map (kbd "C-c o") 'ivy-occur))
;;===================================================================
(use-package counsel
  :ensure flx
  :bind*
  (("M-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-c f"   . counsel-git)
   ("C-c s"   . counsel-git-grep)
   ("C-c l"   . counsel-locate))
  :init
  (general-define-key
   "s" '(:ignore t :which-key "Search")
   "sp" 'counsel-git-grep
   )
  (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-plus)
          (swiper . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
  :config
  (setq counsel-find-file-ignore-regexp "\\.DS_Store\\|.git")

  (ivy-set-actions
   'counsel-find-file
   '(("o" (lambda (x) (counsel-find-file-extern x)) "open extern"))))
;;===================================================================
(use-package ibuffer-projectile
  :defer t
  :init
  (progn
    (defun x/ibuffer-group-by-projects ()
      "Group buffers by projects."
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic)))
    (add-hook 'ibuffer-hook 'x/ibuffer-group-by-projects)))
;;===================================================================

;; from spacemacs
(defun x/rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (dir (file-name-directory filename)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " dir)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (let ((dir (file-name-directory new-name)))
                 (when (and (not (file-exists-p dir)) (yes-or-no-p (format "Create directory '%s'?" dir)))
                   (make-directory dir t)))
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (when (fboundp 'recentf-add-file)
                 (recentf-add-file new-name)
                 (recentf-remove-if-non-kept filename))
               (x/drop-project-cache)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))

;;===================================================================
(defun x/copy-file ()
  "Write the file under new name."
  (interactive)
  (call-interactively 'write-file))

;;===================================================================
;; from magnars
(defun x/delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to delete this file? ")
        (delete-file filename t)
        (kill-buffer buffer)
        (x/drop-project-cache)
        (message "File '%s' successfully removed" filename)))))
;;==========????=========================================================
(general-define-key
 "f" '(:ignore t :which-key "file")
 "ff" '(counsel-find-file :which-key "find file")
 "fr" '(counsel-recentf :which-key "recentf")
 "fs" '(cleanup-and-save-buffer :which-key "save")
 "fS" '(evil-write-all :which-key "save all")
 "fc" '(x/copy-file :which-key "copy file")
 "fD" '(x/delete-current-buffer-file :which-key "delete")
 "fR" '(x/rename-current-buffer-file :which-key "rename")
 "ft" '(neotree-toggle :which-key "toggle neotree"))

(general-define-key
 "b" '(:ignore t :which-key "buffer")
 "bf" '(reveal-in-osx-finder :which-key "reveal in finder")
 "bb" '(ibuffer :which-key "ibuffer"))
;;===========-Deft-Helper ? ===================================================
(use-package deft
  :defer t
  :init
  (progn
    (setq deft-extensions '("org")
          deft-text-mode 'org-mode
          deft-use-filename-as-title t
          deft-recursive t
          deft-directory "~/io"
          deft-use-filter-string-for-filename t)

    (defun x/deft ()
      "Helper to call deft and then fix things so that it is nice and works"
      (interactive)
      (deft)
      ;; Hungry delete wrecks deft's DEL override
      (when (fboundp 'hungry-delete-mode)
        (hungry-delete-mode -1))
      ;; When opening it you always want to filter right away
      (evil-insert-state nil)))

  :config
  )
;;===================================================================
(use-package company
  :diminish '(company-mode . " ⓐ")
  :defer t
  :init
  (progn
    (add-hook 'after-init-hook #'global-company-mode)
    (setq company-idle-delay 0.2
          company-minimum-prefix-length 2
          company-require-match nil
          company-dabbrev-ignore-case nil
          company-dabbrev-downcase nil))
  :config
  (progn
    ;; key bindings

    (let ((map company-active-map))
      (define-key map (kbd "C-/")   'company-search-candidates)
      (define-key map (kbd "C-M-/") 'company-filter-candidates)
      (define-key map (kbd "C-d")   'company-show-doc-buffer))))
;;===================================================================

(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
    )
  )
;;===================================================================

(use-package evil-nerd-commenter
  :commands evilnc-comment-operator
  :init
  (general-define-key
   "c" '(:ignore t :which-key "comment")
   "cl" '(evilnc-comment-or-uncomment-lines :which-key "lines")
   "cp" '(evilnc-comment-or-uncomment-paragraphs :which-key "paragraphs"))


;;In order to make projectile-ag work, install ag. 
(defun x/drop-project-cache ()
  "invalidate projectile cache if it is currently active"
  (when (and (featurep 'projectile)
             (projectile-project-p))
    (call-interactively #'projectile-invalidate-cache)))




(use-package projectile
  :commands (projectile-ack
             projectile-ag
             projectile-compile-project
             projectile-dired
             projectile-find-dir
             projectile-find-file
             projectile-find-tag
             projectile-test-project
             projectile-grep
             projectile-invalidate-cache
             projectile-kill-buffers
             projectile-multi-occur
             projectile-project-p
             projectile-project-root
             projectile-recentf
             projectile-regenerate-tags
             projectile-replace
             projectile-replace-regexp
             projectile-run-async-shell-command-in-root
             projectile-run-shell-command-in-root
             projectile-switch-project
             projectile-switch-to-buffer
             projectile-vc)
  :ensure ag
  :config
  (projectile-global-mode))

(use-package counsel-projectile
  :config
  (counsel-projectile-on))



(defhydra hydra-projectile
  (:color teal :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

  ^Find File^        ^Search/Tags^        ^Buffers^       ^Cache^                    ^Project^
  ^---------^        ^-----------^        ^-------^       ^-----^                    ^-------^
  _f_: file          _a_: ag              _i_: Ibuffer    _c_: cache clear           _p_: switch proj
  _F_: file dwim     _g_: update gtags    _b_: switch to  _x_: remove known project
  _C-f_: file pwd    _o_: multi-occur   _s-k_: Kill all   _X_: cleanup non-existing
  _r_: recent file   ^ ^                  ^ ^             _z_: cache current
  _d_: dir
"
  ("a"   counsel-projectile-ag)
  ("b"   counsel-projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   counsel-projectile-find-dir)
  ("f"   counsel-projectile-find-file)
  ("F"   projectile-find-file-dwim)
  ("C-f" projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("p"   counsel-projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("q"   nil "cancel" :color blue))



