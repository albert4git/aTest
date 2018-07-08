;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; package --- Summary  200 lines
;;; Commentary:  startup emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Package management    ;;;;       Package management    ;;;;    Package management    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("SC"    . "http://joseito.republika.pl/sunrise-commander/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package use-package-ensure-system-package
             :ensure t)

;;==============================================================================================
(when window-system
  (use-package pretty-mode
               :ensure t
               :config
               (global-pretty-mode t)))

;;==============================================================================================
(use-package diminish
             :ensure t
             :init
             (diminish 'which-key-mode)
             (diminish 'linum-relative-mode)
             (diminish 'hungry-delete-mode)
             (diminish 'visual-line-mode)
             (diminish 'subword-mode)
             (diminish 'beacon-mode)
             (diminish 'irony-mode)
             (diminish 'page-break-lines-mode)
             (diminish 'auto-revert-mode)
             (diminish 'rainbow-delimiters-mode)
             (diminish 'rainbow-mode))
;;==============================================================================================
(use-package which-key
             :ensure t
             :demand t
             :diminish which-key-mode
             :bind* (("C-c ?" . which-key-show-top-level))
             :config
             (which-key-enable-god-mode-support)
             (which-key-mode))

;;==============================================================================================
(defun switch-fullscreen nil
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
      (selected-frame)
      (list (cons 'fullscreen next)))))

(define-key global-map [f12] 'switch-fullscreen)

;;==============================================================================================
(use-package restart-emacs
             :ensure t
             :bind* (("C-x M-r" . restart-emacs)))

;;==============================================================================================
(when (fboundp 'winner-mode)
          (winner-mode 1))

;;==============================================================================================
(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (cl-flet ((process-list ())) ad-do-it))

;;==============================================================================================
(set-background-color "cornflower blue")
;;==============================================================================================
        (load "~/.emacs.d/my2basics.el")
        (load "~/.emacs.d/my2speed.el")
        (load "~/.emacs.d/my2navi.el")
        (load "~/.emacs.d/my2helmHydra.el")
        (load "~/.emacs.d/my2magit.el")
        (load "~/.emacs.d/my18ido-ibff-smx-i-d-menu-couns-ivi-swip.el")
        ;;----------------------- ibuffuer set-background ---?
;;================================================================
        (load "~/.emacs.d/my18grep-ag-wgrep-ggtags-etags.el")
        (load "~/.emacs.d/my18smartCode.el")
        (load "~/.emacs.d/my18smartEdit.el")
;;================================================================
        (load "~/.emacs.d/my18flyIspell.el")
        (load "~/.emacs.d/my18company-ac-ispell-yas-eldoc-elisp.el")
        (load "~/.emacs.d/my18org-babel.el")
        (load "~/.emacs.d/my18abreev-simple-hotKeys-binds.el")
;;================================================================
;;(load "~/.emacs.d/my2projectile-dashboard.el")
;;==============================================
(set-background-color "MistyRose1")
;;===================================
;;(load "~/.emacs.d/me18maxiHelm.el")
;;===================================
;;(load "~/.emacs.d/my18skBigHelm.el")
;;===================================
;;(load "~/.emacs.d/my18miniHelm.el")
;;===================================
(set-background-color "MistyRose1")
;;===================================
;;(load "~/.emacs.d/my18samlung.el")
;;===================================
;;(load "~/.emacs.d/me18samlung.el")
;;===================================
;;(load "~/.emacs.d/me18ssamlung.el")
;;===================================
(set-background-color "MistyRose1")
;;(load "~/.emacs.d/me18powerLine.el")
;;===================================
;;(load "~/.emacs.d/my18")
;;==============================================================================================
;;==============================================================================================
;;    Org      ;;    Org      ;;     Org      ;;     Org      ;;    Org      ;;    Org        ;;
;;==============================================================================================
    (defun config-visit ()
      (interactive)
      (find-file "~/.emacs.d/my2init.org")
      )
;;===================================
    (global-set-key (kbd "C-c e") 'config-visit)
;;===================================
    (add-hook 'org-agenda-mode-hook
      (lambda () (hl-highlight-mode nil))
      )

;;===================================
    (org-babel-load-file
      (expand-file-name "my2init.org" user-emacs-directory)
      )
;;==============================================================================================================
;;  VIM  ;;  VIM   ;;   VIM   ;;   VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;
;;==============================================================================================================
 (use-package evil
             :ensure t
             :config
             (evil-mode 1)
             ;; Make movement keys work respect visual lines
             (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
             (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
             (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
             (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
             ;; Make horizontal movement cross lines
             (setq-default evil-cross-lines t))
;;===============================================================================
;;= To convert Emacs further you will need sort of bridge package 
;;= for every more-or-less complex thing: evil-org, evil-smartparens, et cetera.
;;===============================================================================

 (global-set-key (kbd "M-7") 'evil-emacs-state )
 (global-set-key (kbd "M-6") 'evil-exit-emacs-state )
;;==============================================================================================================
;;  VIM  ;;  VIM   ;;   VIM   ;;   VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;  VIM  ;;
;;==============================================================================================================


;;==============================================================================================
;; LightBlue1 ;; LightSteelBlue1 ;; MistyRose1 ;; ivory1 ;; beige ;; alice blue ;; azure 
;;==============================================================================================

;;==============================================================================
;(load "~/.emacs.d/my2colors.el")
 (load "~/.emacs.d/my2doom.el")
 (load "~/.emacs.d/my2ccolors.el")
;;==============================================================================
;;  (set-background-color "ivory1")
;;  (set-background-color "beige")
 (set-background-color "lightYellow1")

;;===================CChua=======================================================================
; Cursor
    (blink-cursor-mode -1)

    (defvar default-cursor-color "#F2777A")
    (defvar expandable-thing-before-point-color "#00FF7F")
    ; Theme
    (defun customize-enabled-theme ()
      (let ((enabled-theme (car custom-enabled-themes))
            (cursor-preferred-color "#FF5A0E"))
        (cond ((eq enabled-theme 'base16-default)
               (set-cursor-color cursor-preferred-color))
              ((eq enabled-theme 'tronesque)
               (let ((fallback-color
                      (face-attribute 'show-paren-match :background)))
                 (set-face-attribute
                  'dired-directory nil :foreground fallback-color)
                 (set-face-attribute
                  'info-header-xref nil :foreground fallback-color)))
              ((eq enabled-theme 'wombat)
               (set-cursor-color cursor-preferred-color)))))

    (defun customize-theme ()
      (let ((default-background-color (face-attribute 'default :background)))
        (set-face-attribute 'fringe nil :background default-background-color)))

    (defun disable-custom-themes (theme &optional no-confirm no-enable)
      (mapc 'disable-theme custom-enabled-themes))

    (advice-add 'load-theme :before #'disable-custom-themes)

    (defun load-custom-theme-settings (theme &optional no-confirm no-enable)
      (customize-theme)
      (customize-enabled-theme))

    (advice-add 'load-theme :after #'load-custom-theme-settings)
;;
;; cc (load-theme 'base16-hopscotch-dark t)
;;==============================================================================================
;;  init fin  ;;  init fin  ;;  init fin  ;;  init fin  ;;  init fin  ;;  init fin  ;;   fin  ;;
;;==============================================================================================
