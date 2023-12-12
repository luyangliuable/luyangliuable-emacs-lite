(defun open-my-init-file ()
  "Open the user's Emacs init file."
  (interactive)
  (let* ((default-init "~/luyangliuable-emacs-lite/init.el")
	 (alt-init "~/emacs-plain/.emacs.d/init.el")
	 (init-file (if (file-exists-p default-init) default-init alt-init)))
    (if (file-exists-p init-file)
	(find-file init-file)
      (message "No init file found at either %s or %s" default-init alt-init))))
