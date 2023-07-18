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
(evil-leader/set-key "w v" 'split-window-right)
(evil-leader/set-key "w V" 'split-window-right-and-focus)
(evil-leader/set-key "w s" 'split-window-below)
(evil-leader/set-key "w S" 'split-window-below-and-focus)

(evil-leader/set-key "w l" 'evil-window-right)
(evil-leader/set-key "w h" 'evil-window-left)
(evil-leader/set-key "w k" 'evil-window-up)
(evil-leader/set-key "w j" 'evil-window-down)
(evil-leader/set-key "b s" 'switch-to-scratch)

(evil-leader/set-key "w m" 'toggle-maximize-buffer)
(evil-leader/set-key "b d" 'kill-this-buffer)
(evil-leader/set-key "e R" 'eval-buffer)
(evil-leader/set-key "e D" 'eval-buffer)

(evil-leader/set-key "w L" 'evil-window-move-far-right)
(evil-leader/set-key "w H" 'evil-window-move-far-left)

(evil-leader/set-key "t n r" 'enable-relative-line-no)
