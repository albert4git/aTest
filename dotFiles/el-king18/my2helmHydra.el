;;========================HELM==========================================================================
(use-package helm
             :ensure t
             :demand t
             :diminish helm-mode
             :defer 5
             :bind (
                        ([f11] . helm-recentf)
                        ([S-f11] . helm-buffers-list)
                    )
             :bind* (
                         ("M-h SPC" . helm-all-mark-rings)
                         ("M-h k" . helm-show-kill-ring)
                         ("M-h a" . helm-apropos)
                         ("M-h c" . helm-colors)
                         ("M-h d" . helm-documentation)
                         ("M-h f" . helm-for-files)
                         ("M-h m" . helm-mini)
                     )
             :config
             (use-package helm-config
                          :ensure helm
                          )

 ;; UnterBuffer ;;------- (add-to-list 'display-buffer-alist              ;;--------
 ;; UnterBuffer ;;-------              '("\\`\\*helm.*\\*\\'"             ;;--------
 ;; UnterBuffer ;;-------                (display-buffer-in-side-window)  ;;--------
 ;; UnterBuffer ;;-------                (inhibit-same-window . t)        ;;--------
 ;; UnterBuffer ;;-------                (window-height . 0.2)))          ;;--------

          ;; Fuzzy matching for everything
          (setq helm-M-x-fuzzy-match t
                helm-recentf-fuzzy-match t
                helm-buffers-fuzzy-matching t
                helm-locate-fuzzy-match nil
                helm-mode-fuzzy-match t)

          ;; Make helm fuzzier
          (use-package helm-fuzzier
            :ensure t
            :config
            (helm-fuzzier-mode 1))

          ;; Add support for flx
          (use-package helm-flx
            :ensure t
            :config
            (helm-flx-mode 1))

          ;; to search in projects - the silver searcher
          (use-package helm-ag
            :ensure t
            :bind* (("M-m g s" . helm-do-ag-project-root)
                    ("M-m g e" . helm-do-ag)))

