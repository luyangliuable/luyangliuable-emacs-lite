;; Associate TypeScript mode with .ts, .tsc, and .tsx files
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsc\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(add-hook 'typescript-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; Configure TypeScript LSP
(add-hook 'typescript-mode-hook 'lsp)

