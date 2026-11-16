; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

(setq custom-file "~/emacs.custom.el")

; Theme
(use-package gruber-darker-theme)
(setq custom-safe-themes t)
(load-theme 'gruber-darker)
(setq custom-safe-themes nil)

; Window settings
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq default-frame-alist '((undecorated . t)))

; Editor settings
(global-display-line-numbers-mode 1)
(setq column-number-mode t)

(setq inhibit-startup-screen t)

; LSP 
(use-package lsp-mode
    :bind-keymap ("C-c l" . lsp-command-map)
  )
(use-package lsp-ui)
(use-package company)
(use-package corfu)

; IDO
(use-package ido-completing-read+)
(use-package smex)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(ido-ubiquitous-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; Multiple cursors
(use-package multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

; Reduce the number of times the bell rings
; Turn off the bell for the listed functions.
(setq ring-bell-function
      (lambda ()
        (unless (memq this-command
                      '(isearch-abort
                        abort-recursive-edit
                        exit-minibuffer
                        keyboard-quit
                        previous-line
                        next-line
                        scroll-down
                        scroll-up
                        cua-scroll-down
                        cua-scroll-up))
          (ding))))

; C/C++
(defun my-c-mode-common-hook ()
 (c-set-offset 'substatement-open 0)
 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)

 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-or-c++-mode-hook #'lsp)

(load custom-file)
;; Vue + TypeScript + Tailwind works out of the box
(use-package eglot-typescript-preset
  :ensure t)

;; To also add ESLint and oxlint for Vue files:
(use-package eglot-typescript-preset
  :ensure t
  :custom
  (eglot-typescript-preset-vue-rass-tools
   '(vue-language-server typescript-language-server eslint oxlint tailwindcss-language-server)))
; ORG
(use-package org-present)
(use-package org-modern)
(use-package org-present)
(use-package org-tree-slide)

; Disable the annoying warning
(add-to-list 'warning-suppress-types '(files missing-lexbind-cookie))

; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

; Which key
(use-package which-key
  :config
  (which-key-mode 1))

; Projectile
(use-package projectile
    :diminish projectile-mode
    :init
    (setq projectile-keymap-prefix (kbd "C-c p"))
    )
