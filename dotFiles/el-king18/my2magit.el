;;================================================================================
;;   Git   ;;  MaGit  ;;   Git   ;;  MaGit  ;;    Git   ;;   MaGit  ;;    Git   ;;
;;================================================================================

(use-package diff-hl
             :ensure t
             :commands (global-diff-hl-mode
                         diff-hl-mode
                         diff-hl-next-hunk
                         diff-hl-previous-hunk
                         diff-hl-mark-hunk
                         diff-hl-diff-goto-hunk
                         diff-hl-revert-hunk)
             :bind* (("M-m ] h" . diff-hl-next-hunk)
                     ("M-m [ h" . diff-hl-previous-hunk)
                     ("M-m i h" . diff-hl-mark-hunk)
                     ("M-m a h" . diff-hl-mark-hunk)
                     ("M-m g h" . diff-hl-diff-goto-hunk)
                     ("M-m g H" . diff-hl-revert-hunk))
             :config
             (global-diff-hl-mode)
             (diff-hl-flydiff-mode)
             (diff-hl-margin-mode)
             (diff-hl-dired-mode))

;;================================================================================
 (use-package magit
  :ensure t
  :bind* (("M-m SPC e" . magit-status)
          ("M-m g b"   . magit-blame)))

;;================================================================================
;; big- (use-package magit
;; big-              :commands (magit-status-internal
;; big-                          magit-status
;; big-                          magit-diff
;; big-                          magit-log)
;; big-              :init
;; big-              (setq magit-last-seen-setup-instructions "1.4.0")
;; big-              :config
;; big-              (use-package magithub)
;; big-              (setq magit-push-always-verify nil)
;; big-              (setq magit-completing-read-function 'helm--completing-read-default)
;; big-
;; big-              (defun display-buffer-full-screen (buffer alist)
;; big-                (delete-other-windows)
;; big-                (set-window-dedicated-p nil nil)
;; big-                (set-window-buffer nil buffer)
;; big-                (get-buffer-window buffer))
;; big-
;; big-              (setq magit-display-buffer-function
;; big-                    (lambda (buffer)
;; big-                      (if magit-display-buffer-noselect
;; big-                        (magit-display-buffer-traditional buffer)
;; big-                        (display-buffer buffer '(display-buffer-full-screen)))))
;; big-
;; big-              (advice-add 'magit-visit-item :after 'reposition-window)
;; big-              )
;; big-
;;================================================================================
;; nxt-(use-package git-timemachine
;; nxt-  :ensure t
;; nxt-  :commands (git-timemachine-toggle
;; nxt-             git-timemachine-switch-branch)
;; nxt-  :bind* (("M-m g l" . git-timemachine-toggle)
;; nxt-          ("M-m g L" . git-timemachine-switch-branch)))
;;=================================================================================
  (set-background-color "IndianRed1")
;;=================================================================================
