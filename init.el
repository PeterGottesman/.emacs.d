;;; -*- Mode: Emacs-Lisp -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(require 'use-package)
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
      auto-save-file-name-transforms `((".*" ,"~/.emacs.d/backups" t))
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

;; (use-package paganini-theme
;;   :init
;;   (load-theme 'paganini t))

(use-package multi-term
  :bind ("<f12>" . 'multi-term-dedicated-toggle)
  :config (setq multi-term-program "/bin/zsh"
		multi-term-dedicated-close-back-to-open-buffer-p t))

(use-package irony
  :hook ('c-mode-hook 'irony-mode))

(use-package company
  :bind ("C-\\" . company-complete)
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-c-headers)
  (use-package company-statistics
    :init (add-hook 'after-init-hook 'company-statistics-mode))
  (use-package company-irony)
  (setq company-c-headers-path-user'("./Inc" ".")
	company-show-numbers t
	company-backends '((company-clang company-c-headers))))

(use-package ggtags
  :bind (("M-n" . ggtags-find-tag-dwim)
	 ("M-." . ggtags-find-definition)
	 ("M-\/". ggtags-find-reference))
  :init (add-hook 'c-mode-common-hook
		  (lambda ()
		    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		      (ggtags-mode 1))))
  (global-set-key (kbd "M-,") 'xref-pop-marker-stack)) ; For Emacs <25

(use-package ace-window
  :bind ("C-x o" . 'ace-window)
  )

(use-package origami
  :bind (("C-c k" . origami-toggle-node)
	 ("C-c C-k" . origami-toggle-all-nodes))
  :init (global-origami-mode)
  )

(global-set-key (kbd "<f2>") 'whitespace-mode)
(global-set-key (kbd "S-<f2>") 'whitespace-cleanup)

(delete-selection-mode t)
(global-linum-mode t)
(menu-bar-mode -1)
(my-hl-todo-mode-global t)
(load-theme 'misterioso t)

;; Turn off file variables
;; See: https://www.emacswiki.org/emacs/FileLocalVariables#toc2
(setq enable-local-variables nil
      enable-local-eval nil)

(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(put 'downcase-region 'disabled nil)
