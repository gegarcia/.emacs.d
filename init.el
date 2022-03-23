asdnasfnaspdc
asdnasdn

asdasa
fcfa
11
23



(let ((default-directory "~/.emacs.d/lisp"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(setq backup-directory-alist '((".*" . "~/.emacs.d/.temp")))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (bison-mode global-tags clang-format magit impatient-mode typescript-mode ggtags ztree))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (defun c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;;          (column (c-langelem-2nd-pos c-syntactic-element))
;;          (offset (- (1+ column) anchor))
;;          (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))
	    (ggtags-mode 1)
	    ))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (let ((filename (buffer-file-name)))
;;               ;; Enable kernel mode for the appropriate files
;;               (when (and filename
;;                          (string-match (expand-file-name "~/src/linux-trees")
;;                                        filename))
;;                 (setq indent-tabs-mode t)
;;                 (setq show-trailing-whitespace t)
;;                 (c-set-style "linux-tabs-only")))))
 

(define-key global-map "\M-*" 'pop-tag-mark)

(autoload 'gtags-mode "gtags" "" t)

(setq gtags-mode-hook
      '(lambda ()
	 (local-set-key "\M-t" 'gtags-find-tag)
	 (local-set-key "\M-r" 'gtags-find-rtag)
	 (local-set-key "\M-s" 'gtags-find-symbol)
	 (local-set-key "\C-t" 'gtags-pop-stack)
	 ))

(setq c-basic-offset 8)

(setq c-default-style "linux")

(load "fill-column-indicator.el")
(load "frame-fns.el")
(load "frame-cmds.el")
(load "zoom-frm.el")
(load "flex.el")

;; key bindings
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(if (display-graphic-p)
    (progn
      (global-set-key (vector (list 'control mouse-wheel-down-event)) 'zoom-frm-in)
      (global-set-key (vector (list 'control mouse-wheel-up-event)) 'zoom-frm-out)
      (global-set-key (kbd "C-c C-z") 'zoom-frm-unzoom)))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

(setq package-archives
                '(("melpa" . "http://melpa.org/packages/")
                  ("melpa-stable" . "http://stable.melpa.org/packages/")
                  ("org-elpa" . "https://orgmode.org/elpa/")
                  ("elpa" . "http://elpa.gnu.org/packages/")))

(delete-selection-mode 1)
(which-function-mode 1)
