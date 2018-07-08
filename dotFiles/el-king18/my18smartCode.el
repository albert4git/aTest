;;=======================================================================================
;;   SmartCode   ;;   SmartCode   ;;   SmartCode   ;;    SmartCode   ;;    SmartCode   ;;
;;=======================================================================================
 (use-package compile :ensure t :defer t
             :config
             (add-to-list 'compilation-error-regexp-alist '("at .*?\\(/.*?\\):\\(.*?\\):\\(.*?\\)$" 1 2 3))
             :bind ("C-x C-c" . compile))

;;=======================================================================================

 (use-package octave
             :commands octave-mode
             :mode (("\\.m$" . octave-mode))
             :config
             (progn
               (autoload 'octave-mode "octave-mod" nil t)
               (add-hook 'octave-mode-hook
                         (lambda ()
                           (abbrev-mode 1)
                           (auto-fill-mode 1)
                           (if (eq window-system 'x)
                             (font-lock-mode 1))))))

 (use-package gnuplot-mode
             :ensure t)

;;=======================================================================================
;; C/C++ and Java modes
 (use-package cc-mode
             :init
             ;; Java hook
             (defun my-java-mode-hook ()
               "Personalized java mode."
               (c-set-offset 'inline-open 0)
               (c-set-offset 'arglist-intro '+)
               (c-set-offset 'arglist-close 0))
             ;; C++ hook
             (defun my-c++-mode-hook ()
               "Personalized c++ mode."
               (setq c-basic-offset 4)
               (c-set-offset 'inline-open 0)
               (c-set-offset 'brace-list-open '*)
               (c-set-offset 'block-open 0)
               (c-set-offset 'inline-open 0)
               (c-set-offset 'case-label '*)
               (c-set-offset 'access-label '/))
             ;; Add hooks
             (add-hook 'c++-mode-hook 'my-c++-mode-hook)
             (add-hook 'java-mode-hook 'my-java-mode-hook))

;;=======================================================================================
 (use-package javadoc-lookup
             :defer t
             :bind ("C-h j" . javadoc-lookup)
             :config
             (ignore-errors
               (setf javadoc-lookup-cache-dir (locate-user-emacs-file "local/javadoc"))))

;;=======================================================
 (use-package jtags
             :ensure t
             :init (add-hook 'java-mode-hook 'jtags-mode))

;;=======================================================
 (global-set-key (kbd "C-h j") 'javadoc-lookup)
 (provide 'init-java)

;;=======================================================================================
;; notFind (use-package java-mode
;; notFind   :init (add-hook 'java-mode-hook (lambda ()
;; notFind                                     (setq c-basic-offset 4
;; notFind                                           tab-width 4
;; notFind                                           indent-tabs-mode t))))
;;
;; NewJAVA
;;=======================================================================================


;;=======================================================================================
;; next (package-initialize)
;; next
;; next (require 'eclim)
;; next (global-eclim-mode)
;; next
;; next ; If you want to control eclimd from emacs, also add:
;; next (require 'eclimd)
;; next
;;=======================================================================================
;; next (add-to-list 'load-path "~/.emacs.d/elpa/emacs-eclim-20140809.207/")
;; next (package-initialize)
;; next
;; next (require 'eclim)
;; next (global-eclim-mode)
;; next
;; next ; If you want to control eclimd from emacs, also add:
;; next (require 'eclimd)
;;
;; next This package provides a javadoc-lookup function for quickly looking up Javadoc for any library from within Emacs,
;; next  optionally integrating with Maven. A browser is launched to view the documentation.
;; next
;; next javadoc-lookup is not bound to any key by default, so you may want to add this to your initialization file,
;; next 
;;=======================================================================================
(set-background-color "gold1")
;;=======================================================================================
