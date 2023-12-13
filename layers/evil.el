;; For some reason `evil-leader-mode` is disable in *Messages* and *Scratch* leading to SPC to not work.

(defun callback-for-all-buffers ()
  "Special run hook for all buffers."
    (evil-leader-mode 1))

(add-hook 'buffer-list-update-hook 'callback-for-all-buffers)

;; Enable evil mode
(evil-mode 1)
(evil-leader-mode 1)
