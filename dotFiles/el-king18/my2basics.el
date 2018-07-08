;; =============================================================================
;;     Third party packages    ;;;      Third party packages      ;;;;    Third
;; =============================================================================
 (add-to-list 'load-path
              (expand-file-name "defuns" user-emacs-directory))
 ;; extra macros
 (add-to-list 'load-path
              (expand-file-name "macros" user-emacs-directory))
 ;; extra major/minor modes
 (add-to-list 'load-path
              (expand-file-name "modes" user-emacs-directory))
 ;; language specific setup
 (add-to-list 'load-path
              (expand-file-name "lang" user-emacs-directory))
 ;; other configuration
 (add-to-list 'load-path
              (expand-file-name "config" user-emacs-directory))



(use-package recentf
             :ensure t
             :init
             (recentf-mode 1))

(setq recentf-max-menu-items 1000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set fonts;; Set fonts;; Set fonts;; Set fonts;; Set fonts;; Set fonts;; Set fonts;; Set fonts;; Set ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (cond ((eq system-type 'gnu/linux)                 ; if system is GNU/Linux
        (set-frame-font "DejaVu Sans Mono"))        ; set the font to DejaVu Sans Mono
       ((eq system-type 'darwin)                    ; if system is macOS
        (mac-auto-operator-composition-mode)        ; ligature support
        (set-frame-font "Fira Code"))               ; set the font to Monaco
       ((eq system-type 'windows-nt)                ; if system is Windows
        (set-frame-font "Lucida Sans Typewriter"))) ; set the font to Lucida Sans Typewriter
;; =============================================================================
;; NOPs (add-to-list 'default-frame-alist
;; NOPs              '(font . "Source Code Pro-15:style=Light"))
;; NOPs (set-frame-font "Source Code Pro-15" nil t)
;; =============================================================================
;; POPs (set-face-attribute 'default nil :background "black" :foreground "white" :font "Courier" :height 180)
;; =============================================================================
;;
(setq dired-listing-switches "-alh")
;;
(setq x-select-enable-clipboard t)
;;
(setq ring-bell-function #'ignore)
;;
;; =============================================================================
(global-linum-mode t)
    (linum-mode 1)
    (add-hook 'prog-mode-hook 'linum-mode )
;; =============================================================================
; Variables
(setq gc-cons-threshold 7000000)
(setq shift-select-mode t)                  ; Allow for shift selection mode
(setq inhibit-splash-screen t)              ; disable splash screen
(setq make-backup-files nil)                ; don't make backup files
(setq create-lockfiles nil)                 ; don't make lock files
(setq auto-save-default nil)                ; don't autosave
(setq truncate-partial-width-windows t)     ; Turn truncation off on split windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;id01 Change some default settings   ;;;;    Change some default settings    ;;;;    Change some default settings    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Batman")									  	; Hi Emacs, I'm Sriram
(setq gc-cons-threshold (* 500 1024 1024))									  	; increase the threshold for garbage collection - 100 MB
(setq delete-old-versions -1)												  	; delete excess backup versions silently
(setq version-control t)													  	; use version control for backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))				  	; which directory to put backups file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))	; transform backups file name
(setq inhibit-startup-screen t)												  	; inhibit useless and old-school startup screen
(setq visible-bell nil)														  	; no visible bell for errors
(setq ring-bell-function 'ignore)											  	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8)										  	; use utf-8 by default for reading
(setq coding-system-for-write 'utf-8)										  	; use utf-8 by default for writing
(setq sentence-end-double-space nil)										  	; sentence SHOULD end with only a point.
(setq initial-major-mode 'fundamental-mode)                                     ; set the mode of the initial scratch buffer
(setq initial-scratch-message "hallo Conrad ")           								  	; print nothing and leave screen at insert mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(tooltip-mode -1)															  	; deactivate the tooltip
(blink-cursor-mode -1)														  	; don't blink the cursor
(defun display-startup-echo-area-message () (message "Let the games begin!")) 	; change the default startup echo message
(setq-default fill-column 80)													; toggle wrapping text at the 80th character
(setq-default truncate-lines t)												  	; if line exceeds screen, let it
(setq large-file-warning-threshold (* 15 1024 1024))						  	; increase threshold for large files
(fset 'yes-or-no-p 'y-or-n-p)												  	; prompt for 'y' or 'n' instead of 'yes' or 'no'
(setq-default abbrev-mode t)												  	; turn on abbreviations by default
(setq recenter-positions '(middle top bottom))								  	; recenter from the top instead of the middle
(put 'narrow-to-region 'disabled nil)										  	; enable narrowing to region
(put 'narrow-to-defun 'disabled nil)										  	; enable narrowing to function
(setq recentf-max-saved-items 1000											  	; set the number of recent items to be saved
	recentf-exclude '("/tmp/" "/ssh:"))									  	; exclude the temporary and remote files accessed recently
(setq echo-keystrokes 0.05)													  	; when to echo keystrokes
(setq-default ibuffer-expert t)												    ; don't ask confirmation when deleting unmodified buffers
(setq frame-resize-pixelwise t)												    ; resize based on pixels to remove annoying gaps
(setq imenu-auto-rescan t)												        ; rescan automatically for new tags
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (use-package autorevert
              :defer t
              :diminish auto-revert-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; save a bunch of variables to the desktop file
;; ;; for lists specify the len of the maximal saved data also
;; (setq desktop-globals-to-save
;;       (append '((extended-command-history . 300)
;;                 (file-name-history        . 100)
;;                 (grep-history             . 30)
;;                 (compile-history          . 30)
;;                 (minibuffer-history       . 5000)
;;                 (query-replace-history    . 60)
;;                 (read-expression-history  . 60)
;;                 (regexp-history           . 60)
;;                 (regexp-search-ring       . 20)
;;                 (search-ring              . 2000)
;;                 (shell-command-history    . 50)
;;                 tags-file-name
;;                 register-alist)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package savehist
             :defer t
             :config
             (savehist-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq history-length 950)
        (savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
        (desktop-save-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(tooltip-mode -1)
;;(menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Nxt (allout-mode)
;; Nxt (require 'allout)
;; Nxt (outline-init t)
;;================================================
;; Nxt     C-c prefix:
;; Nxt     b outline-backward-current-level
;; Nxt     f outline-forward-current-level
;; Nxt     h outline-hide-current-subtree
;; Nxt     i outline-show-children
;; Nxt     n outline-next-visible-heading
;; Nxt     o outline-show-current-entry
;; Nxt     p outline-previous-visible-heading
;; Nxt     s outline-show-current-subtree
;; Nxt     u outline-up-current-level
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-background-color "gray20") 
