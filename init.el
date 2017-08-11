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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (paganini-theme hl-todo paredit magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;----------
;;;modes
;;;----------

;; Global Highlight mode
(define-globalized-minor-mode my-hl-todo-mode-global hl-todo-mode
  (lambda () (hl-todo-mode t)))

;; Highlight todos and other keywords
(my-hl-todo-mode-global t)

;; Delete or replace selection as opposed to at cursor
(delete-selection-mode t)

;; Show Line Numbers along left side
(global-linum-mode t)

;; Do not show menu bar along top
(menu-bar-mode -1)



;; Turn off auto indentation of comments in emacs lisp
(setq ess-fancy-comments nil)

;; Put autosave and backup files in .emacs.d/backups
(setq backup-directory-alist
      `((".*" . , "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups" t)))

;; Set Theme
(load-theme 'paganini t)
(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))
