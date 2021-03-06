(use-package company
  :ensure t
  :init
  (global-company-mode 1)
  :config
  (setq company-idle-delay 0)
  (setq company-mininum-prefix-length 3)
  )

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

(require 'company-lsp)
(push 'company-lsp company-backends)
(use-package company-lsp
  :ensure
  :config
  (require 'company)
  (push 'company-lsp company-backends)
  (setq company-lsp-cache-candidates nil)
  (setq company-lsp-async t)
  (setq company-lsp-enable-recompletion t)
  )
(use-package company-irony
  :ensure
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony)
  )

;;(use-package irony
;;  :ensure
;;  :config
;;  (add-hook 'c++-mode-hook 'irony-mode)
;;  (add-hook 'c-mode-hook 'irony-mode)
;;  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;  )

(provide 'setup-company)
