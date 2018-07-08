;; xx-
;; xx-
;; xx-  (use-package molokai-theme 
;; xx-    :ensure t
;; xx-    :init
;; xx-    (setq molokai-theme-kit t)
;; xx-    (load-theme 'molokai t)
;; xx-    )
;; xx-
;; xx-
;; xx-
;; xx-
;;==============================================================================
;;==============================================================================
;;==============================================================================

 (require 'doom-themes)
 ;; Global settings (defaults)
 (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
       doom-themes-enable-italic t) ; if nil, italics is universally disabled
 ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
 ;; (load-theme 'doom-one t)
 ;; (load-theme 'doom-nord t)
 ;; (load-theme 'doom-one-light t)
 ;; (load-theme 'doom-solarized-light t)
  (load-theme 'doom-opera-light t)
 ;; (load-theme 'doom-city-lights t)
 ;; Enable flashing mode-line on errors
 (doom-themes-visual-bell-config)
 ;; Enable custom neotree theme
 (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!
 ;; Corrects (and improves) org-mode's native fontification.
 (doom-themes-org-config)
;;==============================================================================
;;==============================================================================
;;(defun my-set-theme-on-mode ()
;;  "set background color depending on file suffix"
;;  (interactive)
;;  (let ((fileNameSuffix (file-name-extension (buffer-file-name) ) ))
;;    (cond
;;     ((string= fileNameSuffix "el" ) (set-background-color "honeydew"))
;;     ((string= fileNameSuffix "org" ) (set-background-color "pink"))
;;     ((string= fileNameSuffix "txt" ) (set-background-color "cornsilk"))
;;     (t (message "%s" "no match found"))
;;     )
;;    ))
;; (add-hook 'find-file-hook 'my-set-theme-on-mode)
;; =============================================================================
;; =============================================================================
   (set-face-foreground 'font-lock-string-face "navy")
   (set-face-background 'font-lock-string-face "misty rose")
;; =============================================================================

    (make-face-bold 'font-lock-variable-name-face)
    (make-face-bold 'font-lock-keyword-face)
    (make-face-bold 'font-lock-function-name-face)
    (make-face-bold 'font-lock-type-face)
    (make-face-bold 'font-lock-builtin-face)
    (make-face-bold 'font-lock-comment-face)
    (make-face-bold 'font-lock-string-face)
    (make-face-bold 'font-lock-comment-delimiter-face)
    (make-face-bold 'font-lock-constant-face)

;; =============================================================================
(custom-set-faces
  '(linum ((t (:inherit shadow :background "coral"))))
 )
;; =============================================================================
(use-package hl-line
             :init (global-hl-line-mode t))
(set-face-background 'hl-line "aquamarine")

;; =============================================================================
;; =============================================================================
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
