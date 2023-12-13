(defun switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun my-kill-this-buffer (&optional arg)
  "Kill the current buffer.
If the universal prefix argument is used and it's not the sole window, then kill the buffer and the window.
Otherwise, just kill the buffer and switch to the previous buffer."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (condition-case err
        (progn
          (if (and (equal '(4) arg) (> (length (window-list)) 1))
              (kill-buffer-and-window)
            (kill-buffer))
          (unless (one-window-p t)
            (switch-to-prev-buffer (get-buffer-window) 1)))
      (error (switch-to-buffer (other-buffer (current-buffer)))
             (message "Failed to kill buffer due to error: %s, switched to previous buffer instead." (error-message-string err))))))
