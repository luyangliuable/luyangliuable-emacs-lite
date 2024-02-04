(use-package link-hint :ensure t :defer t)

;; Keybindings
(evil-leader/set-key "x o" 'link-hint-open-link-at-point)
(evil-leader/set-key "x y" 'link-hint-copy-link-at-point)
(evil-leader/set-key "x a" 'link-hint-open-all-links)
