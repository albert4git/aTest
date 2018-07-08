;; =============================================================================
;; =============================================================================
(setq-default tab-width 4)
(setq-default tab-stop-list
              '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
;; =============================================================================

(use-package rainbow-mode
             :ensure t
             :init
             (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package rainbow-delimiters
             :ensure t
             :init
             (progn
               (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(provide 'setup-rainbow-delimiters)

(custom-set-faces
  '(rainbow-delimiters-depth-1-face ((t (:foreground "red4" :height 1.25))))
  '(rainbow-delimiters-depth-2-face ((t (:foreground "red3" :height 1.2))))
  '(rainbow-delimiters-depth-3-face ((t (:foreground "red2" :height 1.15))))
  '(rainbow-delimiters-depth-4-face ((t (:foreground "red1" :height 1.1))))
  '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta" :height 1.05))))
  '(rainbow-delimiters-depth-6-face ((t (:foreground "green2" :height 1.0))))
  '(rainbow-delimiters-depth-7-face ((t (:foreground "green4" :height 0.95))))
  '(rainbow-delimiters-depth-8-face ((t (:foreground "blue4" :height 0.9))))
  '(rainbow-delimiters-depth-9-face ((t (:foreground "gray20" :height 0.85))))
  '(rainbow-delimiters-unmatched-face ((t (:background "cyan" :height 1))))
  )


;; ==============ParenOK=================================================
(use-package paren
             :init (show-paren-mode t))

(setq show-paren-style 'mixed)
(setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)


;;================================================================================================
(use-package beacon
             :ensure t
             :config
             (beacon-mode 1)
             (setq beacon-color "#666600")
             )


;; =============================================================================
(set-face-attribute 'mode-line nil
                    :foreground "White"
                    :background "green"
                    :box t)

;; =============================================================================
;;
;;___POWER__line____
(use-package powerline
  :ensure t
)

;; =============================================================================
;;(require 'micgoline)
(require 'powerline)
(powerline-center-theme)
(setq powerline-default-separator 'slant)
(setq powerline-arrow-shape 'arrow) 

;; =============================================================================
;; firebrick3            firebrick3
;; indian red            indian red
;; sienna                sienna
;; peru                  peru
;; burlywood             burlywood
;; beige                 beige
;; wheat                 wheat
;; sandy brown           sandy brown
;; tan                   tan
;; chocolate             chocolate
;; firebrick             firebrick
;; brown                 brown
;; dark salmon           dark salmon
;; salmon                salmon
;; light salmon          light salmon
;; orange                orange
;; dark orange           dark orange
;; coral                 coral
;; light coral           light coral
;; tomato                tomato
;; orange red            orange red
;; red                   red
;; hot pink              hot pink
;; deep pink             deep pink
;; =============================================================================
