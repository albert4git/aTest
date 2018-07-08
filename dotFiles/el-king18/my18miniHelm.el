;;::===================HELM=========================================
  (use-package helm
    :bind (
           ("M-<f5>" . helm-find-files)
           ([f10] . helm-buffers-list)
           ([S-f10] . helm-recentf)
          )
  )
;;==================================================================================================
(set-background-color "pink")


;;==================================================================================================
;; xx-  (use-package helm
;; xx-               :defer 5
;; xx-               :bind (("C-c k" . helm-show-kill-ring)
;; xx-                      ("C-c SPC" . helm-all-mark-rings))
;; xx-               :config
;; xx-               (use-package helm-config
;; xx-                            :ensure helm)
;;==================================================================================================
