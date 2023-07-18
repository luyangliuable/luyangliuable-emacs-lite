
;; Note: The order the files are loaded matters.
;; 1. packages
;; 2. windows functions
;; 3. keybindings
;; 4. configs
(let ((default-directory (file-name-directory load-file-name)))
  (load (expand-file-name "core/packages.el"))
  (load (expand-file-name "core/windows.el"))
  (load (expand-file-name "core/config.el")
  (load (expand-file-name "core/buffer.el"))
  (load (expand-file-name "core/bindings.el"))))

