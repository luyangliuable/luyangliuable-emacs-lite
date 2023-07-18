;; configure which key
(which-key-setup-side-window-bottom)

;; Configure Treemacs keybinding
(which-key-add-key-based-replacements "SPC f" "Files")

;; Set space as the leader key
(setq evil-leader/leader "SPC")
(global-evil-leader-mode)

;; Bind space f t to toggle Treemacs
(evil-leader/set-key "ft" 'treemacs)


(evil-leader/set-key "TAB" 'switch-to-previous-buffer)

;; Window bindings
(evil-leader/set-key "w V" 'split-window-right)
(evil-leader/set-key "w l" 'evil-window-right)
(evil-leader/set-key "w h" 'evil-window-left)
(evil-leader/set-key "w k" 'evil-window-up)
(evil-leader/set-key "w j" 'evil-window-down)
