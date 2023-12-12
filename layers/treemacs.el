(defun treemacs-toggle-follow-mode ()
  "Toggle treemacs-follow-mode."
  (interactive)
  (if treemacs-follow-mode
      (setq treemacs-follow-mode nil)
    (setq treemacs-follow-mode t))
  (message "Treemacs follow mode: %s" (if treemacs-follow-mode "enabled" "disabled")))

;; Stolen from spacemacs
(defun treemacs-delete-file (&optional arg)
  "Delete node at point.
A delete action must always be confirmed.  Directories are deleted recursively.
By default files are deleted by moving them to the trash.  With a prefix ARG
they will instead be wiped irreversibly."
  (interactive "P")
  (treemacs-block
   (treemacs-unless-let (btn (treemacs-current-button))
       (treemacs-pulse-on-failure "Nothing to delete here.")
     (treemacs-error-return-if (not (memq (treemacs-button-get btn :state)
                                          '(file-node-open file-node-closed dir-node-open dir-node-closed)))
       "Only files and directories can be deleted.")
     (treemacs--without-filewatch
      (let* ((delete-by-moving-to-trash (not arg))
             (path (treemacs--select-file-from-btn btn "Delete: "))
             (file-name (propertize (treemacs--filename path) 'face 'font-lock-string-face)))
        (cond
         ((file-symlink-p path)
          (if (y-or-n-p (format "Remove link '%s -> %s' ? "
                                   file-name
                                   (propertize (file-symlink-p path) 'face 'font-lock-face)))
              (delete-file path delete-by-moving-to-trash)
            (treemacs-return (treemacs-log "Cancelled."))))
         ((file-regular-p path)
          (if (y-or-n-p (format "Delete '%s' ? " file-name))
              (delete-file path delete-by-moving-to-trash)
            (treemacs-return (treemacs-log "Cancelled."))))
         ((file-directory-p path)
          (if (y-or-n-p (format "Recursively delete '%s' ? " file-name))
              (delete-directory path t delete-by-moving-to-trash)
            (treemacs-return (treemacs-log "Cancelled."))))
         (t
          (treemacs-error-return
              (treemacs-pulse-on-failure
                  "Item is neither a file, a link or a directory - treemacs does not know how to delete it. (Maybe it no longer exists?)"))))
        (treemacs--on-file-deletion path)
        (treemacs-without-messages
         (treemacs-run-in-every-buffer
          (treemacs-delete-single-node path)))
        (run-hook-with-args 'treemacs-delete-file-functions path)
        (treemacs-log "Deleted %s."
          (propertize path 'face 'font-lock-string-face))))
     (treemacs--evade-image))))
(defalias 'treemacs-delete #'treemacs-delete-file)
(make-obsolete #'treemacs-delete #'treemacs-delete-file "v2.9.3")

;; Keybindings for Evil mode
(evil-define-key 'normal treemacs-mode-map
    (kbd "tf") 'treemacs-toggle-follow-mode
    (kbd "tt") 'treemacs
    (kbd "R") 'treemacs-rename-file
    (kbd "d") 'treemacs-delete-file
    (kbd "tn") 'treemacs-create
    (kbd "ta") 'treemacs-add-project-to-workspace
    (kbd "tc") 'treemacs-collapse-all
    (kbd "ts") 'treemacs-visit-node-horizontal-split
    (kbd "tS") 'treemacs-visit-node-vertical-split
    (kbd "to") 'treemacs-select-window
    (kbd "tg") 'treemacs-project-goto)
