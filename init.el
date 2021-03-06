;;(setq debug-on-error t)

;;; Code:
(defvar site-lisp-dir)
(setq site-lisp-dir
            (expand-file-name "site-lisp" user-emacs-directory))

(add-to-list 'load-path site-lisp-dir)
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;;global settings
(setq inhibit-startup-screen 't)
(set-language-environment "UTF-8")
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(setq-default process-coding-system-alist nil)
(put 'downcase-region 'disabled nil)

(set-frame-font "Ricty-11")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))

(load-theme 'railscasts t)

(require 'multiple-cursors)

(require 'toggle-split)

;; ime settings
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

(require 'find-file-in-project)

;;key bindings
(require 'key-bindings)

;; smartparens
(require 'smartparens)
(smartparens-global-mode t)
(require 'smartparens-config)

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;c/c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq c-default-style "linux"
      c-basic-offset 4)

;;latex
(setq TeX-style-path
      (list "style/" "auto/"
        (expand-file-name (concat "auctex" "/" "style") site-lisp-dir)))
(setq TeX-output-view-style '("^pdf$" "." "evince -w %o"))
(setq preview-image-type 'dvipng)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(setq-default ispell-program-name "aspell")


;;latex japanese
(setq japanese-LaTeX-default-style "article")
(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)

(require 'distraction-free)

;;scala
(require 'scala-mode2)

;;auto complete
(require 'auto-complete-config)
(ac-config-default)

;;yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
(setq yas-snippet-dir (expand-file-name "snippets" user-emacs-directory))

;;typescript
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))

;;haskell-mode
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


;;yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))



;;php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;aspell config
(setq-default ispell-program-name "aspell")
;;(add-to-list 'ispell-skip-region-alist
;;           '("lstlisting\\*?" . "\\\\end[   \n]*{[  \n]*lstlisting\\*?[       \n]*}"))


;;cedet
;; (load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)



;; CoffeeScript
(require 'coffee-mode)

;; zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)


;;helm
(require 'helm-config)

;; css
(setq css-indent-offset 2)

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(customize-set-variable 'markdown-command "multimarkdown -f")


;;80 words line and horizontal center
(setq whitespace-style '(face lines-tail trailing)
      whitespace-line-column 81)

(setq jedi:setup-keys t)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(setq gnutls-min-prime-bits 1024)



(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))


(package-initialize)
