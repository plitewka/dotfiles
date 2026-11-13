(package-initialize)
(setq custom-file "~/emacs.custom.el")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq default-frame-alist '((undecorated . t)))

(global-display-line-numbers-mode 1)
(setq column-number-mode t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq inhibit-startup-screen t)

; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; Multiple cursors
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

(load custom-file)

; Disable the annoying thing
(add-to-list 'warning-suppress-types '(files missing-lexbind-cookie))
