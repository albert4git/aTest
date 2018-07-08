
;;==============================================================================
(use-package material-theme
             :ensure t
             :defer t
             :init
             (defun gh/material-theme-hook ()
               (set-face-attribute 'which-key-key-face nil :foreground
                                   (face-attribute 'error :foreground))
               (loop for n from 1 to 8
                     do (set-face-attribute (intern-soft (format "org-level-%s" n))
                                            nil
                                            :height     'unspecified
                                            :background 'unspecified
                                            :box        'unspecified)))
             (gh/add-theme-hook 'material       #'gh/material-theme-hook)
             (gh/add-theme-hook 'material-light #'gh/material-theme-hook))
;;==============================================================================
(use-package solarized
             :ensure solarized-theme
             :defer t
             :init
             (defun gh/solarized-theme-hook ()
               (set-face-attribute 'font-lock-constant-face nil :weight 'normal)
               (set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
               (set-face-attribute 'which-key-key-face nil :foreground
                                   (face-attribute 'error :foreground)))
             (gh/add-theme-hook 'solarized-dark  #'gh/solarized-theme-hook)
             (gh/add-theme-hook 'solarized-light #'gh/solarized-theme-hook)
             :config
             (setq solarized-use-variable-pitch nil
                   solarized-use-less-bold t
                   solarized-use-more-italic nil
                   solarized-distinct-doc-face t
                   solarized-high-contrast-mode-line t
                   ;; I find different font sizes irritating.
                   solarized-height-minus-1 1.0
                   solarized-height-plus-1 1.0
                   solarized-height-plus-2 1.0
                   solarized-height-plus-3 1.0
                   solarized-height-plus-4 1.0))
;;==============================================================================
(defhydra gh/themes-hydra (:hint nil :color pink)
          "
          Themes

          ^Solarized^   ^Material^   ^Other^
          ----------------------------------------------------
          _s_: Dark     _m_: Dark    _z_: Zenburn  _DEL_: none
          _S_: Light    _M_: Light
          "
          ("s" (load-theme 'solarized-dark  t))
          ("S" (load-theme 'solarized-light t))
          ("m" (load-theme 'material        t))
          ("M" (load-theme 'material-light  t))
          ("z" (load-theme 'zenburn         t))
          ("DEL" (gh/disable-all-themes))
          ("RET" nil "done" :color blue))

(bind-keys ("C-c t"  . gh/themes-hydra/body))

;;==============================================================================


(defhydra sk/hydra-for-cpp (:color blue
                            :hint nil)
  "
 ^Send^                                                    ^Navigate^
^^^^^^^^^^----------------------------------------------------------------------------------------------------------------------------------
 _B_: build            _o_: omp math      _O_: omp simple      _s_: sym-at-pt   _r_: ref-at-pt    _D_: diag    _f_: for-stack    _n_: next    _i_: info
 _c_: compile math     _m_: mpi math      _M_: mpi simple      _S_: symbol      _R_: references   _F_: fixit   _b_: back-stack   _p_: prev    _t_: type
 _C_: compile simple   _h_: hybrid math   _H_: hybrid simple   _v_: vir-at-pt   _N_: rename       _P_: preproc _d_: depends      _e_: enum    _q_: quit
"
  ("B" compile)
  ("o" sk/compile-cpp-omp-math)
  ("O" sk/compile-cpp-omp-simple)
  ("m" sk/compile-cpp-mpi-math)
  ("M" sk/compile-cpp-mpi-simple)
  ("h" sk/compile-cpp-hybrid-math)
  ("H" sk/compile-cpp-hybrid-simple)
  ("c" sk/compile-cpp-math)
  ("C" sk/compile-cpp-simple)
  ("s" rtags-find-symbol-at-point :color red)
  ("S" rtags-find-symbol :color red)
  ("r" rtags-find-references-at-point :color red)
  ("R" rtags-find-references :color red)
  ("v" rtags-find-virtuals-at-point :color red)
  ("D" rtags-diagnostics :color red)
  ("F" rtags-fixit :color red)
  ("P" rtags-preprocess-file :color red)
  ("f" rtags-location-stack-forward :color red)
  ("b" rtags-location-stack-back :color red)
  ("n" rtags-next-match :color red)
  ("p" rtags-previous-match :color red)
  ("d" rtags-print-dependencies :color red)
  ("i" rtags-print-symbol-info :color red)
  ("t" rtags-symbol-type :color red)
  ("e" rtags-print-enum-value-at-point :color red)
  ("N" rtags-rename-symbol :color red)
  ("q" nil :color blue))


  (bind-keys*
  ("M-m s c" . sk/hydra-for-cpp/body))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defhydra sk/hydra-quickrun (:color blue
                             :hint nil)
  "
 _s_: quickrun     _a_: with arg    _c_: compile only       _q_: quit
 _r_: run region   _S_: shell       _R_: replace region
"
  ("s" quickrun)
  ("r" quickrun-region)
  ("a" quickrun-with-arg)
  ("S" quickrun-shell)
  ("c" quickrun-compile-only)
  ("R" quickrun-replace-region)
  ("q" nil :color blue))

(bind-keys*
  ("M-m s q" . sk/hydra-quickrun/body))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package dash-at-point
  :ensure t
  :bind (("C-c I" . dash-at-point))
  :bind* (("M-m SPC i" . dash-at-point-with-docset)
          ("M-m SPC I" . dash-at-point)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-tag-alist (quote (("article"   . ?a) ;; temporary
                            ("books"     . ?b)
                            ("courses"   . ?c) ;; temporary
                            ("code"      . ?C)
                            ("card"      . ?d)
                            ("drill"     . ?D)
                            ("errands"   . ?e)
                            ("films"     . ?f)
                            ("gubby"     . ?g)
                            ("home"      . ?h)
                            ("idea"      . ?i)
                            ("job"       . ?j)
                            ("ledger"    . ?l)
                            ("meeting"   . ?m)
                            ("note"      . ?n)
                            ("online"    . ?o)
                            ("personal"  . ?p)
                            ("project"   . ?P)
                            ("reference" . ?r) ;; temporary
                            ("reveal"    . ?R)
                            ("story"     . ?s)
                            ("technical" . ?t)
                            ("vague"     . ?v)
                            ("work"      . ?w)
                            ("noexport"  . ?x)
                            ("cash"      . ?$))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :ensure t
  :commands (company-mode
             company-complete
             company-complete-common
             company-complete-common-or-cycle
             company-files
             company-dabbrev
             company-ispell
             company-c-headers
             company-jedi
             company-tern
             company-web-html
             company-auctex)
  :init
  (setq company-minimum-prefix-length 2
        company-require-match 0
        company-selection-wrap-around t
        company-dabbrev-downcase nil
        company-tooltip-limit 20                      ; bigger popup window
        company-tooltip-align-annotations 't          ; align annotations to the right tooltip border
        company-idle-delay .4                         ; decrease delay before autocompletion popup shows
        company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (eval-after-load 'company
    '(add-to-list 'company-backends '(company-files
                                      company-capf)))
  :bind (("M-t"   . company-complete)
         ("C-c f" . company-files)
         ("C-c a" . company-dabbrev)
         ("C-c d" . company-ispell)
         :map company-active-map
              ("C-n"    . company-select-next)
              ("C-p"    . company-select-previous)
              ([return] . company-complete-selection)
              ("C-w"    . backward-kill-word)
              ("C-c"    . company-abort)
              ("C-c"    . company-search-abort))
  :diminish (company-mode . "ς")
  :config
  (global-company-mode)
  ;; C++ header completion
  (use-package company-c-headers
    :ensure t
    :bind (("C-c c" . company-c-headers))
    :config
    (add-to-list 'company-backends 'company-c-headers))
  ;; Python auto completion
  (use-package company-jedi
    :ensure t
    :bind (("C-c j" . company-jedi))
    :config
    (add-to-list 'company-backends 'company-jedi))
  ;; Tern for JS
  (use-package company-tern
    :ensure t
    :bind (("C-c t" . company-tern))
    :init
    (setq company-tern-property-marker "")
    (setq company-tern-meta-as-single-line t)
    :config
    (add-to-list 'company-backends 'company-tern))
  ;; HTML completion
  (use-package company-web
    :ensure t
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))
  ;; LaTeX autocompletion
  (use-package company-auctex
    :ensure t
    :bind (("C-c l" . company-auctex))
    :config
    (add-to-list 'company-backends 'company-auctex)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defhydra sk/hydra-vimish-fold (:color red
                                :hint nil)
  "
 _f_: fold  _u_: unfold  _r_: refold  _t_: toggle  _d_: delete    _n_: next      _q_: quit
          _U_: Unfold  _R_: Refold  _T_: Toggle  _D_: Delete    _p_: previous
  "
  ("f" vimish-fold)
  ("u" vimish-fold-unfold)
  ("r" vimish-fold-refold)
  ("t" vimish-fold-toggle)
  ("d" vimish-fold-delete)
  ("U" vimish-fold-unfold-all)
  ("R" vimish-fold-refold-all)
  ("T" vimish-fold-toggle-all)
  ("D" vimish-fold-delete-all)
  ("n" vimish-fold-next-fold)
  ("p" vimish-fold-previous-fold)
  ("q" nil :color blue))

(bind-keys*
  ("M-l f" . vimish-fold-toggle)
  ("M-l u" . sk/hydra-vimish-fold/body)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yasnippet
             :ensure t
             :commands (yas-insert-snippet yas-new-snippet)
             :bind (("C-o" . yas-insert-snippet))
             :bind* (("C-="        . yas-new-snippet)
                     ("C-<escape>" . yas-visit-snippet-file))
             :diminish (yas-minor-mode . "γ")
             :config
             (setq yas/triggers-in-field t); Enable nested triggering of snippets
             (setq yas-prompt-functions '(yas-completing-prompt))
             (add-hook 'snippet-mode-hook '(lambda () (setq-local require-final-newline nil)))
             (yas-global-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; save the current macro as reusable function.
(defun save-current-kbd-macro-to-dot-emacs (name)
  "Save the current macro as named function definition inside your initialization file so you can reuse it anytime in the future."
  (interactive "SSave Macro as: ")
  (name-last-kbd-macro name)
  (save-excursion 
    (find-file-literally user-init-file)
    (goto-char (point-max))
    (insert "\n\n;; Saved macro\n")
    (insert-kbd-macro name)
    (insert "\n")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package cc-mode
  :defer t
  :config
  (add-hook 'c-mode-hook
	    (lambda ()
	      (c-set-style "bsd")))
  (add-hook 'c++-mode-hook 'google-set-c-style)
  (add-hook 'java-mode-hook
	    (lambda ()
	      (setq c-basic-offset 4
		    tab-width 4
		    indent-tabs-mode t))))
;;;;;;;;;;;;;;;;;;;;;;;; wamondo uncoment ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package simple
  :custom
  (set-mark-command-repeat-pop t)
  (save-interprogram-paste-before-kill t)
  (idle-update-delay 2)
  (next-error-recenter t)
  (async-shell-command-buffer 'new-buffer)
  :bind
  (("s-k" . kill-whole-line)
   ("C-`" . list-processes)
   (:map minibuffer-local-map
         ("<escape>"  . abort-recursive-edit)
         ("M-TAB"     . previous-complete-history-element)
         ("<M-S-tab>" . next-complete-history-element)))
  :hook
  ((org-mode markdown-mode fountain-mode git-commit-mode) . auto-fill-mode)
  :config
  (global-visual-line-mode)
  (column-number-mode)
  (defun pop-to-mark-command-until-new-point (orig-fun &rest args)
    (let ((p (point)))
      (dotimes (_i 10)
        (when (= p (point))
          (apply orig-fun args)))))
  (defun maybe-indent-afterwards (&optional _)
    (and (not current-prefix-arg)
         (not (member major-mode indent-sensitive-modes))
         (or (-any? #'derived-mode-p '(prog-mode sgml-mode)))
         (indent-region (region-beginning) (region-end) nil)))
  (defun pop-to-process-list-buffer ()
    (pop-to-buffer "*Process List*"))
  (defun kill-or-join-line (orig-fun &rest args)
    (if (not (eolp))
        (apply orig-fun args)
      (delete-indentation 1)
      (when (and (eolp) (not (eq (point) (point-max))))
        (kill-or-join-line orig-fun args))))
  (defun move-beginning-of-line-or-indentation (orig-fun &rest args)
    (let ((orig-point (point)))
      (back-to-indentation)
      (when (= orig-point (point))
        (apply orig-fun args))))
  (defun backward-delete-subword (orig-fun &rest args)
    (cl-letf (((symbol-function 'kill-region) #'delete-region))
      (apply orig-fun args)))
  (advice-add 'pop-to-mark-command :around #'pop-to-mark-command-until-new-point)
  (advice-add 'yank :after #'maybe-indent-afterwards)
  (advice-add 'yank-pop :after #'maybe-indent-afterwards)
  (advice-add 'list-processes :after #'pop-to-process-list-buffer)
  (advice-add 'backward-kill-word :around #'backward-delete-subword)
  (advice-add 'kill-whole-line :after #'back-to-indentation)
  (advice-add 'kill-line :around #'kill-or-join-line)
  (advice-add 'kill-visual-line :around #'kill-or-join-line)
  (advice-add 'move-beginning-of-line :around #'move-beginning-of-line-or-indentation)
  (advice-add 'beginning-of-visual-line :around #'move-beginning-of-line-or-indentation))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom splitting functions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package guide-key
  :ensure t
  :diminish guide-key-mode  
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x 4" "C-c p"))
    (guide-key-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package window-numbering
  :ensure t
  :init
  (progn
    (window-numbering-mode t)))

(use-package spaceline
  :ensure t
  :init
  (progn
    (require 'spaceline-config)
    (setq powerline-height '18)
    (setq powerline-default-separator 'wave)
    (spaceline-spacemacs-theme)))

(use-package ace-jump-mode
  :ensure t
  :init
  (progn
    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
    ;; Also with universal argument: C-u C-c SPC
    ;; For line jumping: C-u C-u C-c SPC
    ))

;;===================================
(use-package nyan-mode
  :ensure t
  :init
  (progn
    (nyan-mode 1)))

;;===================================
(use-package flycheck-pos-tip
  :ensure t
  :init
  (progn
    (with-eval-after-load 'flycheck
      (flycheck-pos-tip-mode))))

;;===================================
(use-package electric
  :ensure t
  :init
  (progn
    (electric-pair-mode 1)))

(use-package mode-icons
  :ensure t
  :init
  (mode-icons-mode))

(use-package expand-region
  :ensure t)

(use-package centered-cursor-mode
  :ensure t
  :init (global-centered-cursor-mode +1))

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

(use-package mode-icons
  :ensure t
  :init
  (mode-icons-mode))
;; Shift the selected region right if distance is postive, left if
;; negative

(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one 
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key (kbd "C-c >") 'shift-right)
(global-set-key (kbd "C-c <") 'shift-left)

;; Isearch convenience, space matches anything (non-greedy)
;; Note that you can use universal argument
(setq search-whitespace-regexp ".*?")
(toggle-frame-fullscreen)
(global-set-key (kbd "M-/") 'hippie-expand)

(use-package guide-key
  :ensure t
  :diminish guide-key-mode  
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x 4" "C-c p"))
    (guide-key-mode 1)))

(use-package window-numbering
  :ensure t
  :init
  (progn
    (window-numbering-mode t)))

(use-package spaceline
  :ensure t
  :init
  (progn
    (require 'spaceline-config)
    (setq powerline-height '18)
    (setq powerline-default-separator 'wave)
    (spaceline-spacemacs-theme)))

(use-package ace-jump-mode
  :ensure t
  :init
  (progn
    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
    ;; Also with universal argument: C-u C-c SPC
    ;; For line jumping: C-u C-u C-c SPC
))
(use-package doc-view
  :ensure t
  :config
  (progn
    (add-hook 'doc-view-mode-hook 'auto-revert-mode)))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key (kbd "C-x o") 'ace-window)))

;; (use-package smart-mode-line
;;   :ensure t
;;   :init
;;   (progn
;;     (setq sml/no-confirm-load-theme t)
;;     (sml/setup)))

;; (use-package smart-mode-line-powerline-theme
;;   :ensure t
;;   :init
;;   (progn
;;     (setq sml/theme 'powerline)
;;     (setq powerline-arrow-shape 'curve)
;;     (setq powerline-default-separator-dir '(right . left))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Projectile related config
(use-package projectile
  :ensure t
  :diminish projectile-mode "p"
  :init 
  (progn
    (projectile-global-mode))
  :config
  (progn
    (setq projectile-enable-caching t)))

;;Helm related config
(use-package helm
  :ensure t
  :diminish helm-mode "h"
  :init
  (progn
    (require 'helm-config)
    (helm-mode 1))
  :config
  (progn
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))
    (global-set-key (kbd "C-x p") 'helm-list-elisp-packages-no-fetch)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
    (define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z
    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
          helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
          helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
          helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
          helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
          helm-ff-file-name-history-use-recentf t
          helm-ff-newfile-prompt-p nil)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key "\C-x\C-m" 'helm-M-x)
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "C-c h o") 'helm-occur)))

;; (use-package imenu-anywhere
;;   :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package helm-swoop
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-i") 'helm-swoop)
    (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
    (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
    (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

    ;; When doing isearch, hand the word over to helm-swoop
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    ;; From helm-swoop to helm-multi-swoop-all
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
    ;; When doing evil-search, hand the word over to helm-swoop
    ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

    ;; Move up and down like isearch
    (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
    (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

    ;; Save buffer when helm-multi-swoop-edit complete
    (setq helm-multi-swoop-edit-save t)

    ;; If this value is t, split window inside the current window
    (setq helm-swoop-split-with-multiple-windows nil)

    ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
    (setq helm-swoop-split-direction 'split-window-vertically)

    ;; If nil, you can slightly boost invoke speed in exchange for text color
    (setq helm-swoop-speed-or-color nil)

    ;; ;; Go to the opposite side of line from the end or beginning of line
    (setq helm-swoop-move-to-line-cycle t)

    ;; Optional face for line numbers
    ;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)))

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Octave-mode
(use-package octave
  :ensure t
  :mode "\\.m\\'")

;; emms
(use-package emms
  :ensure t
  :config
  (progn
    (emms-standard)
    (emms-default-players)
    (setq emms-playlist-buffer-name "Music-EMMS")
    (setq emms-source-file-default-directory "~/Music/")))

(use-package magit
             :ensure t
             :diminish magit-auto-revert-mode  
             :init
             (progn
               (global-set-key (kbd "C-c g") 'magit-status)
               (setq magit-auto-revert-mode 1)
               (setq magit-commit-arguments (quote ("--gpg-sign=BB557613")))
               (setq magit-last-seen-setup-instructions "1.4.0")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package ace-jump-mode
  :ensure ace-jump-mode
  :bind (("C-'" . ace-jump-mode)
         ("C-\"" . ace-jump-char-mode)))

;;===================XXX=ToDo==========dabbrev-expand
(use-package key-chord
             :ensure key-chord
             :init (progn
                     (key-chord-mode 1)
                     (key-chord-define-global "jk" 'dabbrev-expand)
                     (key-chord-define-global "l;" 'magit-status)
                     (key-chord-define-global "`1" 'yas/expand)
                     (key-chord-define-global "-=" (lambda () (interactive) (switch-to-buffer "*compilation*")))


                     (key-chord-define-global "xb" 'recentf-ido-find-file)
                     (key-chord-define-global "xg" 'smex)
                     (key-chord-define-global "XG" 'smex-major-mode-commands)
                     (key-chord-define-global "fj" 'ash-clear)
                     (key-chord-define-global "0k" 'mirror-buffer)
                     (key-chord-define-global "o\\" 'er/expand-region)
                     (key-chord-define-global "p\\" 'er/contract-region)))

(use-package yasnippet
             :ensure yasnippet
             :diminish (yas-snippet . "")
             :defer t
             :init
             (progn
               (require 'dropdown-list)
               (setq yas/prompt-functions '(yas/dropdown-prompt
                                             yas/ido-prompt
                                             yas/completing-prompt)
                     ;; Important to indent all the lines, including the first,
                     ;; otherwise the snippet has wrong indentation.
                     yas-also-auto-indent-first-line t
                     yas-snippet-dirs (quote ("~/.emacs.d/snippets")))
               (yas-global-mode 1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(use-package go-mode
  :ensure go-mode
  :mode ("\\.go$" . go-mode)
  :init (progn  (defun ash/go-initialization ()
                  (setq tab-width 2))
                (add-hook 'go-mode-hook 'ash/go-initialization)))

;;======================================================================================================================
(use-package ido
             :ensure ido-ubiquitous
             :ensure ido-vertical-mode
             :ensure flx-ido
             :defer t
             :bind (("C-x b" . ido-switch-buffer)
                    ("C-x C-f" . ido-find-file))
             :config (progn 
                       (setq ido-enable-tramp-completion nil)
                       (setq ido-usr-url-at-point t)
                       (add-to-list 'ido-ignore-files "flymake.cc")
                       (require 'ido-vertical-mode)
                       (ido-vertical-mode 1)
                       ;; ido mode hack to get java to javatests rotation
                       (defun ash/cycle-java ()
                         (interactive)
                         (cond ((string-match "java/" ido-current-directory)
                                (ido-set-current-directory (replace-regexp-in-string "java/" "javatests/" ido-current-directory)))
                               ((string-match "javatests/" ido-current-directory)
                                (ido-set-current-directory (replace-regexp-in-string "javatests/" "java/" ido-current-directory))))
                         (setq ido-exit 'refresh
                               ido-rescan t
                               ido-rotate-temp t)
                         (exit-minibuffer))
                       (defun ash/ido-mode-map-setup ()
                         (define-key ido-completion-map (kbd "C-;") 'ash/cycle-java))
                       (add-hook 'ido-setup-hook 'ash/ido-mode-map-setup)))
;;======================================================================================================================

(use-package paredit
             :ensure paredit
             :defer t
             :init
             (progn  (add-hook 'ielm-mode-hook (lambda () (paredit-mode 1)))
                     (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;
;; Package setup ;;
;;;;;;;;;;;;;;;;;;;

(use-package dynamic-fonts
  :ensure dynamic-fonts
  :init
  (progn (setq dynamic-fonts-preferred-proportional-fonts
               '("Source Sans Pro" "DejaVu Sans" "Helvetica"))
         (setq dynamic-fonts-preferred-monospace-fonts
               '("Source Code Pro" "Inconsolata" "Monaco" "Consolas" "Menlo"
                 "DejaVu Sans Mono" "Droid Sans Mono Pro" "Droid Sans Mono")))
  :config
  ;; If we started with a frame, just setup the fonts, otherwise wait until
  ;; we make a frame.
  ;; NOTE: This doesn't actually work with daemon mode.  I don't know
  ;; why not yet.  Maybe add a delay as a hack?
  (if initial-window-system
      (dynamic-fonts-setup)
    (add-to-list 'after-make-frame-functions
(lambda (frame) (dynamic-fonts-setup)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






;; don't sound that bloody chime
(setq ring-bell-function #'ignore)

;; Easily wrap statements in delimiters
(wrap-region-global-mode t)

;; always ask for `y` or `n` instead of `yes` or `no`
(defalias 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ztree and its function ztree-diff is super useful when comparing directory trees.

  (use-package ztree
               :ensure t
               :bind* (("M-m g v" . ztree-dir)
                       ("M-m g V" . ztree-diff))
               :init
               (setq ztree-dir-move-focus t))

(use-package zoom-window
  :ensure t
  :bind* (("M-m Z" . zoom-window-zoom)))

(defun sk/rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))




(defhydra sk/hydra-of-windows (:color red
                               :hint nil)
  "
 ^Move^    ^Size^    ^Change^                    ^Split^           ^Text^
 ^^^^^^^^^^^------------------------------------------------------------------
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^   _u_: winner-undo _o_: rotate  _v_: vertical     _+_: zoom in
 _h_ ^+^ _l_   _H_ ^+^ _L_   _r_: winner-redo            _s_: horizontal   _-_: zoom out
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^   _c_: close                  _z_: zoom         _q_: quit
"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" shrink-window-horizontally)
  ("K" shrink-window)
  ("J" enlarge-window)
  ("L" enlarge-window-horizontally)
  ("v" sk/split-right-and-move)
  ("s" sk/split-below-and-move)
  ("c" delete-window)
  ("f" sk/toggle-frame-fullscreen-non-native :color blue)
  ("o" sk/rotate-windows)
  ("z" delete-other-windows)
  ("u" (progn
         (winner-undo)
         (setq this-command 'winner-undo)))
  ("r" winner-redo)
  ("+" text-scale-increase)
  ("-" text-scale-decrease)
  ("q" nil :color blue))

  (bind-keys*
  ("M-m SPC u" . sk/hydra-of-windows/body))



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


(bind-keys*
  ("M-m `" . sk/hydra-bookmarks/body))

(use-package iedit
  :ensure t
  :commands (iedit-mode)
  :bind* (("M-m *" . iedit-mode)))



   (use-package yasnippet
                :ensure t
                :commands (yas-insert-snippet yas-new-snippet)
                :bind (("C-o" . yas-insert-snippet))
                :bind* (("C-="        . yas-new-snippet)
                        ("C-<escape>" . yas-visit-snippet-file))
                :diminish (yas-minor-mode . "γ")
                :config
                (setq yas/triggers-in-field t); Enable nested triggering of snippets
                (setq yas-prompt-functions '(yas-completing-prompt))
                (add-hook 'snippet-mode-hook '(lambda () (setq-local require-final-newline nil)))
                (yas-global-mode))

   (defun sk/force-yasnippet-off ()
     (yas-minor-mode -1)
     (setq yas-dont-activate t))
    (add-hook 'term-mode-hook 'sk/force-yasnippet-off)
    (add-hook 'shell-mode-hook 'sk/force-yasnippet-off)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun move-forward-out-of-param ()
  (while (not (looking-at ")\\|, \\| ?}\\| ?\\]"))
    (cond
     ((point-is-in-string-p) (move-point-forward-out-of-string))
     ((looking-at "(\\|{\\|\\[") (forward-list))
     (t (forward-char)))))

(defun move-backward-out-of-param ()
  (while (not (looking-back "(\\|, \\|{ ?\\|\\[ ?"))
    (cond
     ((point-is-in-string-p) (move-point-backward-out-of-string))
     ((looking-back ")\\|}\\|\\]") (backward-list))
     (t (backward-char)))))
;;;;;;;;;;;;;;;;;;;;;;;

  (defun transpose-params ()
  "Presumes that params are in the form (p, p, p) or {p, p, p} or [p, p, p]"
  (interactive)
  (let* ((end-of-first (cond
                        ((looking-at ", ") (point))
                        ((and (looking-back ",") (looking-at " ")) (- (point) 1))
                        ((looking-back ", ") (- (point) 2))
                        (t (error "Place point between params to transpose."))))
         (start-of-first (save-excursion
                           (goto-char end-of-first)
                           (move-backward-out-of-param)
                           (point)))
         (start-of-last (+ end-of-first 2))
         (end-of-last (save-excursion
                        (goto-char start-of-last)
                        (move-forward-out-of-param)
                        (point))))
    (transpose-regions start-of-first end-of-first start-of-last end-of-last)))

  (bind-keys*
    ("M-m s c" . transpose-params))


;;==============================================================================
 ;;; Some convenience font functions
(defun sk/courier-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Courier")
    (set-frame-width (selected-frame) 97))
(defun sk/georgia-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Georgia" :height 160))
(defun sk/hack-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Hack"))
(defun sk/monaco-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Monaco"))
(defun sk/consolas-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Consolas"))
(defun sk/deja-vu-font ()
  (interactive)
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))

;; Font types
(defun sk/tiny-type ()
  (interactive)
  (set-face-attribute 'default nil  :height 150))
(defun sk/miniscule-type ()
  (interactive)
  (set-face-attribute 'default nil  :height 140))
(defun sk/small-type ()
  (interactive)
  (set-face-attribute 'default nil  :height 190)
  (set-frame-width (selected-frame) 89))
(defun sk/medium-type ()
  (interactive)
  (set-face-attribute 'default nil  :height 215)
  (set-frame-width (selected-frame) 89))
(defun sk/large-type ()
  (interactive)
  (set-face-attribute 'default nil  :height 350)
  (set-frame-width (selected-frame) 68)) 
;;==============================================================================
