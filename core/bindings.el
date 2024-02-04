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
(evil-leader/set-key "w S" 'split-window-below-and-focus)
(evil-leader/set-key "w d" 'delete-window)

;; Move between window bindings
(evil-leader/set-key "w l" 'evil-window-right)
(evil-leader/set-key "w h" 'evil-window-left)
(evil-leader/set-key "w k" 'evil-window-up)
(evil-leader/set-key "w j" 'evil-window-down)
(evil-leader/set-key "b s" 'switch-to-scratch)

;; Buffers
(evil-leader/set-key "w m" 'toggle-maximize-buffer)
(evil-leader/set-key "b d" 'my-kill-this-buffer)
(evil-leader/set-key "f e R" 'eval-buffer)
(evil-leader/set-key "f e d" 'open-my-init-file)

(evil-leader/set-key "f y d" 'copy-directory-path)
(evil-leader/set-key "f y y" 'copy-file-path)

(evil-leader/set-key "w L" 'evil-window-move-far-right)
(evil-leader/set-key "w H" 'evil-window-move-far-left)

;; Line Number
(evil-leader/set-key "t n r" 'enable-relative-line-no)

;; Mode Line
(evil-leader/set-key "t m T" 'toggle-mode-line)
(evil-leader/set-key "t m p" 'show-active-minor-mode-list)


;; Save current file while in normal mode and RET.
(define-key evil-normal-state-map (kbd "<RET>") 'save-buffer)


(setq mode-line-format (list (when (vc-registered (buffer-file-name)) (vc-mode vc-mode))))

(let ((standard-mode-line-format
       (list "%e"
	     "%l"
	     'mode-line-front-space
	     'mode-line-mule-info
	     'mode-line-client
	     'mode-line-modified
	     'mode-line-remote
	     'mode-line-frame-identification
	     'mode-line-buffer-identification
	     "   "
	     'mode-line-position
	     '(vc-mode vc-mode)
	     "  "
	     'mode-line-modes
	     'mode-line-misc-info
	     'mode-line-end-spaces)))
  (setq mode-line-format standard-mode-line-format))

(setq mode-line-format (list mode-line-modes))
