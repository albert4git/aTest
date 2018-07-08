;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;    MyNavi     ;;;    MyNavi       ;;;    MyNavi       ;;;    MyNavi      ;;;    MyNavi      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
(use-package transpose-frame
             :ensure transpose-frame)

;;=============================================================================
;; (defconst window-safe-min-height 1)
;; (defconst window-min-height 3 )
;;=============================================================================

(defun prev-window ()
  (interactive)
  (other-window -1))

;;=============================================================================
(defun win-resize-top-or-bot ()
  (let* ((win-edges (window-edges))
         (this-window-y-min (nth 1 win-edges))
         (this-window-y-max (nth 3 win-edges))
         (fr-height (frame-height)))
    (cond
      ((eq 0 this-window-y-min) "top")
      ((eq (- fr-height 1) this-window-y-max) "bot")
      (t "mid"))))

(defun win-resize-left-or-right ()
  (let* ((win-edges (window-edges))
         (this-window-x-min (nth 0 win-edges))
         (this-window-x-max (nth 2 win-edges))
         (fr-width (frame-width)))
    (cond
      ((eq 0 this-window-x-min) "left")
      ((eq (+ fr-width 4) this-window-x-max) "right")
      (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
    ((equal "top" (win-resize-top-or-bot)) (enlarge-window -60))
    ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 60))
    ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -60))
    (t (message "nil")))
  (other-window 1)
  )

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
    ((equal "top" (win-resize-top-or-bot)) (enlarge-window 60))
    ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -60))
    ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 60))
    (t (message "nil")))
  (other-window -1)
  )

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
    ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -10))
    ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 10))
    ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -10))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
    ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 10))
    ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -10))
    ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 10))))

;;=============================================================================
(global-set-key [s-down] 'win-resize-enlarge-horiz)
(global-set-key [s-up] 'win-resize-minimize-horiz)
(global-set-key [s-left] 'win-resize-enlarge-vert)
(global-set-key [s-right] 'win-resize-minimize-vert)

;;=============================================================================
(use-package windmove :ensure t
  :bind ("<C-s-left>" . windmove-left)
        ("<C-s-right>" . windmove-right)
        ("<C-s-up>" . windmove-up)
        ("<c-s-down>" . windmove-down))

;;=============================================================================
(global-set-key (kbd "<M-s-up>")      'shrink-window)  
(global-set-key (kbd "<M-s-down>")    'enlarge-window)  
(global-set-key (kbd "<M-s-right>")   'shrink-window-horizontally)  
(global-set-key (kbd "<M-s-left>")    'enlarge-window-horizontally) 

;;=============================================================================
(use-package goto-chg
             :ensure t
             :config
             ; ensure that even in worst case some goto-last-change is available
             (global-set-key [(control meta .)] 'goto-last-change)
             )

;;========================================================================================;;
;; xxx https://github.com/wasamasa/shackle
;; xxx (setq shackle-default-rule '(:same t))
;; xxx (setq shackle-rules '((compilation-mode :noselect t))
;; xxx       shackle-default-rule '(:select t))
;; xxx (setq helm-display-function 'pop-to-buffer) ; make helm play nice
;; xxx (setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4)))
;;========================================================================================;;

(set-background-color "gray80") 
