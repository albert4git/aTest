;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;id04  ;;  command-log-mode ;;  command-log-mode ;;  command-log-mode ;;  command-log-mode      ;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package command-log-mode
             :ensure t
             :config
             (add-hook 'prog-mode-hook 'command-log-mode)
             )
;;;;
;;;;
(clm/open-command-log-buffer)
(global-command-log-mode)
(global-set-key (kbd "M-1") 'clm/open-command-log-buffer)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(use-package treemacs
             :ensure t
             :init
             (setq treemacs-follow-after-init          t
                   treemacs-width                      25
                   treemacs-indentation                2
                   treemacs-collapse-dirs              (if (executable-find "python") 3 0)
                   treemacs-silent-refresh             nil
                   treemacs-change-root-without-asking nil
                   treemacs-sorting                    'alphabetic-desc
                   treemacs-show-hidden-files          t
                   treemacs-never-persist              nil
                   treemacs-is-never-other-window      nil
                   treemacs-goto-tag-strategy          'refetch-index)
             :commands
             (treemacs-toggle
               treemacs)) ;;;; weiter
(treemacs)
(global-set-key (kbd "M-2") 'treemacs)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package sr-speedbar
;;   :ensure t)
;; (require 'sr-speedbar)
;; (setq 
;;    sr-speedbar-right-side 1
;;    speedbar-show-unknown-files t
;;    sr-speedbar-width-x 6
;;    sr-speedbar-width-console 6
;;    sr-speedbar-max-width 6
;;    sr-speedbar-delete-windows t)
;; (sr-speedbar-open)
;; (global-set-key (kbd "M-4") 'sr-speedbar-toggle)
;;
;;
;; (require 'speedbar)
;; ;;(speedbar 1)
;;   (setq speedbar-mode-hook '(lambda ()
;;     (interactive)
;;     (other-frame 0)))
;;   (global-set-key (kbd "M-3") 'speedbar) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-background-color "gray60")
