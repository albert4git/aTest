(use-package dired
   :hook (dired-mode . dired-hide-details-mode)
   :init
   (setq dired-dwim-target t
         dired-recursive-copies 'top
         dired-recursive-deletes 'top
         dired-listing-switches "-alh"))

 (use-package dired-x
   :commands
   (dired-jump))

(use-package image+ :ensure t :after 'image-mode
  :init (add-hook 'image-mode-hook '(lambda () (require 'image+)))
  :config (bind-keys :map image-mode-map
             ("0" . imagex-sticky-restore-original)
             ("+" . imagex-sticky-maximize)
             ("=" . imagex-sticky-zoom-in)
             ("-" . imagex-sticky-zoom-out)))

 (use-package doc-view
   :hook ((doc-view-mode . doc-view-fir-page-to-window)
          (doc-view-minor-mode . doc-view-fir-page-to-window))
   :init
   (setq doc-view-continuous t))


  (use-package vc
	:init
	(setq vc-make-backup-files t
		  vc-follow-symlinks t))