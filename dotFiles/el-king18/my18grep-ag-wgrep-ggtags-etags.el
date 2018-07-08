;;================================================================================
;;================================================================================
(use-package bm
  :bind
  (("s-1" . bm-toggle)
   ("s-2" . bm-next)
   ("s-@" . bm-previous))
  :custom

(bm-cycle-all-buffers t))

;;==================Albert Check Bindings====================
;;    Key sequence C-l g starts with non-prefix key C-l
;;    :bind ("C-c g" . ag-project-regexp)
;;============================================================
 (use-package ag
  :ensure t
  :commands (ag-regexp ag-project-regexp)
  )

;;=====================
 (use-package wgrep-ag :ensure t :after ag
  :config (bind-keys :map ag-mode-map
                     ("W" . wgrep-change-to-wgrep-mode)
                     ("S" . wgrep-save-all-buffers)
                     ("F" . wgrep-finish-edit)))

;;============================================================
  (use-package wgrep
  :ensure t
  )

;;============================================================
  (use-package wgrep-ag
  :ensure t
  )

  (require 'wgrep-ag)
;;============================================================
;;==================Albert Check Bindings====================
  (use-package rg
               :ensure  t
               :bind ("M-s" . rg-dwim)
               ("M-S" . rg-project)
               :config
               (add-hook 'rg-mode-hook 'wgrep-ag-setup)
               (bind-keys :map rg-mode-map
                          ("W" . wgrep-change-to-wgrep-mode)))


;;================================================================================
  (use-package ggtags
             :ensure t
             :diminish ggtags-mode
             :bind* (("M-l g"   . ggtags-find-tag-regexp)
                     ("M-l t" . ggtags-create-tags)
                     ("M-l T" . ggtags-update-tags))
             :init
             (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
             :config
             (add-hook 'prog-mode-hook 'ggtags-mode))

;;================================================================================
  (use-package etags
              :defer t
              :config
              (defun etags-build (directory)
                (interactive "DDirectory: ")
                (let* ((results ())
                       (head (list directory))
                       (tail head))
                  (while head
                         (dolist (file (directory-files (car head) t nil t))
                           (cond ((and (not (string-match "\\.$" file))
                                       (not (string-match "\\.\\.$" file))
                                       (file-directory-p file))
                                  (let ((new-tail (list file)))
                                    (setf (cdr tail) new-tail
                                          tail new-tail)))
                                 ((string-match "\\.[ch]$" file)
                                  (push file results))))
                         (pop head))
                  (let ((default-directory directory))
                    (apply #'call-process "etags" nil nil nil results)))))
;;================================================================================
;;================================================================================
