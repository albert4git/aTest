;;==============================================================================
(set-background-color "cyan")
;;==============================================================================
(use-package helm
  :ensure t
  :demand t
  :diminish helm-mode
  :bind (("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-x 8"   . helm-ucs))
  :bind* (("M-m SPC h r" . helm-resume)
          ("M-m SPC r"   . helm-for-files)
          ("M-m SPC x"   . helm-apropos)
          ("M-m SPC C" . helm-colors)
          ("M-m SPC h R" . helm-regexp)
          ("M-m SPC h u" . helm-surfraw)
          ("M-m SPC h t" . helm-top)
          ("M-m SPC h p" . helm-list-emacs-process)
          ("M-m SPC F"   . helm-find)
          ("M-m SPC h k" . helm-calcul-expression)
          ("M-m SPC h i" . helm-info-at-point)
          ("M-m SPC h d" . helm-man-woman)
          ("M-m SPC h h" . helm-documentation)
          ("M-m SPC h e" . helm-run-external-command)
          ("M-m ;"       . helm-all-mark-rings)
          ("M-m SPC h x" . helm-select-xfont)
          ("M-m t"       . helm-semantic-or-imenu))
  :bind (:map helm-map
              ("<return>"   . helm-maybe-exit-minibuffer)
              ("RET"        . helm-maybe-exit-minibuffer)
              ("<tab>"      . helm-select-action)
              ("C-i"        . helm-select-action)
              ("S-<return>" . helm-maybe-exit-minibuffer)
              ("S-RET"      . helm-maybe-exit-minibuffer)
              ("C-S-m"      . helm-maybe-exit-minibuffer))
  :bind (:map helm-find-files-map
              ("<return>"    . helm-execute-persistent-action)
              ("RET"         . helm-execute-persistent-action)
              ("<backspace>" . dwim-helm-find-files-up-one-level-maybe)
              ("DEL"         . dwim-helm-find-files-up-one-level-maybe)
              ("<tab>"       . helm-select-action)
              ("C-i"         . helm-select-action)
              ("S-<return>"  . helm-maybe-exit-minibuffer)
              ("S-RET"       . helm-maybe-exit-minibuffer)
              ("C-S-m"       . helm-maybe-exit-minibuffer))
  :bind (:map helm-read-file-map
              ("<return>"    . helm-execute-persistent-action)
              ("RET"         . helm-execute-persistent-action)
              ("<backspace>" . dwim-helm-find-files-up-one-level-maybe)
              ("DEL"         . dwim-helm-find-files-up-one-level-maybe)
              ("<tab>"       . helm-select-action)
              ("C-i"         . helm-select-action)
              ("S-<return>"  . helm-maybe-exit-minibuffer)
              ("S-RET"       . helm-maybe-exit-minibuffer)
              ("C-S-m"       . helm-maybe-exit-minibuffer))
  :commands (helm-mode
             helm-M-x
             helm-smex
             helm-find-files
             helm-buffers
             helm-recentf)
  :config
  ;; require basic config
  (require 'helm-config)
  (helm-mode 1)

  ;; use silver searcher when available
  (when (executable-find "ag-grep")
    (setq helm-grep-default-command "ag-grep -Hn --no-group --no-color %e %p %f"
          helm-grep-default-recurse-command "ag-grep -H --no-group --no-color %e %p %f"))


  ;; set height and stuff
  (helm-autoresize-mode 1)
  (setq helm-autoresize-max-height 20
        helm-autoresize-min-height 20)

  ;; Work with Spotlight on OS X instead of the regular locate
  (setq helm-locate-command "mdfind -name -onlyin ~ %s %s")

  ;; Make sure helm always pops up in bottom
  (setq helm-split-window-in-side-p t)

  (add-to-list 'display-buffer-alist
               '("\\`\\*helm.*\\*\\'"
                 (display-buffer-in-side-window)
                 (inhibit-same-window . t)
                 (window-height . 0.2)))

  ;; provide input in the header line and hide the mode lines above
  (setq helm-echo-input-in-header-line t)

  (defvar bottom-buffers nil
    "List of bottom buffers before helm session.
      Its element is a pair of `buffer-name' and `mode-line-format'.")

  (defun bottom-buffers-init ()
    (setq-local mode-line-format (default-value 'mode-line-format))
    (setq bottom-buffers
          (cl-loop for w in (window-list)
                   when (window-at-side-p w 'bottom)
                   collect (with-current-buffer (window-buffer w)
                             (cons (buffer-name) mode-line-format)))))

  (defun bottom-buffers-hide-mode-line ()
    (setq-default cursor-in-non-selected-windows nil)
    (mapc (lambda (elt)
            (with-current-buffer (car elt)
              (setq-local mode-line-format nil)))
          bottom-buffers))

  (defun bottom-buffers-show-mode-line ()
    (setq-default cursor-in-non-selected-windows t)
    (when bottom-buffers
      (mapc (lambda (elt)
              (with-current-buffer (car elt)
                (setq-local mode-line-format (cdr elt))))
            bottom-buffers)
      (setq bottom-buffers nil)))

  (defun helm-keyboard-quit-advice (orig-func &rest args)
    (bottom-buffers-show-mode-line)
    (apply orig-func args))

  (add-hook 'helm-before-initialize-hook #'bottom-buffers-init)
  (add-hook 'helm-after-initialize-hook #'bottom-buffers-hide-mode-line)
  (add-hook 'helm-exit-minibuffer-hook #'bottom-buffers-show-mode-line)
  (add-hook 'helm-cleanup-hook #'bottom-buffers-show-mode-line)
  (advice-add 'helm-keyboard-quit :around #'helm-keyboard-quit-advice)

  ;; remove header lines if only a single source
  (setq helm-display-header-line nil)

  (defvar helm-source-header-default-background (face-attribute 'helm-source-header :background))
  (defvar helm-source-header-default-foreground (face-attribute 'helm-source-header :foreground))
  (defvar helm-source-header-default-box (face-attribute 'helm-source-header :box))

  (defun helm-toggle-header-line ()
    (if (> (length helm-sources) 1)
      (set-face-attribute 'helm-source-header
                          nil
                          :foreground helm-source-header-default-foreground
                          :background helm-source-header-default-background
                          :box helm-source-header-default-box
                          :height 1.0)
      (set-face-attribute 'helm-source-header
                          nil
                          :foreground (face-attribute 'helm-selection :background)
                          :background (face-attribute 'helm-selection :background)
                          :box nil
                          :height 0.1)))

  (add-hook 'helm-before-initialize-hook 'helm-toggle-header-line)

  ;; hide the minibuffer when helm is active
  (defun helm-hide-minibuffer-maybe ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                                `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))

  (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)

  ;; Proper find file behavior
  (defun dwim-helm-find-files-up-one-level-maybe ()
    (interactive)
    (if (looking-back "/" 1)
        (call-interactively 'helm-find-files-up-one-level)
      (delete-backward-char 1)))

  (defun dwim-helm-find-files-navigate-forward (orig-fun &rest args)
    "Adjust how helm-execute-persistent actions behaves, depending on context"
    (if (file-directory-p (helm-get-selection))
        (apply orig-fun args)
      (helm-maybe-exit-minibuffer)))

  (advice-add 'helm-execute-persistent-action :around #'dwim-helm-find-files-navigate-forward)

  ;; better smex integration
  (use-package helm-smex
    :ensure t
    :bind* (("M-x" . helm-smex)
            ("M-X" . helm-smex-major-mode-commands)))

  ;; Make helm fuzzier
  (use-package helm-fuzzier
    :ensure t
    :config
    (helm-fuzzier-mode 1))

  ;; Add support for flx
  (use-package helm-flx
    :ensure t
    :config
    (helm-flx-mode 1))

  ;; Add helm-bibtex
  (use-package helm-bibtex
    :ensure t
    :bind* (("M-m SPC b" . helm-bibtex))
    :init
    (setq bibtex-completion-bibliography '("~/Dropbox/org/references/multiphysics.bib" "~/Dropbox/org/references/chanceconstraints.bib" "~/Dropbox/org/references/tensors.bib"))
    (setq bibtex-completion-library-path "~/Dropbox/org/references/pdfs")
    (setq bibtex-completion-notes-path "~/Dropbox/org/references/articles.org"))

  ;; to search in projects - the silver searcher
  (use-package helm-ag
    :ensure t
    :bind* (("M-m g s" . helm-do-ag-project-root)
            ("M-m g e" . helm-do-ag)))

 ;;   ;; to search in files
 ;;   (use-package helm-swoop
 ;;     :ensure t
 ;;     :bind (("C-s" . helm-swoop-without-pre-input))
 ;;     :bind* (("M-m #"   . helm-swoop)
 ;;             ("M-m g /" . helm-multi-swoop)
 ;;             ("M-m o /" . helm-multi-swoop-org)
 ;;             ("M-m g E" . helm-multi-swoop-all))
 ;;     :init
 ;;     (setq helm-swoop-split-with-multiple-windows nil
 ;;           helm-swoop-split-direction 'split-window-vertically
 ;;           helm-swoop-split-window-function 'helm-default-display-buffer))

  ;; to help with projectile
;; nof-   (use-package helm-projectile
;; nof-     :ensure t
;; nof-     :bind* (("M-m SPC d" . helm-projectile))
;; nof-     :init
;; nof-     (setq projectile-completion-system 'helm))

;; Albert next

  ;; to describe bindings
  (use-package helm-descbinds
    :ensure t
    :bind* (("M-m SPC ?" . helm-descbinds)))

  ;; Control AWS via helm
  (use-package helm-aws
    :ensure t
    :bind* (("M-m SPC h w" . helm-aws)))

  ;; Control circe with helm
  (use-package helm-circe
    :ensure t
    :bind* (("M-m SPC h j" . helm-circe)
            ("M-m SPC h J" . helm-circe-new-activity)))


  ;; Select snippets with helm
  (use-package helm-c-yasnippet
    :ensure t
    :bind (("C-o" . helm-yas-complete))
    :bind* (("C-,"        . helm-yas-create-snippet-on-region)
            ("C-<escape>" . helm-yas-visit-snippet-file)))

  ;; Helm integration with make
  (use-package helm-make
    :ensure t
    :init
    (setq helm-make-build-directory "build")
    :bind* (
            ("M-m SPC M" . helm-make)
            )))

;; ("M-m SPC m" . helm-make-projectile)
;;==============================================================================
(set-background-color "pink")
;;==============================================================================
