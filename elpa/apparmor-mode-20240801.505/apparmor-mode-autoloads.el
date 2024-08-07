;;; apparmor-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "apparmor-mode" "apparmor-mode.el" (0 0 0 0))
;;; Generated autoloads from apparmor-mode.el

(autoload 'apparmor-mode "apparmor-mode" "\
apparmor-mode is a major mode for editing AppArmor profiles.

\(fn)" t nil)

(autoload 'apparmor-mode-setup-flymake-backend "apparmor-mode" "\
Setup the `flymake' backend for `apparmor-mode'." nil nil)

(add-hook 'apparmor-mode-hook 'apparmor-mode-setup-flymake-backend)

(add-to-list 'auto-mode-alist '("\\`/etc/apparmor\\.d/" . apparmor-mode))

(add-to-list 'auto-mode-alist '("\\`/var/lib/snapd/apparmor/profiles/" . apparmor-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "apparmor-mode" '("apparmor-mode-")))

;;;***

;;;### (autoloads nil nil ("apparmor-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; apparmor-mode-autoloads.el ends here
