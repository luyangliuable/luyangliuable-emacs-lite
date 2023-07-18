;; Enable package management
(require 'package)
(setq package-enable-at-startup nil) ; Avoid initializing twice
(setq image-types '(svg png gif tiff jpeg xpm xbm pbm))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(require 'evil)
(require 'evil-leader)
(require 'treemacs)
(require 'which-key)

(tool-bar-mode -1)
(evil-mode 1)

;; configure which key
(which-key-setup-side-window-bottom)

;; Configure Treemacs keybinding
(which-key-add-key-based-replacements "SPC f" "Files")

;; Set space as the leader key
(setq evil-leader/leader "SPC")
(global-evil-leader-mode)

;; Bind space f t to toggle Treemacs
(evil-leader/set-key "ft" 'treemacs)

(defun switch-to-previous-buffer ()
  "Switch to the previous buffer and make the current buffer the 'other buffer'."
  (interactive)
  (let ((prev-buffer (other-buffer (current-buffer) t)))
    (if prev-buffer
        (progn
          (switch-to-buffer prev-buffer)
          (set-window-prev-buffers (selected-window) (list (current-buffer)))))
    (message "Previous buffer not found.")))

(defun split-window-right (&optional size)
  "Split the selected window into two side-by-side windows.
The selected window is on the left.  The newly split-off window
is on the right and displays the same buffer.  Return the new
window.

If optional argument SIZE is omitted or nil, both windows get the
same width, or close to it.  If SIZE is positive, the left-hand
\(selected) window gets SIZE columns.  If SIZE is negative, the
right-hand (new) window gets -SIZE columns.  Here, SIZE includes
the width of the window's scroll bar; if there are no scroll
bars, it includes the width of the divider column to the window's
right, if any."
  (interactive "P")
  (let ((old-window (selected-window))
	(size (and size (prefix-numeric-value size)))
	new-window)
    (when (and size (< size 0) (< (- size) window-min-width))
      ;; `split-window' would not signal an error here.
      (error "Size of new window too small"))
    (setq new-window (split-window nil size t))
    ;; Always copy quit-restore parameter in interactive use.
    (let ((quit-restore (window-parameter old-window 'quit-restore)))
      (when quit-restore
	(set-window-parameter new-window 'quit-restore quit-restore)))
    new-window))



(evil-leader/set-key "TAB" 'switch-to-previous-buffer)

;; Window bindings
(evil-leader/set-key "w V" 'split-window-right)
(evil-leader/set-key "w l" 'evil-window-right)
(evil-leader/set-key "w h" 'evil-window-left)
(evil-leader/set-key "w k" 'evil-window-up)
(evil-leader/set-key "w j" 'evil-window-down)
