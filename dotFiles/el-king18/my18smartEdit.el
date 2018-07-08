;;===================================
(use-package smart-tab
             :defer t
             :diminish ""
             :init (global-smart-tab-mode 1)
             :config
             (progn
               (add-to-list 'smart-tab-disabled-major-modes 'mu4e-compose-mode)
               (add-to-list 'smart-tab-disabled-major-modes 'erc-mode)
               (add-to-list 'smart-tab-disabled-major-modes 'shell-mode)))

;;===================================
 (use-package hungry-delete
              :ensure t
              :config
              (global-hungry-delete-mode))
;;===================================
(use-package electric
             :custom
             (electric-quote-string t)
             (electric-quote-context-sensitive t)
             :hook
             ((org-mode markdown-mode fountain-mode git-commit-mode) . electric-quote-local-mode))

(use-package elec-pair
             :init (electric-pair-mode))

;;===================================
(use-package subword
             :init (global-subword-mode))

;;================================================================
(use-package stripe-buffer        ; Add stripes to a buffer
             :ensure t
             :init
             (add-hook 'dired-mode-hook #'stripe-buffer-modea)
             )
;;================================================================
(set-background-color "RosyBrown1")
;;================================================================
