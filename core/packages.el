;; Enable package management
(require 'package)
(setq package-enable-at-startup nil) ; Avoid initializing twice
(setq image-types '(svg png gif tiff jpeg xpm xbm pbm))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; TODO: Automatically package install these files

;; Enable packages
(require 'evil)
(require 'evil-leader)
(require 'treemacs)
(require 'which-key)
(require 'display-line-numbers) ;; may not be necessray if it after emacs version 16

;; Enable modes
(evil-mode 1)
(tool-bar-mode -1)
