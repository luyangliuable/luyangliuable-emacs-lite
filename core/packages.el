;; Enable package management
(require 'package)
(setq package-enable-at-startup nil) ; Avoid initializing twice
(setq image-types '(svg png gif tiff jpeg xpm xbm pbm))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Declare packages
;; TODO run package install before doing anything else
(setq my-packages
      '(evil
        evil-leader
	tide
        treemacs
	lsp-mode
	company
	helm
	highlight-symbol
        which-key))

;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; Enable packages
(require 'evil)
(require 'evil-leader)
(require 'treemacs)
(require 'which-key)
(require 'lsp-mode)
(require 'display-line-numbers) ;; may not be necessray if it after emacs version 16

;; hooks
(add-hook 'after-init-hook 'global-company-mode)

;; Enable modes
(evil-mode 1)
(evil-leader-mode 1)
(tool-bar-mode -1)

;; Enable use package
(eval-when-compile (require 'use-package))
