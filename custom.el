(provide 'custom)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends (quote ((company-clang company-c-headers))))
 '(custom-safe-themes
   (quote
    ("1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" default)))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (company-statistics company-irony company-quickhelp company-c-headers use-package multi-term paganini-theme hl-todo magit package-build)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/usr/include" "-I../Inc" "-I../Drivers/STM32F4xx_HAL_Driver/Inc" "-I../Drivers/CMSIS/Include" "-I../Drivers/CMSIS/Device/ST/STM32F4xx/Include" "-DUSE_HAL_DRIVER" "-DSTM32F410Rx")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))
