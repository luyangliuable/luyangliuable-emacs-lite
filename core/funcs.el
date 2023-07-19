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

(defun lemacs--file-path ()
  "Retrieve the file path of the current buffer.

Returns:
  - A string containing the file path in case of success.
  - `nil' in case the current buffer does not have a directory."
  (when-let (file-path (buffer-file-name))
    (file-truename file-path)))

(defun copy-file-path ()
  "Copy and show the file path of the current buffer."
  (interactive)
  (if-let (file-path (lemacs--file-path))
      (progn
        (kill-new file-path)
        (message "%s" file-path))
    (message "WARNING: Current buffer is not attached to a file!")))




(byte-compile 'lemacs--directory-path)



(defun open-my-init-file ()
  "Open the user's Emacs init file."
  (interactive)
  (let* ((default-init "~/luyangliuable-emacs-lite/init.el")
	 (alt-init "~/emacs-plain/.emacs.d/init.el")
	 (init-file (if (file-exists-p default-init) default-init alt-init)))
    (if (file-exists-p init-file)
	(find-file init-file)
      (message "No init file found at either %s or %s" default-init alt-init))))
