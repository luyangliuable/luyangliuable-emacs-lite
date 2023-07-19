;; Enable package management
(require 'package)
(setq package-enable-at-startup nil) ; Avoid initializing twice
(setq image-types '(svg png gif tiff jpeg xpm xbm pbm))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Declare packages
;; TODO run package install before doing anything else
(setq my-packages
      '(evil
        evil-leader
        treemacs
        which-key))

;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Enable packages
(require 'evil)
(require 'evil-leader)
(require 'treemacs)
(require 'which-key)
(require 'display-line-numbers) ;; may not be necessray if it after emacs version 16

;; Enable modes
(evil-mode 1)
(tool-bar-mode -1)
