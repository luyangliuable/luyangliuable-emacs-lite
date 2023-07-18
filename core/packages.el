;; Enable package management
(require 'package)
(setq package-enable-at-startup nil) ; Avoid initializing twice
(setq image-types '(svg png gif tiff jpeg xpm xbm pbm))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Enable packages
(require 'evil)
(require 'evil-leader)
(require 'treemacs)
(require 'which-key)

;; Enable modes
(evil-mode 1)
(tool-bar-mode -1)
