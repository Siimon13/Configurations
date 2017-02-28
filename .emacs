;;; package --- Summary

;;; Commentary:


;;; Code:
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line



;;Loading Themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

;;Windmove - Jumping windows
(windmove-default-keybindings 'meta)

;;Smart Parens
(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)

;;Auto-config mode
(ac-config-default)
(auto-complete-mode t)

;;Fly check
(global-flycheck-mode)

;;Jedi Python mode
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;Web Mode
(require 'web-mode)
(add-hook 'html-mode-hook 'web-mode)

;;JS Mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;;Aggresive-Indent Mode
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;Commenting mode
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-q") 'comment-or-uncomment-region-or-line)


;;Org-mode
;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


;;Line number mode
(global-linum-mode t)

;;Indent-Guide
(require 'indent-guide)
(indent-guide-global-mode t)

;;org-mode shift select
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<S-left>") nil)
     (define-key org-mode-map (kbd "<S-right>") nil)
     (define-key org-mode-map (kbd "<S-up>") nil)
     (define-key org-mode-map (kbd "<S-down>") nil)
     (define-key org-mode-map (kbd "<S-left>") nil)
     (define-key org-mode-map (kbd "<S-right>") nil)))


;;Ya Snippet
(require 'yasnippet)
(yas-global-mode 1)

(provide '.emacs)
;;; .emacs ends here

