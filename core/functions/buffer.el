(defun lemacs--directory-path ()
  "Retrieve the directory path of the current buffer.

If the buffer is not visiting a file, use the `list-buffers-directory' variable
as a fallback to display the directory, useful in buffers like the ones created
by `magit' and `dired'.

Returns:
  - A string containing the directory path in case of success.
  - `nil' in case the current buffer does not have a directory."
  (when-let (directory-name (if-let (file-name (buffer-file-name))
                                (file-name-directory file-name)
                              list-buffers-directory))
    (file-truename directory-name)))


(defun lemacs--file-path ()
  "Retrieve the file path of the current buffer.

Returns:
  - A string containing the file path in case of success.
  - `nil' in case the current buffer does not have a directory."
  (when-let (file-path (buffer-file-name))
    (file-truename file-path)))

(defun copy-directory-path ()
  "Copy and show the directory path of the current buffer.

If the buffer is not visiting a file, use the `list-buffers-directory'
variable as a fallback to display the directory, useful in buffers like the
ones created by `magit' and `dired'."
  (interactive)
  (if-let (directory-path (lemacs--directory-path))
      (progn
	(kill-new directory-path)
	(message "%s" directory-path))
    (message "WARNING: Current buffer does not have a directory!")))

(defun copy-file-path ()
  "Copy and show the file path of the current buffer."
  (interactive)
  (if-let (file-path (lemacs--file-path))
      (progn
        (kill-new file-path)
        (message "%s" file-path))
    (message "WARNING: Current buffer is not attached to a file!")))

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
	      (kill-buffer-and-window
	       (car (cl-remove-if-not (lambda (b)
					(and (string-match-p "ein" (buffer-name b))
					     (string-match-p "notebooklist" (buffer-name b))))
				      (buffer-list))))
	    (kill-buffer
	     (car (cl-remove-if-not (lambda (b)
				      (and (string-match-p "ein" (buffer-name b))
					   (string-match-p "notebooklist" (buffer-name b))))
				    (buffer-list)))))
	  (unless (one-window-p t)
	    (switch-to-prev-buffer (get-buffer-window) 1)))
      (error (switch-to-buffer (other-buffer (current-buffer)))
	     (message "Failed to kill buffer due to error: %s, switched to previous buffer instead." (error-message-string err))))))


(defun show-all-buffers ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (insert (concat "Buffers:\n" (mapconcat (function buffer-name) (buffer-list) " "))))
