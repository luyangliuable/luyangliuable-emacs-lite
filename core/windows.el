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


(defun split-window-below (&optional size)
  "Split the selected window into two windows, one above the other.
The selected window is above.  The newly split-off window is
below and displays the same buffer.  Return the new window.

If optional argument SIZE is omitted or nil, both windows get the
same height, or close to it.  If SIZE is positive, the upper
\(selected) window gets SIZE lines.  If SIZE is negative, the
lower (new) window gets -SIZE lines.

If the variable `split-window-keep-point' is non-nil, both
windows get the same value of point as the selected window.
Otherwise, the window starts are chosen so as to minimize the
amount of redisplay; this is convenient on slow terminals."
  (interactive "P")
  (let ((old-window (selected-window))
	(old-point (window-point))
	(size (and size (prefix-numeric-value size)))
        moved-by-window-height moved new-window bottom)
    (when (and size (< size 0) (< (- size) window-min-height))
      ;; `split-window' would not signal an error here.
      (error "Size of new window too small"))
    (setq new-window (split-window nil size))
    (unless split-window-keep-point
      (with-current-buffer (window-buffer)
	;; Use `save-excursion' around vertical movements below
	;; (Bug#10971).  Note: When the selected window's buffer has a
	;; header line, up to two lines of the buffer may not show up
	;; in the resulting configuration.
	(save-excursion
	  (goto-char (window-start))
	  (setq moved (vertical-motion (window-height)))
	  (set-window-start new-window (point))
	  (when (> (point) (window-point new-window))
	    (set-window-point new-window (point)))
	  (when (= moved (window-height))
	    (setq moved-by-window-height t)
	    (vertical-motion -1))
	  (setq bottom (point)))
	(and moved-by-window-height
	     (<= bottom (point))
	     (set-window-point old-window (1- bottom)))
	(and moved-by-window-height
	     (<= (window-start new-window) old-point)
	     (set-window-point new-window old-point)
	     (select-window new-window))))
    ;; Always copy quit-restore parameter in interactive use.
    (let ((quit-restore (window-parameter old-window 'quit-restore)))
      (when quit-restore
	(set-window-parameter new-window 'quit-restore quit-restore)))
    new-window))


(defun toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (save-excursion
    (if (and (= 1 (length (window-list)))
             (assoc ?_ register-alist))
        (jump-to-register ?_)
      (progn
        (window-configuration-to-register ?_)
        (delete-other-windows)))))


(defun split-window-below-and-focus ()
  "Split the window vertically and focus the new window."
  (interactive)
  (split-window-blow)
  (windmove-down))

(defun split-window-right-and-focus ()
  "Split the window vertically and focus the new window."
  (interactive)
  (split-window-right)
  (windmove-right))


(defun edit-config-file ()
  "Switch to the config file"
  ())
