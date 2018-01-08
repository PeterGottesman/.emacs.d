;;; -*- Mode: Emacs-Lisp -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; if packages are not synced, sync
(when (not package-archive-contents)
  (package-refresh-contents))

(setq c-default-style "linux"
      c-basic-offset 4)
(c-set-offset 'case-label '+)

(setq ess-fancy-comments nil
      backup-directory-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      auto-save-file-name-transforms '(("." "~/.emacs.d/backups" t))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      use-package-always-ensure t)

(use-package magit
  :commands (magit-status magit-blame magit-checkout)
  :bind ("<f1>" . magit-status))

(use-package hl-todo)

(define-globalized-minor-mode my-hl-todo-mode-global hl-todo-mode
  (lambda () (hl-todo-mode t)))

(use-package paganini-theme
  :init
  (load-theme 'paganini t))

(use-package multi-term
  :bind ("<f12>" . 'multi-term-dedicated-toggle)
  :config (setq multi-term-program "/bin/bash"
		multi-term-dedicated-close-back-to-open-buffer-p t))

(delete-selection-mode t)
(global-linum-mode t)
(menu-bar-mode -1)
(my-hl-todo-mode-global t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
