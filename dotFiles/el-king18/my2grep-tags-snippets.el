;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ny
;;ny (use-package ag
;;ny   :ensure t
;;ny   :commands (ag-regexp ag-project-regexp)
;;ny   :bind ("C-c g" . ag-project-regexp))
;;ny
;;ny (use-package wgrep-ag :ensure t :after ag
;;ny   :config (bind-keys :map ag-mode-map
;;ny                      ("W" . wgrep-change-to-wgrep-mode)
;;ny                      ("S" . wgrep-save-all-buffers)
;;ny                      ("F" . wgrep-finish-edit)))
;;ny
;;ny
;;ny (use-package bm
;;ny   :bind
;;ny   (("s-1" . bm-toggle)
;;ny    ("s-2" . bm-next)
;;ny    ("s-@" . bm-previous))
;;ny   :custom
;;ny
;;ny (bm-cycle-all-buffers t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;zam zam zam zam zam zam  zam zam zam zam zam zam 
;;zam  (use-package wgrep
;;zam  :ensure t
;;zam  )
;;zam  (use-package wgrep-ag
;;zam  :ensure t
;;zam  )
;;zam  (require 'wgrep-ag)
;;zam  #+END_SRC
;;zam
;;zam  #+RESULTS:
;;zam  * Silversearcher
;;zam  #+BEGIN_SRC emacs-lisp
;;zam  (use-package ag
;;zam  :ensure t)
;;zam  zam zam zam zam zam  zam zam zam zam zam zam 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package wgrep)
(setq-default grep-highlight-matches t
	     	  grep-scroll-output t)


(use-package ag :ensure t)
(use-package wgrep-ag :ensure t)
(setq-default ag-highlight-search t)
(global-set-key (kbd "M-?") 'ag-project)

;; ================================================
(use-package rg
			 :ensure  t
			 :bind ("M-s" . rg-dwim)
			 ("M-S" . rg-project)
			 :config
			 (add-hook 'rg-mode-hook 'wgrep-ag-setup)
			 (bind-keys :map rg-mode-map
						("W" . wgrep-change-to-wgrep-mode)))


;; ================================================
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   YaSnippet    ;;   YaSnippet    ;;   YaSnippet    ;;   YaSnippet    ;;   YaSnippet    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ya-
;; Ya-  (use-package yasnippet
;; Ya-    :diminish (yas-minor-mode)
;; Ya-    :commands yas-global-mode
;; Ya-    :init
;; Ya-    (setq yas-verbosity 1
;; Ya-  yas-prompt-functions '(yas-completing-prompt yas-ido-prompt))
;; Ya-
;; Ya-    (add-hook 'after-init-hook 'yas-global-mode t))
;; Ya-
;; Ya-  (use-package java-snippets
;; Ya-    :ensure t)
;; Ya-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-background-color "green4") ;;

