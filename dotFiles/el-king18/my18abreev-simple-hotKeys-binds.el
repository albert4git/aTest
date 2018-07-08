;;================================================================================================
 (set-background-color "orange")
;;================================================================================================
;; https://sriramkswamy.github.io/dotemacs/
;;================================================================================================
;; C-c 0  logfenster togle - Albert 
;; clm/toggle-command-log-buffer
;;================================================================================================
  (use-package ediff
               :init
               (setq ediff-window-setup-function 'ediff-setup-windows-plain
                     ediff-split-window-function 'split-window-horizontally))
;;================================================================================================
 (use-package discover-my-major
  :ensure t
  :bind (("C-h C-m" . discover-my-major)
         ("C-h M-m" . discover-my-mode)))
;;======================================
 (use-package window-numbering
  :ensure t
  :init
  (progn
    (window-numbering-mode t)))
;;=====================================
 (use-package mode-icons
  :ensure t
  :init
  (mode-icons-mode))
;;===================================
 (setq search-whitespace-regexp ".*?")

;;==========DUMB JUMP=============================================================================
 (use-package dumb-jump
             :ensure t
             :bind (
               ("C-c g" . dumb-jump-go)
               ("C-c p" . dumb-jump-back)
               ("C-c q" . dumb-jump-quick-look)
               )
             :config
             (dumb-jump-mode))

;; xx  (define-key map (kbd "C-M-g") 'dumb-jump-go)
;; xx  (define-key map (kbd "C-M-p") 'dumb-jump-back)
;; xx  (define-key map (kbd "C-M-q") 'dumb-jump-quick-look)
;;================================================================================================
(use-package newcomment
             :bind ("<f5>" . comment-or-uncomment-region))

;;===================================
(use-package scratch
             :bind ("s-n" . scratch))

;;===================================
 (use-package hippie-exp
              :ensure t
              :bind ("M-/" . hippie-expand))

(global-set-key (kbd "M-/") 'hippie-expand)
;;===================================
(use-package expand-region
             :ensure t
             :bind (("C-=" . er/expand-region)
                    ("C--" . er/contract-region)))

;;=== (?\" . ?\") ===================
(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            ))
;;================================================================================================
 (defun sk/google-this ()
  "Google efficiently"
  (interactive)
  (if (region-active-p)
    (google-this-region 1)
    (google-this-symbol 1)))

;;=====================================================
 (use-package google-this
  :ensure t
  :commands (google-this-word
             google-this-region
             google-this-symbol
             google-this-clean-error-string
             google-this-line
             google-this-search
             google-this-cpp-reference))
 (bind-keys*
  ("M-m g" . sk/google-this))

;;=====================================================
 (defhydra sk/hydra-google (:color blue
                           :hint nil)
  "
 _w_: word   _r_: region    _v_: symbol   _l_: line
 _g_: google _c_: cpp       _s_: string   _q_: quit
 "
  ("w" google-this-word)
  ("r" google-this-region)
  ("v" google-this-symbol)
  ("s" google-this-clean-error-string)
  ("l" google-this-line)
  ("g" google-this-search)
  ("c" google-this-cpp-reference)
  ("q" nil :color blue))

 (bind-keys*
  ("M-m G" . sk/hydra-google/body))
;; ================================================================================================
;; ================================================================================================
;; ================================================================================================
  (use-package origami
               :ensure t
               :commands (origami-toggle-node)
               :bind* (("M-m o" . orgiami-toggle-node)))

;;==================================================
(use-package quickrun
  :ensure t
  :commands (quickrun
             quickrun-region
             quickrun-with-arg
             quickrun-shell
             quickrun-compile-only
             quickrun-replace-region))


;;==================================================
;; nxt- (use-package emacs-lisp-mode
;; nxt-              :mode ("\\.el$" . emacs-lisp-mode)
;; nxt-              :bind (:map emacs-lisp-mode-map
;; nxt-                          ("C-c I" . describe-function)
;; nxt-                          ("C-c S" . find-function-at-point)))
;;==================================================
(use-package editorconfig
  :ensure t
  :demand t
  :config
  (editorconfig-mode 1))

;;==================================================
 (defun sk/insert-date (prefix)
   (interactive "P")
   (let ((format (cond
                   ((not prefix) "%Y-%m-%d")
                   ((equal prefix '(4)) "%A, %d %B %Y")
                   ((equal prefix '(16)) "%Y-%m-%d %H:%M:%S"))))
     (insert (format-time-string format))))
;;=========
(bind-keys*
  ("M-m D" . sk/insert-date))
;;==================================================
  (defun sk/delete-current-buffer-file ()
    (interactive)
    (let ((filename (buffer-file-name))
          (buffer (current-buffer))
          (name (buffer-name)))
      (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
        (when (yes-or-no-p "Are you sure you want to remove this file? ")
          (delete-file filename)
          (kill-buffer buffer)
          (message "File '%s' successfully removed" filename))))
    )

  (bind-keys*
    ("M-m K" . sk/delete-current-buffer-file))

;;==================================================
  (use-package highlight-indentation
    :ensure t
    :commands (highlight-indentation-mode))
    (highlight-indentation-mode t)
;;==================================================

;;==================================================
(use-package highlight-symbol
  :ensure t
  :bind (("M-n" . highlight-symbol-next)
         ("M-p" . highlight-symbol-prev))
  :config
  (highlight-symbol-nav-mode t))
;;==================================================
(use-package anzu
             :bind
             (([remap query-replace] . anzu-query-replace)
              ("s-q" . anzu-query-replace)
              ("C-q" . anzu-query-replace-at-cursor-thing))
             :config
             (global-anzu-mode))


;;================================================================================

(use-package cmake-ide
             :ensure t
             :defer 2
             :config
             (cmake-ide-setup))
;;================================================================================
  (use-package ess
    :ensure t
    :mode (("\\.r$" . R-mode)
           ("\\.R$" . R-mode)
           ("\\.jl$" . julia-mode))
    :commands (R-mode
               julia-mode
               sk/julia-shell-here
               ess-eval-function
               ess-eval-line
               ess-eval-buffer
               ess-switch-to-ESS)
    :config
    (require 'ess-site))


  (defhydra sk/hydra-for-ess (:pre (require 'ess-site)
                              :color blue
                              :hint nil)
    "
   _f_: func     _l_: line    _s_: start    _q_: quit
   _r_: region   _b_: buffer  _S_: switch
  "
    ("f" ess-eval-function)
    ("l" ess-eval-line)
    ("r" ess-eval-region)
    ("b" ess-eval-buffer)
    ("s" sk/julia-shell-here)
    ("S" ess-switch-to-ESS)
    ("q" nil :color blue))

;;===========
  (bind-keys*
    ("M-m S" . sk/hydra-for-ess/body))

;;=========================
;; Vert split julia REPL
(defun sk/julia-shell-here ()
  "opens up a new julia REPL in the directory associated with the current buffer's file."
  (interactive)
  (require 'ess-site)
  (split-window-right)
  (julia)
  (other-window 1))
;;================================================================================
;;================================================================================
(use-package eshell
  :commands (eshell)
  :bind* (("M-m e" . sk/eshell-vertical)
          ("M-m E" . sk/eshell-horizontal))
  :init
  (setq eshell-glob-case-insensitive t
        eshell-scroll-to-bottom-on-input 'this
        eshell-buffer-shorthand t
        eshell-history-size 1024
        eshell-cmpl-ignore-case t
        eshell-aliases-file (concat user-emacs-directory ".eshell-aliases")
        eshell-last-dir-ring-size 512)
  :config
  (add-hook 'shell-mode-hook 'goto-address-mode))

;;=============================
(defun sk/eshell-vertical ()
  "opens up a new shell in the directory associated with the current buffer's file."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                   (file-name-directory (buffer-file-name))
                   default-directory))
         (name (car (last (split-string parent "/" t)))))
    (split-window-right)
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))
    (eshell-send-input)))

;;=============================
(defun sk/eshell-horizontal ()
  "opens up a new shell in the directory associated with the current buffer's file."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                   (file-name-directory (buffer-file-name))
                   default-directory))
         (name (car (last (split-string parent "/" t)))))
    (split-window-below)
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))
    (eshell-send-input)))


;;================================================================================
(use-package perspective
             :ensure t
             :bind* (("M-m p" . persp-switch)
                     ("M-m P" . persp-kill)
                     ("M-m b" . persp-switch-to-buffer)
                     ("M-m n" . persp-rename))
             :config
             (persp-mode 1))


;; enable sensible undo
;;================================================================;;
(use-package undo-tree
             :ensure t
             :diminish undo-tree-mode
             :bind* (("M-m u" . undo-tree-undo)
                     ("M-m r" . undo-tree-redo)
                     ("M-m -" . undo-tree-visualize))
             :config
             (global-undo-tree-mode 1))

(require 'undo-tree)

;; undo work the same way on the EN and DE keymap
(define-key undo-tree-map (kbd "C--") 'undo-tree-undo)
(define-key undo-tree-map (kbd "C-_") 'undo-tree-redo)
;;================================================================;;
;; ToDo 
;;================================================================;;
;; (use-package smartparens
;;   :ensure t
;;   :init (add-hook 'java-mode-hook 'smartparens-mode))

(use-package smartparens
  :ensure t
  :demand t
  :bind* (("M-k  j" . sp-down-sexp)
          ("M-k  k" . sp-backward-up-sexp)
          ("M-k  h" . sp-backward-down-sexp)
          ("M-k  l" . sp-up-sexp)
          ("M-k  f" . sp-forward-sexp)
          ("M-k  b" . sp-backward-sexp)
          ("M-k  a" . sp-beginning-of-sexp)
          ("M-k  e" . sp-end-of-sexp)
          ("M-k  n" . sp-next-sexp)
          ("M-k  p" . sp-previous-sexp)
          ("M-k  >" . sp-forward-barf-sexp)
          ("M-k  <" . sp-backward-barf-sexp)
          ("M-k  )" . sp-forward-slurp-sexp)
          ("M-k  (" . sp-backward-slurp-sexp)
          ("M-k  x" . sp-transpose-sexp)
          ("M-k  d" . sp-kill-sexp)
          ("M-k  y" . sp-copy-sexp)
          ("M-k  u" . sp-unwrap-sexp)
          ("M-k  U" . sp-backward-unwrap-sexp)
          ("M-k  C" . sp-convolute-sexp)
          ("M-k  r" . sp-raise-sexp)
          ("M-k  s" . sp-split-sexp)
          ("M-k  S" . sp-splice-sexp)
          ("M-k  F" . sp-splice-sexp-killing-forward)
          ("M-k  B" . sp-splice-sexp-killing-backward)
          ("M-k  A" . sp-splice-sexp-killing-around))
  :diminish smartparens-mode
  :diminish smartparens-strict-mode
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (smartparens-global-strict-mode)
  (show-smartparens-global-mode)
  (which-key-add-key-based-replacements
    "M-m m" "move prefix")
)

;;================================================================================================
;; ... ToDo .... ParEdit ... ???
;;================================================================================================
;; xx  (use-package paredit
;; xx    :ensure t
;; xx    :pin "melpa"
;; xx    :bind (:map paredit-mode-map
;; xx                ("M-)" . paredit-forward-slurp-sexp)
;; xx                ("M-(" . paredit-forward-barf-sexp)))
;; =====================================================

  (use-package paredit
               :ensure paredit
               :defer t
               :init
               (progn  (add-hook 'ielm-mode-hook (lambda () (paredit-mode 1)))
                       (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))))
;;=============
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)

;; help   [C-M-f] Forward sexp
;; help   [C-M-b] Backward sexp
;; help   [C-M-u] Go up sexp
;; help   [C-k] Kill 
;; help   [M-r] Replac
;; help   [C-M-(] to wrap the following node in parens. Alternatively, [C-M-SPC]
;; help   [M-S] split the current node. This works on parenthesized expressions or strings.
;; help   [M-J] join two nodes. Works same as above in reverse.

;;=============
(sp-pair "'" "'" :actions '(wrap))          ;; only use '' pair for wrapping
(sp-pair "%" "%" :actions '(insert))        ;; only use %% pair for auto insertion, never for wrapping
(sp-pair "(" ")" :actions '(wrap insert))   ;; use () pair for both actions

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)     ;; no '' pair in emacs-lisp-mode
(sp-local-pair 'markdown-mode "`" nil :actions '(insert)) ;; only use ` for auto insertion in markdown-mode

;;================================================================================================
(use-package ztree
             :ensure t
             :bind* (("M-m z" . ztree-dir)
                     ("M-m Z" . ztree-diff))
             :init
             (setq ztree-dir-move-focus t))


;;===================================
;; xx  (use-package iedit
;; xx    :ensure t
;; xx    :commands (iedit-mode)
;; xx    :bind* (("M-m *" . iedit-mode)))
;;===================================


;;================================================================
(use-package eww
  :bind* (("M-m x" . eww)
          ("M-m :" . eww-browse-with-external-browser)
          ("M-m h" . eww-list-histories)
          ("M-m [" . eww-back-url)
          ("M-m ]" . eww-forward-url))
  :config
  (progn
    (add-hook 'eww-mode-hook 'visual-line-mode)))
;;================================================================
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Munich"
                                "Heidelberg"
                                "Hillsboro")))

;;==========SPLIT plus jump======================================
(defun sk/split-below-and-move ()
            (interactive)
            (split-window-below)
            (other-window 1))
;;=============
(defun sk/split-right-and-move ()
            (interactive)
            (split-window-right)
            (other-window 1))
;;=============
(bind-keys
  ("C-x 2" . sk/split-below-and-move)
  ("C-x 3" . sk/split-right-and-move))

;;================================================================
(define-abbrev-table 'global-abbrev-table
                     '(
                       ("reuslt" "result" nil 0)
                       ("reulst" "result" nil 0)
                       ("remidner" "reminder" nil 0)
                       ("suggestsions" "suggestions" nil 0)
                       ("lenfgth" "length" nil 0)
                       ("lengfth" "length" nil 0)
                       ("hten" "then" nil 0)
                       ("Promsie" "Promise" nil 0)
                       ("requier" "require" nil 0)
                       ("entires" "entries" nil 0)
                       ("entiers" "entries" nil 0)
                       ("emtires" "entries" nil 0)
                       ("stirng" "string" nil 0)
                       ("fitler" "filter" nil 0)
                       ("reuqire" "require" nil 0)
                       ("reuiqre" "require" nil 0)
                       )
)

(add-hook 'prog-mode-hook 'abbrev-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ::::::::::::::::::: ============= +++++++++++ --------------
;; (key-chord-define-global "xx" 'smex-major-mode-commands)
;; (key-chord-define-global "xh" 'recentf-ido-find-file)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-AAA-;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package key-chord
             :ensure key-chord
             :init (progn
                     (key-chord-mode 1)
                     (key-chord-define-global "xm" 'smex)
                     (key-chord-define-global "xf" 'ido-find-file)
                     (key-chord-define-global "xb" 'ivy-switch-buffer)
                     (key-chord-define-global "xc" (lambda () (interactive) (switch-to-buffer "*compilation*")))
                     ; use key chords invoke commands
                     (key-chord-define-global "eb"     'eval-buffer)
                     (key-chord-define-global "cy"     'yank-pop)
                     (key-chord-define-global "cg"     "\C-c\C-c")
                     ; frame actions
                     (key-chord-define-global "xo"     'other-window);
                     (key-chord-define-global "x1"     'delete-other-windows)
                     (key-chord-define-global "x0"     'delete-window)
                     (key-chord-define-global "vc"     'vc-next-action)
                     )
             )
;;============Simple Works======================================================================

(use-package simple
             :demand t
             :bind (("M-j" . my/join-line)
                    ("M-SPC" . cycle-spacing)
                    ("s-=" . text-scale-increase)
                    ("s--" . text-scale-decrease)
                    ("<S-left>" . beginning-of-buffer)
                    ("<S-right>" . end-of-buffer))
             :init
             (progn
               (setq delete-active-region nil)
               (setq eval-expression-print-length 20)
               (setq eval-expression-print-level nil))
             :config
             (progn
               (defun my/join-line ()
                 (interactive)
                 (join-line -1))
               (column-number-mode)))


;;================================================================================================
;;;; immutable bindings
;;
;;(bind-keys*
;; ("C-w"     . sk/kill-region-or-backward-word)
;; ("M-w"     . sk/copy-region-or-line)
;; ("M-c"     . sk/toggle-letter-case)
;; ("M-h"     . sk/remove-mark)
;; ("C-x k"   . sk/kill-buffer)
;; ("C-x w"   . save-buffers-kill-terminal))
;;
;;;; mutable bindings
;;
;;(bind-keys
;; ("C-o"     . sk/open-line-above)
;; ("M-o"     . sk/open-line-below)
;; ("M-n"		. sk/nothing)
;; ("M-p"		. sk/nothing)
;; ("C-x C-b" . ibuffer)
;; ("C-c C-c" . sk/nothing)
;; ("C-c '"	. sk/nothing)
;; ("C-c C-f" . sk/nothing))
;;
;;================================================================================================
;;
;; XX (bind-keys*
;; XX   ("C-r"       . dabbrev-expand)
;; XX   ("M-/"       . hippie-expand)
;; XX   ("C-S-d"     . kill-whole-line)
;; XX   ("M-m SPC c" . load-theme)
;; XX   ("M-m SPC R" . locate)
;; XX   ("M-m W"     . winner-undo)
;; XX   ("M-m g m"   . make-frame)
;; XX   ("M-m g M"   . delete-frame)
;; XX   ("M-m g n"   . select-frame-by-name)
;; XX   ("M-m g N"   . set-frame-name)
;; XX   ("M-m B"     . mode-line-other-buffer)
;; XX   ("M-m ="     . indent-region)
;; XX   ("M-m g ("   . Info-prev)
;; XX   ("M-m g )"   . Info-next)
;; XX   ("M-m ^"     . Info-up)
;; XX   ("M-m &"     . Info-goto-node)
;; XX   ("M-m g f"   . find-file-at-point)
;; XX   ("M-m g u"   . downcase-region)
;; XX   ("M-m g U"   . upcase-region)
;; XX   ("M-m g C"   . capitalize-region)
;; XX   ("M-m g F"   . follow-mode)
;; XX   ("M-m R"     . overwrite-mode)
;; XX   ("M-m g j"   . doc-view-next-page)
;; XX   ("M-m g k"   . doc-view-previous-page)
;; XX   ("M-m : t"   . emacs-init-time)
;; XX   ("M-m g q"   . fill-paragraph)
;; XX   ("M-m g @"   . compose-mail)
;; XX   ("M-m SPC ?" . describe-bindings)
;; XX )
;;================================================================================================
;; xx (setq abbrev-file-name "~/.emacs.d/abbrev_defs"
;; xx       save-abbrevs t)
;; xx (global-set-key (kbd "C-x C-b") 'ibuffer)
;; xx (global-set-key (kbd "C-c C-n") 'clean-up-buffer)
;; xx (global-set-key (kbd "C-c C-j") 'aar/pretty-json)
;; xx (global-set-key (kbd "C-x f") 'recentf-ido-find-file)
;; xx (global-set-key (kbd "C-x F") 'find-function)
;; xx (global-set-key (kbd "C-M-h") 'backward-kill-word)
;; xx (global-set-key (kbd "C-c y") 'bury-buffer)
;; xx (global-set-key (kbd "C-c r") 'revert-buffer)
;; xx (global-set-key (kbd "C-x O")
;; xx                 (lambda ()
;; xx                   (interactive) (other-window -1))) ;; back one
;; xx (global-set-key (kbd "C-x C-o")
;; xx                 (lambda ()
;; xx (interactive) (other-window 2))) ;; forward two
;; ================================================================================================
(set-background-color "blue4")
;;================================================================================================
