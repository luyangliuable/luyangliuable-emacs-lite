;; Note: The order the files are loaded matters.
;; 1. packages
;; 2. windows functions
;; 3. keybindings
;; 4. configs

(let ((default-directory (file-name-directory load-file-name)))
  (load (expand-file-name "core/packages.el")))


(let* ((default-directory (file-name-directory load-file-name))
       (output-directory (expand-file-name "bin" default-directory)))
  (unless (file-exists-p output-directory)
    (make-directory output-directory t))
  (byte-recompile-directory default-directory 0 t)
  (dolist (file '("core/load.el"

                  "core/funcs.el"
                  "core/config.el"

                  "core/functions/window.el"
                  "core/functions/file.el"
                  "core/functions/buffer.el"
                  "core/functions/modes.el"

                  "core/buffer.el"

                  "layers/treemacs.el"
                  "layers/evil.el"
                  "layers/helm.el"
                  "layers/tide.el"
                  "layers/typescript.el"

                  "core/bindings.el"))
    (let* ((source-file (expand-file-name file))
           (compiled-file (concat source-file "c"))
           (output-file (concat (file-name-as-directory output-directory)
                                (file-name-nondirectory compiled-file))))
      (when (file-exists-p compiled-file)
        (rename-file compiled-file output-file t)
        (load output-file t t)))))


(show-active-minor-mode-list)
