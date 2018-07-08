;;================================================================;;

(defun x-stop ()
    (interactive)
      (setq company-mode nil)
      (setq global-company-mode nil)
      ;;+++++++++++++++++++++++++
      (setq auto-complete-mode nil)
      (setq global-auto-complete-mode nil)
      ;;+++++++++++++++++++++++++
      (company-ispell nil)
      (company-quickhelp-mode nil)
      (setq company-backends (delete 'company-ispell company-backends))
      (setq company-backends (delete 'company-elisp company-backends))
      (setq company-backends (delete 'company-clang company-backends))
      (setq company-backends (delete 'company-yasnippet company-backends))
      (setq company-backends (delete 'company-semantic company-backends))
      (setq company-backends (delete 'company-eclim company-backends))
      (setq company-backends (delete 'company-dabbrev company-backends))
      (setq company-backends (delete 'company-keywords company-backends))
)

;;::============================================
(defun launch-ac ()
  (interactive)
  (x-stop)
       (use-package auto-complete
         :commands auto-complete-mode
         :init
         (progn
           (auto-complete-mode t))
         :bind (("C-n" . ac-next)
                ("C-p" . ac-previous))
         :config
             (progn 
                 (use-package auto-complete-config)
                 (setq ac-delay 0.02)
                 (setq ac-use-menu-map t)
                 (setq ac-menu-height 50)
                 (setq ac-use-quick-help nil) 
                 (setq ac-ignore-case t)
                 (setq ac-dwim  t)
                 (setq ac-fuzzy-enable t)
                 (setq ac-candidate-menu-min 0)
                 (setq ac-disable-inline t)
               )
         (auto-complete-mode t)
         (global-auto-complete-mode t)
         ;; prev (add-to-list 'ac-modes 'text-mode)
        )
     (require 'auto-complete)
     (setq auto-complete-mode t)
     (setq global-auto-complete-mode t)
  )
;;::==============ISPELL Toggle START ============================================================
    (defun toggle-company-ispell ()
      (interactive)
      (cond
        ((memq 'company-ispell company-backends)
         (setq company-backends (delete 'company-ispell company-backends))
         (message "company-ispell disabled"))
        (t
          (add-to-list 'company-backends 'company-ispell)
          (message "company-ispell enabled!"))))
;;::================ISPELL Toggle FIN ============================================================
;;
;;::==============================================================================================
(defun no-ac ()
    (interactive)
      (setq auto-complete-mode nil)
      (setq global-auto-complete-mode nil)
      ;;++++++++++++++++++++++++
      (setq company-mode nil)
      (setq global-company-mode nil)
)
;;::============================================
(defun no-ispell ()
    (interactive)
    setq company-backends (delete 'company-ispell company-backends)
)
;;::============================================
(defun do-ispell ()
    (interactive)
          (add-to-list 'company-backends 'company-ispell)
          (message "company-ispell enabled!")
)
;;==============================================================================

  (defun launch-company7 ()
    (interactive)

    (require 'company)
    (setq company-mode t)
    (setq global-company-mode t)
  )

;;=============================================================================;;
;;  emacs-lisp-mode     ;;     elma     ;;  emacs-lisp-mode     ;;     elma    ;;
;;=============================================================================;;
(use-package eldoc
             :hook (prog-mode . eldoc-mode)
             :diminish eldoc-mode)

(use-package emacs-lisp-mode
             :init
             (progn
               (use-package eldoc
                            :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))
               (use-package macrostep
                            :bind ("C-c e" . macrostep-expand))
               (use-package ert
                            :config (add-to-list 'emacs-lisp-mode-hook 'ert--activate-font-lock-keywords)))
             :config
             (progn
               (setq tab-always-indent 'complete)
               (add-to-list 'completion-styles 'initials t))
             :interpreter (("emacs" . emacs-lisp-mode)))

 ;; WoZu? Albert ;;-- :bind (("M-." . find-function-at-point)
 ;; WoZu? Albert ;;--  ("M-&" . complete-symbol))
;;::=========
  (use-package company
               :ensure t
               :config
               (setq company-idle-delay 0)
               (setq company-minimum-prefix-length 3)

               (global-company-mode t)
               )

;;::=========
(use-package helm-company
  :ensure t
  :config
  (progn
    (define-key company-mode-map (kbd "C-:") 'helm-company)
    (define-key company-active-map (kbd "C-:") 'helm-company)))

;;::=========
(use-package company-tern
  :ensure t
  :init
  (add-to-list 'company-backends 'company-tern))

;;::=========
(use-package tern
  :ensure t
  :defer t
  :diminish tern-mode
  :config
  (progn
    (add-hook 'js2-mode-hook 'tern-mode)))

(provide 'init-autocompletion)
;;===================================
 (use-package irony
              :ensure t
              :config
              (add-hook 'c++-mode-hook 'irony-mode)
              (add-hook 'c-mode-hook 'irony-mode)
              (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
              )

;;===================================
 (use-package company-irony
              :ensure t
              :config
              (add-to-list 'company-backends 'company-irony)
              )

;;===================================
 (use-package irony-eldoc
              :ensure t
              :config
              (add-hook 'irony-mode-hook #'irony-eldoc))

;;========================================================================================;;
;;   YaSnippet    ;;   YaSnippet    ;;   YaSnippet    ;;   YaSnippet    ;;   YaSnippet    ;;
;;========================================================================================;;


 (use-package yasnippet
              :diminish (yas-minor-mode)
              :commands yas-global-mode
              :init
              (setq yas-verbosity 1
                    yas-prompt-functions '(yas-completing-prompt yas-ido-prompt))
          (add-hook 'after-init-hook 'yas-global-mode t))
;;==========================
  (use-package java-snippets
   :ensure t)

;;::=============== START MAGENTA QuickHelp ================================================
 (defun launch-magenta-company ()
   (interactive)
         (x-stop)
         (use-package company
           :ensure t
           :config
           (setq company-idle-delay 1
                 company-minimum-prefix-length 1
                 company-show-numbers t
                 company-tooltip-limit 20)
          (bind-keys :map company-active-map
                     ("C-n" . company-select-next)
                     ("C-p" . company-select-previous)
                     ("C-d" . company-show-doc-buffer)
                     ("<tab>" . company-complete)
                     ("<backtab>" . company-select-previous)
                     ("<escape>" . company-abort)
                     )
               ;; Facing
                (deftheme monokai-overrides)
                (let ((class '((class color) (min-colors 257)))
                      (terminal-class '((class color) (min-colors 89))))
                  (custom-theme-set-faces
                   'monokai-overrides
                   ;; Company tweaks.
                   `(company-tooltip-common
                     ((t :foreground "magenta"
                         :background "black"
                         :underline t)))
                   `(company-template-field
                     ((t :inherit company-tooltip
                         :foreground "magenta")))
                   `(company-tooltip-selection
                     ((t :background "gray40"
                         :foreground "magenta")))
                   `(company-tooltip-common-selection
                     ((t :foreground "orange"
                         :background "gray40"
                         :underline t)))
                   `(company-scrollbar-fg
                     ((t :background "magenta")))
                   `(company-tooltip-annotation
                     ((t :inherit company-tooltip
                         :foreground "magenta")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "magenta"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "magenta"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "magenta"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "magenta"
                              :background "black")
                      (,terminal-class :foreground "magenta"
                                       :background "black")))
                   )
                 )
               (use-package company-quickhelp
                 :ensure t
                 :after company
                 :config
                (company-quickhelp-mode 1)
                (setq company-quickhelp-delay 0.2)
                (setq company-quickhelp-max-lines 15))
    (eval-after-load 'company
      '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

          )
   (require 'company)
   (setq company-quickhelp-mode t)
   (setq company-mode t)
   (setq global-company-mode t)
 )
;;========================================================================================;;

;;::======START CYAN plus ISPELL englisch-words.txt  =====================================
(defun launch-cyan-company ()
  (interactive)
    (x-stop)
    (use-package company
      :ensure
      :defer 4
      :init (progn
              (global-company-mode)
              (setq company-global-modes '(not python-mode cython-mode sage-mode))
              )
      :config (progn
                (setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt"))
                (add-to-list 'company-backends 'company-ispell)
                (setq company-tooltip-limit 20
                      company-idle-delay .1
                      company-echo-delay 0
                      company-begin-commands '(self-insert-command)
                      company-transformers '(company-sort-by-occurrence)
                      company-selection-wrap-around t
                      company-idle-delay .1
                      company-minimum-prefix-length 2
                      company-selection-wrap-around t
                      company-dabbrev-downcase nil
                      )
                (bind-keys :map company-active-map
                           ("C-n" . company-select-next)
                           ("C-p" . company-select-previous)
                           ("C-d" . company-show-doc-buffer)
                           ("<tab>" . company-complete)
                           ("<backtab>" . company-select-previous)
                           ("<escape>" . company-abort)
                           )
                )
      )
                  (deftheme monokai-overrides)
                  (let ((class '((class color) (min-colors 257)))
                        (terminal-class '((class color) (min-colors 89))))
                    (custom-theme-set-faces
                     'monokai-overrides
                     ;; Company tweaks.
                     `(company-tooltip-common
                       ((t :foreground "cyan"
                           :background "black"
                           :underline t)))
                     `(company-template-field
                       ((t :inherit company-tooltip
                           :foreground "cyan")))
                     `(company-tooltip-selection
                       ((t :background "gray40"
                           :foreground "cyan")))
                     `(company-tooltip-common-selection
                       ((t :foreground "cyan"
                           :background "gray40"
                           :underline t)))
                     `(company-scrollbar-fg
                       ((t :background "cyan2")))
                     `(company-tooltip-annotation
                       ((t :inherit company-tooltip
                           :foreground "cyan")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "cyan"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "cyan"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "cyan"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "cyan"
                              :background "black")
                      (,terminal-class :foreground "cyan"
                                       :background "black")))
                     )
                  )
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  (setq company-ispell t)
)
;;::======STOP CYAN plus ISPELL ============================================================

  (defun launch-red ()
  (interactive)
    (x-stop)
         (use-package company
          :ensure
          :defer 4
          :init (progn
                  (global-company-mode)
                  (setq company-global-modes '(not python-mode cython-mode sage-mode))
                  )
           :config
            (bind-keys :map company-active-map
                       ("C-n" . company-select-next)
                       ("C-p" . company-select-previous)
                       ("C-d" . company-show-doc-buffer)
                       ("<tab>" . company-complete)
                       ("<backtab>" . company-select-previous)
                       ("<escape>" . company-abort)
                       )
           (add-hook 'prog-mode-hook 'company-mode)
           )
                 (use-package helm-company
                   :ensure t
                   :config
                   (progn
                     (define-key company-mode-map (kbd "C-:") 'helm-company)
                     (define-key company-active-map (kbd "C-:") 'helm-company)
                   )
                 )
                 (deftheme monokai-overrides)
                 (let ((class '((class color) (min-colors 257)))
                       (terminal-class '((class color) (min-colors 89))))
                   (custom-theme-set-faces
                    'monokai-overrides
                    ;; Company tweaks.
                    `(company-tooltip-common
                      ((t :foreground "red1"
                          :background "black"
                          :underline t)))
                    `(company-template-field
                      ((t :inherit company-tooltip
                          :foreground "red1")))
                    `(company-tooltip-selection
                      ((t :background "gray40"
                          :foreground "red1")))
                    `(company-tooltip-common-selection
                      ((t :foreground "red1"
                          :background "gray40"
                          :underline t)))
                    `(company-scrollbar-fg
                      ((t :background "red3")))
                    `(company-tooltip-annotation
                      ((t :inherit company-tooltip
                          :foreground "red1")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "red1"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "red1"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "red1"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "red1"
                              :background "black")
                      (,terminal-class :foreground "red1"
                                       :background "black")))
                    )
                 )
           (add-to-list 'company-backends 'company-elisp)
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  )
;;==============================================================================
  (defun launch-green ()
  (interactive)
    (x-stop)
         (use-package company
          :ensure
          :defer 4
          :init (progn
                  (global-company-mode)
                  (setq company-global-modes '(not python-mode cython-mode sage-mode))
                  )
           :config
            (bind-keys :map company-active-map
                       ("C-n" . company-select-next)
                       ("C-p" . company-select-previous)
                       ("C-d" . company-show-doc-buffer)
                       ("<tab>" . company-complete)
                       ("<backtab>" . company-select-previous)
                       ("<escape>" . company-abort)
                       )
           (add-hook 'prog-mode-hook 'company-mode)
           )
                 (use-package helm-company
                   :ensure t
                   :config
                   (progn
                     (define-key company-mode-map (kbd "C-:") 'helm-company)
                     (define-key company-active-map (kbd "C-:") 'helm-company)
                   )
                 )
                 (deftheme monokai-overrides)
                 (let ((class '((class color) (min-colors 257)))
                       (terminal-class '((class color) (min-colors 89))))
                   (custom-theme-set-faces
                    'monokai-overrides
                    ;; Company tweaks.
                    `(company-tooltip-common
                      ((t :foreground "green1"
                          :background "black"
                          :underline t)))
                    `(company-template-field
                      ((t :inherit company-tooltip
                          :foreground "green1")))
                    `(company-tooltip-selection
                      ((t :background "gray40"
                          :foreground "green1")))
                    `(company-tooltip-common-selection
                      ((t :foreground "green1"
                          :background "gray40"
                          :underline t)))
                    `(company-scrollbar-fg
                      ((t :background "green3")))
                    `(company-tooltip-annotation
                      ((t :inherit company-tooltip
                          :foreground "green1")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "green1"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "green1"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "green1"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "green1"
                              :background "black")
                      (,terminal-class :foreground "green1"
                                       :background "black")))
                    )
                 )
           (add-to-list 'company-backends 'company-clang)
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  )
;;========================================================================================;;
  (defun launch-gold ()
  (interactive)
    (x-stop)
         (use-package company
          :ensure
          :defer 4
          :init (progn
                  (global-company-mode)
                  (setq company-global-modes '(not python-mode cython-mode sage-mode))
                  )
          :config (progn
                    ;;;-(setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt"))
                    ;;;-(add-to-list 'company-backends 'company-ispell)
                    (setq company-tooltip-limit 20
                          company-idle-delay .1
                          company-echo-delay 0
                          company-begin-commands '(self-insert-command)
                          company-transformers '(company-sort-by-occurrence)
                          company-selection-wrap-around t
                          company-idle-delay .1
                          company-minimum-prefix-length 2
                          company-selection-wrap-around t
                          company-dabbrev-downcase nil
                          )
                    (bind-keys :map company-active-map
                               ("C-n" . company-select-next)
                               ("C-p" . company-select-previous)
                               ("C-d" . company-show-doc-buffer)
                               ("<tab>" . company-complete)
                               ("<backtab>" . company-select-previous)
                               ("<escape>" . company-abort)
                               )
                    )
           )
                 (use-package helm-company
                   :ensure t
                   :config
                   (progn
                     (define-key company-mode-map (kbd "C-:") 'helm-company)
                     (define-key company-active-map (kbd "C-:") 'helm-company)
                   )
                 )
                 (deftheme monokai-overrides)
                 (let ((class '((class color) (min-colors 257)))
                       (terminal-class '((class color) (min-colors 89))))
                   (custom-theme-set-faces
                    'monokai-overrides
                    ;; Company tweaks.
                    `(company-tooltip-common
                      ((t :foreground "gold"
                          :background "black"
                          :underline t)))
                    `(company-template-field
                      ((t :inherit company-tooltip
                          :foreground "gold")))
                    `(company-tooltip-selection
                      ((t :background "gray40"
                          :foreground "gold")))
                    `(company-tooltip-common-selection
                      ((t :foreground "gold"
                          :background "gray40"
                          :underline t)))
                    `(company-scrollbar-fg
                      ((t :background "gold")))
                    `(company-tooltip-annotation
                      ((t :inherit company-tooltip
                          :foreground "gold")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "gold"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "gold"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "gold"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "gold"
                              :background "black")
                      (,terminal-class :foreground "gold"
                                       :background "black")))
                    )
                 )
          (add-to-list 'company-backends 'company-yasnippet)
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  )
;;========================================================================================;;
  (defun launch-blue ()
  (interactive)
    (x-stop)
         (use-package company
          :ensure
          :defer 4
          :init (progn
                  (global-company-mode)
                  (setq company-global-modes '(not python-mode cython-mode sage-mode))
                  )
          :config (progn
                    ;;;-(setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt"))
                    ;;;-(add-to-list 'company-backends 'company-ispell)
                    (setq company-tooltip-limit 20
                          company-idle-delay .1
                          company-echo-delay 0
                          company-begin-commands '(self-insert-command)
                          company-transformers '(company-sort-by-occurrence)
                          company-selection-wrap-around t
                          company-idle-delay .1
                          company-minimum-prefix-length 2
                          company-selection-wrap-around t
                          company-dabbrev-downcase nil
                          )
                    (bind-keys :map company-active-map
                               ("C-n" . company-select-next)
                               ("C-p" . company-select-previous)
                               ("C-d" . company-show-doc-buffer)
                               ("<tab>" . company-complete)
                               ("<backtab>" . company-select-previous)
                               ("<escape>" . company-abort)
                               )
                    )
           )
                 (use-package helm-company
                   :ensure t
                   :config
                   (progn
                     (define-key company-mode-map (kbd "C-:") 'helm-company)
                     (define-key company-active-map (kbd "C-:") 'helm-company)
                   )
                 )
                 (deftheme monokai-overrides)
                 (let ((class '((class color) (min-colors 257)))
                       (terminal-class '((class color) (min-colors 89))))
                   (custom-theme-set-faces
                    'monokai-overrides
                    ;; Company tweaks.
                    `(company-tooltip-common
                      ((t :foreground "blue"
                          :background "black"
                          :underline t)))
                    `(company-template-field
                      ((t :inherit company-tooltip
                          :foreground "blue")))
                    `(company-tooltip-selection
                      ((t :background "gray40"
                          :foreground "blue")))
                    `(company-tooltip-common-selection
                      ((t :foreground "blue"
                          :background "gray40"
                          :underline t)))
                    `(company-scrollbar-fg
                      ((t :background "blue")))
                    `(company-tooltip-annotation
                      ((t :inherit company-tooltip
                          :foreground "blue")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "blue"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "blue"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "blue"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "blue"
                              :background "black")
                      (,terminal-class :foreground "blue"
                                       :background "black")))
                    )
                 )
          (add-to-list 'company-backends 'company-dabbrev)
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  )
;;========================================================================================;;
  (defun launch-yellow ()
  (interactive)
    (x-stop)
         (use-package company
          :ensure
          :defer 4
          :init (progn
                  (global-company-mode)
                  (setq company-global-modes '(not python-mode cython-mode sage-mode))
                  )
          :config (progn
                    ;;;-(setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt"))
                    ;;;-(add-to-list 'company-backends 'company-ispell)
                    (setq company-tooltip-limit 20
                          company-idle-delay .1
                          company-echo-delay 0
                          company-begin-commands '(self-insert-command)
                          company-transformers '(company-sort-by-occurrence)
                          company-selection-wrap-around t
                          company-idle-delay .1
                          company-minimum-prefix-length 2
                          company-selection-wrap-around t
                          company-dabbrev-downcase nil
                          )
                    (bind-keys :map company-active-map
                               ("C-n" . company-select-next)
                               ("C-p" . company-select-previous)
                               ("C-d" . company-show-doc-buffer)
                               ("<tab>" . company-complete)
                               ("<backtab>" . company-select-previous)
                               ("<escape>" . company-abort)
                               )
                    )
           )
                 (use-package helm-company
                   :ensure t
                   :config
                   (progn
                     (define-key company-mode-map (kbd "C-:") 'helm-company)
                     (define-key company-active-map (kbd "C-:") 'helm-company)
                   )
                 )
                 (deftheme monokai-overrides)
                 (let ((class '((class color) (min-colors 257)))
                       (terminal-class '((class color) (min-colors 89))))
                   (custom-theme-set-faces
                    'monokai-overrides
                    ;; Company tweaks.
                    `(company-tooltip-common
                      ((t :foreground "yellow"
                          :background "black"
                          :underline t)))
                    `(company-template-field
                      ((t :inherit company-tooltip
                          :foreground "yellow")))
                    `(company-tooltip-selection
                      ((t :background "gray40"
                          :foreground "yellow")))
                    `(company-tooltip-common-selection
                      ((t :foreground "yellow"
                          :background "gray40"
                          :underline t)))
                    `(company-scrollbar-fg
                      ((t :background "yellow")))
                    `(company-tooltip-annotation
                      ((t :inherit company-tooltip
                          :foreground "yellow")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "yellow"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "yellow"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "yellow"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "yellow"
                              :background "black")
                      (,terminal-class :foreground "yellow"
                                       :background "black")))
                    )
                 )
          (add-to-list 'company-backends 'company-keywords)
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  )
;;========================================================================================;;
  (defun launch-orange ()
  (interactive)
    (x-stop)
         (use-package company
          :ensure
          :defer 4
          :init (progn
                  (global-company-mode)
                  (setq company-global-modes '(not python-mode cython-mode sage-mode))
                  )
          :config (progn
                    ;;;-(setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt"))
                    ;;;-(add-to-list 'company-backends 'company-ispell)
                    (setq company-tooltip-limit 20
                          company-idle-delay .1
                          company-echo-delay 0
                          company-begin-commands '(self-insert-command)
                          company-transformers '(company-sort-by-occurrence)
                          company-selection-wrap-around t
                          company-idle-delay .1
                          company-minimum-prefix-length 2
                          company-selection-wrap-around t
                          company-dabbrev-downcase nil
                          )
                    (bind-keys :map company-active-map
                               ("C-n" . company-select-next)
                               ("C-p" . company-select-previous)
                               ("C-d" . company-show-doc-buffer)
                               ("<tab>" . company-complete)
                               ("<backtab>" . company-select-previous)
                               ("<escape>" . company-abort)
                               )
                    )
           )
                 (use-package helm-company
                   :ensure t
                   :config
                   (progn
                     (define-key company-mode-map (kbd "C-:") 'helm-company)
                     (define-key company-active-map (kbd "C-:") 'helm-company)
                   )
                 )
                 (deftheme monokai-overrides)
                 (let ((class '((class color) (min-colors 257)))
                       (terminal-class '((class color) (min-colors 89))))
                   (custom-theme-set-faces
                    'monokai-overrides
                    ;; Company tweaks.
                    `(company-tooltip-common
                      ((t :foreground "orange"
                          :background "black"
                          :underline t)))
                    `(company-template-field
                      ((t :inherit company-tooltip
                          :foreground "orange")))
                    `(company-tooltip-selection
                      ((t :background "gray40"
                          :foreground "orange")))
                    `(company-tooltip-common-selection
                      ((t :foreground "orange"
                          :background "gray40"
                          :underline t)))
                    `(company-scrollbar-fg
                      ((t :background "orange")))
                    `(company-tooltip-annotation
                      ((t :inherit company-tooltip
                          :foreground "orange")))
                   ;; Popup menu tweaks.
                   `(popup-menu-face
                     ((t :foreground "orange"
                         :background "black")))
                   ;; Popup menu tweaks.
                   `(popup-menu-selection-face
                     ((t :background "orange"
                         :foreground "black")))
                   ;; Linum and mode-line improvements (only in sRGB).
                   `(linum
                     ((,class :foreground "orange"
                              :background "black")))
                   ;; Custom region colouring.
                   `(region
                     ((,class :foreground "orange"
                              :background "black")
                      (,terminal-class :foreground "orange"
                                       :background "black")))
                    )
                 )
          (add-to-list 'company-backends 'company-semantic)
  (require 'company)
  (setq company-mode t)
  (setq global-company-mode t)
  )
;;========================================================================================;;
;;========================================================================================;;
;;========================================================================================;;
(global-set-key
  (kbd "<f2>")
  (defhydra hydra-ac-dc ()
            ("e" launch-ac "auto-complete")
            ("y" launch-cyan-company "Cyan-ispell")
            ("m" launch-magenta-company "Magenta-Help")
            ("r" launch-red "RED-eLisp")
            ("g" launch-green "Green-Clang")
            ("l" launch-gold "Gold-YaS")
            ("b" launch-blue "Blue-Dabbrev")
            ("w" launch-yellow "Yellow-Keywords")
            ("n" launch-orange "Orange-SNPTK")

            ("x" x-stop "x-stop")

            ("s" do-ispell "do-ispell")
            ("n" no-ispell "no-ispell")
            ("t" toggle-company-ispell "toggle-ispell")
            )
)

;;::============================================
;; doto-  (company-bbdb :with company-yasnippet)
;; doto-  (company-nxml :with company-yasnippet)
;; doto-  (company-css :with company-yasnippet)
;; doto-  (company-eclim :with company-yasnippet)
;; doto-  (company-semantic :with company-yasnippet)
;; doto-  (company-clang :with company-yasnippet)
;; doto-  (company-xcode :with company-yasnippet)
;; doto-  (company-cmake :with company-yasnippet)
;; doto-  (company-capf :with company-yasnippet)
;; doto-  (company-oddmuse :with company-yasnippet)
;; doto-  (company-files :with company-yasnippet)
;; doto-  (company-dabbrev :with company-yasnippet)
;; doto-  (company-yasnippet :with company-yasnippet)
;; doto-  (company-etags :with company-yasnippet)
;; doto-  (company-gtags :with company-yasnippet))
;; https://emacs.stackexchange.com/questions/40798/company-quickhelp-mode-pop-up-issue
;; doto-  (company-dabbrev-code company-gtags company-etags company-keywords :with company-yasnippet)
;;========================================================================================;;
(set-background-color "tan1")