;;==================================================================================================
;; :bind (("C-s" . helm-swoop-without-pre-input))
;;  Error (use-package): helm-swoop/:catch: Key sequence M-h S start w. non-prefix key M-h
;;==================================================================================================
  (use-package helm-swoop
    :ensure t
    :bind* (("M-h s"   . helm-swoop)
            ("M-h g /" . helm-multi-swoop)
            ("M-h o /" . helm-multi-swoop-org)
            ("M-h G" . helm-multi-swoop-all))
    :init
    (setq helm-swoop-split-with-multiple-windows nil
          helm-swoop-split-direction 'split-window-vertically
          helm-swoop-split-window-function 'helm-default-display-buffer))


      ;; List errors with helm
      (use-package helm-flycheck
                   :ensure t
                   :bind* (("M-h y" . helm-flycheck)))

      ;; Flyspell Albert??? errors with helm
      (use-package helm-flyspell
                   :ensure t
                   :bind* (("M-h w" . sk/helm-correct-word))
                   :config
                   (defun sk/helm-correct-word ()
                     (interactive)
                     (save-excursion
                       (sk/flyspell-goto-previous-error 1)
                       (helm-flyspell-correct))))
;;===========HYDRA===================================================================
(use-package hydra
             :defer t
             :config
             (when (or (eq (car custom-enabled-themes) 'base16-hopscotch-dark)
                       (eq (car custom-enabled-themes) 'sanityinc-tomorrow-eighties))
               (set-face-attribute 'hydra-face-blue nil :foreground "#6699cc")))

 ;; WoZu? ;;--------------  ;; Hydra-helm-github
 ;; WoZu? ;;--------------  (defhydra hydra-helm-github (:color blue)
 ;; WoZu? ;;--------------            "GitHub"
 ;; WoZu? ;;--------------            ("c" helm-open-github-from-commit "commit")
 ;; WoZu? ;;--------------            ("f" helm-open-github-from-file "file")
 ;; WoZu? ;;--------------            ("i" helm-open-github-from-issues "issue")
 ;; WoZu? ;;--------------            ("p" helm-open-github-from-pull-requests "pull request")
 ;; WoZu? ;;--------------            ("s" helm-github-stars "starred repo"))
 ;; WoZu? ;;--------------  ;; Key Bindings
 ;; WoZu? ;;--------------  (bind-key "g" #'hydra-helm-github/body helm-command-map)
 ;; WoZu? ;;--------------  (bind-key "M-o" #'helm-previous-source helm-map)

;; Variables
(setq helm-truncate-lines t))

;; Hydra
(defhydra hydra-scroll ()
          "Scroll"
          ("<" scroll-left "left")
          (">" scroll-right "right"))

;; Key Bindings
(global-set-key (kbd "C-x <") #'hydra-scroll/body)
(global-set-key (kbd "C-x >") #'hydra-scroll/body)

;; Hydra
(defhydra hydra-search (:color blue)
          "Search"
          ("g" google "Google")
          ("s" startpage "StartPage")
          ("t" thesaurus "Thesaurus")
          ("u" urbandictionary "Urbandictionary")
          ("d" wiktionary "Wiktionary")
          ("w" wikipedia "Wikipedia")
          )

; Key Bindings ???
(global-set-key (kbd "C-c s") #'hydra-search/body)
;;==================================================================================================
;;==================================================================================================
;;==================================================================================================
;;==================================================================================================
;;==================================================================================================

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; base  (global-set-key
;; base   (kbd "C-1")
;; base   (defhydra
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;YES YES YES YES YES YES YES YES YES YES YES YES YES YES YES YES YES ;;
;;
(defun new-frame-with-scratch ()
  "Open a new frame with scratch buffer selected"
  (interactive)
  (let ((frame (make-frame))
        (scratch-name "*lawlist*"))
    (select-frame-set-input-focus frame)
    (unless (get-buffer scratch-name)
      (with-current-buffer (get-buffer-create scratch-name)
                           (text-mode)))
    (switch-to-buffer scratch-name 'norecord)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun exwm-async-run (name)
  (interactive)
  (start-process name nil name))

(defun launch-gnote ()
  (interactive)
  (exwm-async-run "gnote"))

(defun launch-browser ()
  (interactive)
  (exwm-async-run "chromium-browser"))

;;(global-set-key  (kbd "<f5>") 'launch-browser)
;;(global-set-key  (kbd "<f4>") 'launch-gnote)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defun config-init-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-1") 'config-init-visit)
;;----------------------------------------------
(global-set-key
  (kbd "<f1>")
  (defhydra hydra-navi ()
            ("f" find-file "find")
            ("e" eval-buffer "evil")

            ("j" win-resize-minimize-horiz "up" )
            ("k" win-resize-enlarge-horiz "down" )
            ("h" win-resize-enlarge-vert "lft")
            ("l" win-resize-minimize-vert "rght")

            ("o" other-window "other")
            ("w" delete-other-windows "del-o-w")

            ("s" split-window-below "h-sp")
            ("v" split-window-right "v-sp")

            ("u" winner-undo "w-u" )
            ("r" winner-redo "w-r" )

            ("q" quit-window "q" )
            ("d" ido-kill-buffer "kill")
            ("x" delete-window "x-W")

            ("z" text-scale-increase "in")
            ("m" text-scale-decrease "out")

            ("n" scratch "scratch")
            ("i" info "i")
            ("a" apropos "apropos")

            ("p" ag-regexp "ag-regexp")
            ("c" counsel-M-x  "counsel-M-x")
            ("g" keyboard-quit "C-g")
            )
  )
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; =============================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(require 'hydra)
(global-set-key
  (kbd "C-2")
  (defhydra hydra-apropos (:color blue
                                  :hint nil)
  "
_a_propos        _c_ommand
_d_ocumentation  _l_ibrary
_v_ariable       _u_ser-option
^ ^  _i_nfo    valu_e_"
  ("a" apropos)
  ("v" apropos-variable)
  ("c" apropos-command)
  ("l" apropos-library)
  ("u" apropos-user-option)
  ("i" info)
  ("d" apropos-documentation)
  ("e" apropos-value))
  )
;;
;; Recommended binding:
;; (global-set-key (kbd "C-c h") 'hydra-apropos/body)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;

(global-set-key
 (kbd "C-3")
 (defhydra hydra-splitter ()
  "splitter"
  ("h" win-resize-enlarge-horiz  )
  ("j" win-resize-minimize-horiz )
  ("k" win-resize-enlarge-vert)
  ("l" win-resize-minimize-vert))
)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;

(global-set-key
  (kbd "C-4")
  (defhydra launchers (:color blue)
    "Launchers"
    ("c" calc "Calc")
    ("d" ediff-buffers "ediff")
    ("f" find-dired "find-dired")
    ("g" lgrep "lgrep")
    ("G" rgrep "rgrep")
    ("h" man "man")
    ("s" eshell-here "eshell")
    ("t" git-timemachine "git timemachine")
    ("a" magit-status "magit-status")
    ("p" sql-postgres "sql-postgres")
    ("w" whitespace-mode "toggle whitespaces")
    ("." ck-put-file-name-wo-path-on-clipboard "copy filename to clipboard")
    (":" ck-put-file-name-on-clipboard "copy filename with full path to clipboard"))
)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defun hydra-vi/pre ()
  (set-cursor-color "#e52b50"))

(defun hydra-vi/post ()
  (set-cursor-color "#ffffff"))
(global-set-key
  (kbd "C-5")
  (defhydra hydra-vi (:pre hydra-vi/pre :post hydra-vi/post :color amaranth)
            "vi"
            ("l" forward-char)
            ("h" backward-char)
            ("j" next-line)
            ("k" previous-line)
            ("m" set-mark-command "mark")
            ("a" move-beginning-of-line "beg")
            ("e" move-end-of-line "end")
            ("d" delete-region "del" :color blue)
            ("y" kill-ring-save "yank" :color blue)
            ("q" nil "quit"))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; C-x b   ivy-switch-buffer
;; next ivy-switch-buffer
;; next undo-tree-visualize
;;--------------
;; ("i" info "i")
;; ("a" apropos "apropos")
;; ("p" apropos-documentation "apropos-d")
;; ("t" scratch "scratch")
;; ("n" new-frame-with-scratch "scratch")
;; ("u"describe-language-environment "dle")
;; ("y"view-emacs-FAQ               "FAQ")
;; ("p"display-local-help           "local-help")
;; ("b" set-background-color "bgc")
;;--------------
;; winner-undo
;; split-window-below
;; split-window-right
;; delete-window
;; delete-other-windows
;;--------------
;; no  enriched-mode
;; no  ("s" add-text-property  "add bold")
;; no  ("t" put-text-property  "put bold")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defhydra sk/hydra-of-activate (:color blue
                                :hint nil)
  "
 _b_: battery   _n_: number       _v_: wrap        _c_: column    _i_: indent        _k_: which-key   _l_: talk       _q_: quit
 _t_: time      _w_: weather      _y_: yasnippet   _m_: margin    _s_: smartparens   _o_: org extras  _j_: jabber
 _f_: flyspell  _a_: auto-comp    _d_: fold        _g_: ggtags    _p_: paradox       _e_: error       _h_: html emmet
"
  ("b" fancy-battery-mode :color red)
  ("t" display-time-mode :color red)
  ("n" linum-mode :color red)
  ("w" wttrin)
  ("f" flyspell-mode)
  ("v" visual-line-mode)
  ("p" list-packages)
  ("c" column-enforce-mode)
  ("y" yas-global-mode)
  ("a" company-mode)
  ("i" highlight-indentation-mode)
  ("m" fci-mode :color red)
  ("j" jabber-connect :color red)
  ("l" jabber-chat-with)
  ("o" sk/org-custom-load :color blue)
  ("g" ggtags-mode)
  ("d" global-origami-mode)
  ("k" which-key-mode)
  ("s" smartparens-strict-mode)
  ("h" emmet-mode)
  ("e" global-flycheck-mode)
  ("q" nil :color blue))

(bind-keys*
  ("M-m g a" . sk/hydra-of-activate/body))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(set-background-color "sienna1")  

