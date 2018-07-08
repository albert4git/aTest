
(use-package projectile
             :ensure t
             :bind* (("M-m SPC d"   . projectile-find-file)
                     ("M-m SPC D"   . projectile-switch-project)
                     ("M-m SPC TAB" . projectile-find-other-file))
             :init
             (setq projectile-file-exists-remote-cache-expire (* 10 60))
             :diminish projectile-mode
             :config
             (projectile-global-mode))

  (global-set-key (kbd "<f5>") 'projectile-compile-project)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Projectile  ;;   Projectile  ;;   Projectile  ;;   Projectile  ;;     Projectile  ;;     Projectile  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  (use-package projectile
;;    :ensure t
;;    :init
;;      (projectile-mode 1))
;;
;;This is your new startup screen, together with projectile it works in unison and
;;provides you with a quick look into your latest projects and files.
;;Change the welcome message to whatever string you want and
;;change the numbers to suit your liking, I find 5 to be enough.
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  (use-package dashboard
;;    :ensure t
;;    :config
;;      (dashboard-setup-startup-hook)
;;      (setq dashboard-startup-banner "~/.emacs.d/img/dashLogo.png")
;;      (setq dashboard-items '((recents  . 5)
;;                              (projects . 5)))
;;      (setq dashboard-banner-logo-title ""))

(set-background-color "IndianRed4")  
