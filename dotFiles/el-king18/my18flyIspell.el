;;==============================================================================
  (use-package flycheck
               :init
               (progn
                 (setq flycheck-emacs-lisp-check-declare t)
                 (setq flycheck-emacs-lisp-load-path 'inherit)
                 )
               (global-set-key (kbd "C-c f") 'flycheck-buffer)
               (global-set-key (kbd "C-c j") 'flycheck-next-error)
               (global-set-key (kbd "C-c k") 'flycheck-previous-error)
  )

;;==============================================================================
  (use-package flycheck-pos-tip
               :config
               (if (fboundp 'flycheck-pos-tip-mode)
                 (flycheck-pos-tip-mode)
                 )
               )

;;==============================================================================
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                (display-buffer-reuse-window
                 display-buffer-in-side-window)
                (side            . bottom)
                (reusable-frames . visible)
                (window-height   . 0.33)))

;;==============================================================================
  (use-package flycheck-package
               :demand t
               :after flycheck
               :config
               (progn
                 (flycheck-package-setup)
                 )
               )

 ;;===============================
  (defun display-buffer-window-below-and-shrink (buffer alist)
      (let ((window (or (get-buffer-window buffer)
                        (display-buffer-below-selected buffer alist))))
        (when window
          (message "Here window is %s" window)
          (fit-window-to-buffer window 20)
          ;; (with-selected-window window (enlarge-window (- (frame-height) (window-height))))
          (set-background-color "misty rose") ;; misty rose
          (shrink-window-if-larger-than-buffer window)
          window)))
    ;; (setq display-buffer-alist nil)
    (add-to-list 'display-buffer-alist
                 `(,(rx string-start (eval flycheck-error-list-buffer) string-end)
                   (display-buffer-window-below-and-shrink . ((reusable-frames . t)))))

 ;;===============================
  (defun toggle-flycheck-error-buffer ()
    "toggle a flycheck error buffer."
    (interactive)
    (if (string-match-p "Flycheck errors" (format "%s" (window-list)))
      (dolist (w (window-list))
        (when (string-match-p "*Flycheck errors*" (buffer-name (window-buffer w)))
          (delete-window w)
          ))
      (flycheck-list-errors)
      )
    )
  (global-set-key (kbd "<f9>") 'toggle-flycheck-error-buffer )


 ;;===============================
  (require 'flycheck)
  (defface flycheck-error
           '((t (:foreground "red" :underline (:color "Red3" :style wave) :weight bold)))
           "Flycheck face for errors"
           :group "flycheck")


  (add-hook 'after-init-hook #'global-flycheck-mode)
  (provide 'init-flycheck)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   spell check  ;;;;   spell check  ;;;;   spell check  ;;;;   spell check  ;;;;   spell check  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (global-set-key (kbd "C-c f") 'flycheck-buffer)
;; =================================================================================================
(setq flyspell-babel-verbose t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default ispell-program-name "aspell")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flyspell
             :ensure t
             :defer t
             :init
             (progn
               (add-hook 'prog-mode-hook 'flyspell-prog-mode)
               (add-hook 'text-mode-hook 'flyspell-mode)
               )
             :config
             ;; Sets flyspell correction to use two-finger mouse click
             (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
             )

;; =================================================================================================
;; (use-package flyspell-correct-ivy
;; (use-package flyspell-correct-helm
;;   :bind
;;   (:map flyspell-mode-map
;;         ("C-;" . flyspell-correct-previous-word-generic)))
;;
;; (define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)
;; =================================================================================================

(use-package helm-flyspell
             :ensure t
             :commands helm-flyspell-correct
             :init (eval-after-load 'flyspell
                                    '(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)))

;; =================================================================================================

(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-mode)
(global-set-key (kbd "M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "<f7>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
)

(global-set-key (kbd "s-<f7>") 'flyspell-check-next-highlighted-word)

;; =================================================================================================
;; LL
;; LL F8 will call ispell (or aspell, etc) for the word. You can also use the built-in key binding M-$.
;; LL Ctrl-Shift-F8 enables/disables FlySpell for your current buffer (highlights misspelled words as you type)
;; LL Crtl-Meta-F8 runs FlySpell on your current buffer (highlights all misspelled words in the buffer)
;; LL Ctrl-F8 calls ispell for the FlySpell highlighted word prior to the cursor’s position
;; LL Meta-F8 calls ispell for the FlySpell highlighted word after the cursor’s position
;; LL
;; =================================================================================================
;;
;; (setq flyspell-babel-verbose t)
;;
;; (setq flyspell-babel-to-ispell-alist
;;        '(("german" "german")
;;          ("italian" "italian")
;;          ("latin" "latin")))
;;
;; (setq flyspell-babel-command-alist
;;       '(("fgi" "german")
;;         ("fii" "italian")
;;         ("fl" "latin")
;;     ("fli" "latin")))
;; =================================================================================================
(set-background-color "burlywood1")
