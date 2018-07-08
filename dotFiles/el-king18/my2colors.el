;; =============================================================================
;; syntax highlighting everywhere
(require 'font-lock)
(global-font-lock-mode 1)
(load-theme 'leuven)
;; =============================================================================
(set-face-attribute 'region nil :background "gold" :foreground "brown")
(set-cursor-color "red")
;;(highlight ((t (:background ,zenburn-bg-05 :foreground ,yellow))))
(set-face-foreground 'font-lock-function-name-face "red4") ;; funktions-Name
;;(set-face-background 'font-lock-function-name-face "cyan")
(set-face-foreground 'font-lock-type-face "blue1") ;; int, string , void
;; (set-face-background 'font-lock-type-face "lightblue")
(set-face-foreground 'font-lock-keyword-face "blue3") ;; public , class, for 
;;(set-face-background 'font-lock-keyword-face "plum")
;; =============================================================================
(set-face-foreground 'font-lock-string-face "navy")
(set-face-background 'font-lock-string-face "cyan")
;; =============================================================================
(set-face-foreground 'font-lock-variable-name-face "dark green")
;;(set-face-background 'font-lock-variable-name-face "light cyan")

(set-face-foreground 'font-lock-builtin-face "black")
(set-face-background 'font-lock-builtin-face "pink")

(set-face-foreground 'font-lock-constant-face "black")
(set-face-background 'font-lock-constant-face "yellow") ;; mini buffer back?
(set-face-foreground 'font-lock-warning-face "blue")
(set-face-background 'font-lock-warning-face "red")
(set-face-foreground 'font-lock-comment-delimiter-face "gray40")
(set-face-background 'font-lock-comment-delimiter-face "white")
(set-face-foreground 'font-lock-comment-face "gray40")
(set-face-background 'font-lock-comment-face "white")

(make-face-bold 'font-lock-variable-name-face)
(make-face-bold 'font-lock-keyword-face)
(make-face-bold 'font-lock-function-name-face)
(make-face-bold 'font-lock-type-face)
(make-face-bold 'font-lock-builtin-face)
(make-face-bold 'font-lock-comment-face)
(make-face-bold 'font-lock-string-face)
(make-face-bold 'font-lock-comment-delimiter-face)
(make-face-bold 'font-lock-constant-face)


;; =============================================================================
(custom-set-faces
  '(linum ((t (:inherit shadow :background "pink"))))
  )

;; =============================================================================
(use-package hl-line
             :init (global-hl-line-mode t))

(set-face-background 'hl-line "aquamarine")
;; =============================================================================
(use-package spaceline
             :ensure t
             :demand t
             :init
             (setq powerline-default-separator 'arrow-fade)
             :config
             (require 'spaceline-config)
             (spaceline-spacemacs-theme)
             (spaceline-helm-mode))

;;==============================================================================================
    (use-package spaceline-config           ; A beautiful mode line
                 :ensure spaceline
                 :config
                 (spaceline-compile
                   'lunaryorn
                   ;; Left side of the mode line (all the important stuff)
                   '(((buffer-modified buffer-size input-method) :face highlight-face)
                     anzu
                     '(buffer-id remote-host buffer-encoding-abbrev)
                     ((point-position line-column buffer-position selection-info)
                      :separator " | ")
                     major-mode
                     process
                     (flycheck-error flycheck-warning flycheck-info)
                     (python-pyvenv :fallback python-pyenv)
                     ((which-function projectile-root) :separator " @ ")
                     ((minor-modes :separator spaceline-minor-modes-separator) :when active))
                   ;; Right segment (the unimportant stuff)
                   '((version-control :when active)))
                 (setq-default mode-line-format '("%e" (:eval (spaceline-ml-lunaryorn))))
                 )
;; =============================================================================
(set-background-color "gray40") 
