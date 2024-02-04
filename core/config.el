(defun enable-relative-line-no ()
  (interactive)
  (setq display-line-numbers-type 'relative)
  (display-line-numbers-mode))

(defvar-local mode-line-rflog nil "Toggle switch for mode-line display.")

;; Enable modes
(which-key-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defun toggle-mode-line ()
  "Toggle Emacs modeline.
https://emacs.stackexchange.com/questions/74789/toggle-the-display-of-the-mode-line"
  (interactive)
  (if mode-line-format
      (setq mode-line-format nil)
    (setq mode-line-format (default-value 'mode-line-format)))
  ;; Todo force-mode-line-update not working after 2nd time
  (force-mode-line-update t)
  (force-mode-line-update)
  (message "Mode line: %s" (if mode-line-format "enable" "disabled")))

(evil-leader/set-key "t m T" 'toggle-mode-line)
