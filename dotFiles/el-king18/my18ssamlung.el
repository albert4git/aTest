
;;========================================
(use-package howdoi
  :ensure t
  :bind* (("M-m y"   . howdoi-query)
          ("M-m Y" . howdoi-query-line-at-point)
          ("M-m U" . howdoi-query-insert-code-snippet-at-point)))
;;================================================================================
(use-package change-inner
             :ensure change-inner
             :bind (("\C-c i" . change-inner)
                    ("s-i" . change-inner)
                    ("\C-c u" . change-outer)
                    ("s-o" . change-outer))
             :config (progn
                       ;; This is much like change-inner, but doesn't require us to identify
                       ;; additional input.
                       (defun ash-clear ()
                         (interactive)
                         (require 'expand-region)
                         (er/expand-region 1)
                         (kill-region (region-beginning) (region-end))
                         (er/expand-region 0))))
;;================================================================================

(use-package selected
  :ensure t
  :init (selected-minor-mode)
  :bind (:map selected-keymap
              ("w" . er/expand-region)
              ("q" . selected-off)
              ("u" . upcase-region)
              ("d" . downcase-region)
              ("g" . google-this)
              ("m" . apply-macro-to-region-lines)))

;;================================================================================
(use-package rtags
             :ensure t
             :defer 2
             :bind (:map c++-mode-map
                         ("C-c I" . rtags-print-symbol-info)
                         ("C-c S" . rtags-find-symbol-at-point))
             :init
             (setq rtags-autostart-diagnostics t)
             (setq rtags-completions-enabled t))
;;==================================================
  (defhydra sk/hydra-bookmarks (:color blue
                              :hint nil)
  "
 _s_: set  _b_: bookmark   _j_: jump   _d_: delete   _q_: quit
  "
  ("s" bookmark-set)
  ("b" bookmark-save)
  ("j" bookmark-jump)
  ("d" bookmark-delete)
  ("q" nil :color blue))
;;=========
(bind-keys*
  ("M-m p" . sk/hydra-bookmarks/body))

;;=================???=================================
  (defun sk/copy-current-file-path ()
    "Add current file path to kill ring. Limits the filename to project root if possible."
    (interactive)
    (kill-new buffer-file-name)
    (bind-keys*
      ("M-m C" . sk/copy-current-file-path)
      )

;;==================================================
  (use-package volatile-highlights
    :ensure t
    :demand t
    :diminish volatile-highlights-mode
    :config
    (volatile-highlights-mode t))
;;===================================
(use-package smart-shift
             :bind (("s-[" . smart-shift-left)
                    ("s-]" . smart-shift-right))
             :config
             (advice-add 'smart-shift-override-local-map :override #'ignore))
;;===================================
(use-package toggle-quotes
             :bind ("C-'" . toggle-quotes))
;;===================================
(use-package change-inner
             :bind (("M-i" . change-inner)
                    ("M-o" . change-outer)))
;;===================================


;;================================================================================
;; gg- (use-package ggtags
;; gg-              :ensure t
;; gg-              :config
;; gg-              (setq ggtags-mode-prefix-key "M-."
;; gg-                    ggtags-enable-navigation-keys nil)
;; gg- 
;; gg-              (defun my-ggtags-setup-keybindings ()
;; gg-                (ggtags-mode -1)
;; gg- 
;; gg-                (ggtags-setup-highlight-tag-at-point ggtags-highlight-tag)
;; gg- 
;; gg-                ;; keybindings
;; gg-                (unless (boundp 'my-prog-lookup-map)
;; gg-                  (define-prefix-command 'my-prog-lookup-map))
;; gg-                (local-set-key (kbd "M-.") 'my-prog-lookup-map)
;; gg- 
;; gg-                (define-key my-prog-lookup-map (kbd "M-.") 'ggtags-find-tag-dwim)
;; gg-                (define-key my-prog-lookup-map (kbd "o") 'ggtags-find-other-symbol)
;; gg-                (define-key my-prog-lookup-map (kbd "r") 'ggtags-find-reference)
;; gg-                (define-key my-prog-lookup-map (kbd "d") 'ggtags-find-definition)
;; gg-                (define-key my-prog-lookup-map (kbd "f") 'ggtags-find-file)
;; gg-                (define-key my-prog-lookup-map (kbd "r") 'ggtags-find-tag-regexp)
;; gg-                (define-key my-prog-lookup-map (kbd "s") 'ggtags-show-definition)
;; gg-                (define-key my-prog-lookup-map (kbd "g") 'ggtags-grep)
;; gg-                (define-key my-prog-lookup-map (kbd ">") 'ggtags-next-mark)
;; gg-                (define-key my-prog-lookup-map (kbd "<") 'ggtags-prev-mark)
;; gg-                (define-key my-prog-lookup-map (kbd "h") 'ggtags-view-tag-history)
;; gg-                (define-key my-prog-lookup-map (kbd "R") 'ggtags-query-replace)
;; gg-                (define-key my-prog-lookup-map (kbd "C") 'ggtags-create-tags)
;; gg-                (define-key my-prog-lookup-map (kbd "U") 'ggtags-update-tags)
;; gg- 
;; gg-                (local-set-key (kbd "M-,") 'pop-tag-mark)
;; gg-                )
;; gg- 
;; gg-              (add-hook 'c-mode-hook 'my-ggtags-setup-keybindings)
;; gg-              (add-hook 'c++-mode-hook 'my-ggtags-setup-keybindings)
;; gg-              )
;; gg   https://github.com/leoliu/ggtags
;;================================================================================
;;================================================================================
;; nxt- (use-package eshell
;; nxt-              :commands eshell
;; nxt-              :init
;; nxt-              (defun eshell-mode-hook-func ()
;; nxt-                (setq eshell-path-env (concat "/usr/local/bin:" eshell-path-env)))
;; nxt-              (add-hook 'eshell-mode-hook 'eshell-mode-hook-func))
;;================================================================================
