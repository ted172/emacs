(custom-set-variables
 '(case-fold-search t)
 '(current-language-environment "ASCCI")
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(load-home-init-file t t))
(custom-set-faces)

;; Setup some load paths
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/matlab-emacs/matlab-emacs")

;; Setup clearcase mode
;(load "clearcase")

;; Setup Verilog mode
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))

;; Setup Verilog mode
(setq verilog-indent-level             2
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             t
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        t
      verilog-auto-endcomments         nil
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    nil
      verilog-auto-lineup              'declarations
      verilog-auto-inst-param-value    t
      verilog-highlight-p1800-keywords nil
      verilog-linter			 "my_lint_shell_command"
      )

;; Setup Matlab mode
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; Setup some variables
(setq require-final-newline t)		;add newline when saving file

;; Setup some function keys
(global-set-key [f2] `align-regexp)
(global-set-key [f3] (lambda () (interactive) (revert-buffer t t)))
(global-set-key [f4] `query-replace-regexp)
(global-set-key [f5] (lambda () (interactive) (shell)))

(global-set-key [f6] (lambda () (interactive) (load-library "clearcase")))
(global-set-key [f7] `compile)
(global-set-key [f8] `recompile)

(global-set-key [f9] (lambda () (interactive) (switch-to-buffer nil)))
(global-set-key [f10] `delete-window)
;(global-set-key [S-f10] (lambda () (interactive) (kill-buffer nil)))
(global-set-key [f11] (lambda () (interactive) (kill-buffer nil)))
(global-set-key [f12] `goto-line)

(global-set-key [mouse-8] `scroll-up)
(global-set-key [mouse-9] `scroll-down)

;; Turn off tab character
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Line by line scrolling
(setq scroll-step 1)

(global-set-key [S-down] (lambda () (interactive) (scroll-down 1)))
(global-set-key [S-up] (lambda () (interactive) (scroll-up 1)))
(global-set-key [kbd "M-k"] (lambda () (interactive) (scroll-down 1)))
(global-set-key [kbd "M-j"] (lambda () (interactive) (scroll-up 1)))

;; Goto line number
;(global-set-key [kbd "M-g"] `goto-line)

;; Hightlight current line minor mode
;(global-hl-line-mode t)

;; Standard indent to 2 rather than 4
;(setq standard-indent 2)
;(setq-default c-basic-offset 4)

;; Mouse wheel scrolling
(mouse-wheel-mode t)

;; Show line/column in mode line
(line-number-mode 1)
(column-number-mode 1)

;; Set fill column
(setq-default fill-column 72)

;; Turn on auto fill mode
(setq auto-fill-mode 1)

;; Remap delete key
(global-set-key [delete] 'delete-char)
(global-set-key [M-delete] 'kill-word)

;; Setup color theme
;(require 'color-theme)
;(color-theme-classic)
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;; Alt key as Meta in OVDC
;(setq x-alt-keysym 'meta)

;; CPP mode
(c-set-offset 'substatement-open 0)

;; Enable auto-fill for .smf
(add-to-list 'auto-mode-alist '("\\.smf'" . auto-fill-mode))
(add-to-list 'auto-mode-alist '("\\.rly'" . auto-fill-mode))

;; NO backup~
(setq make-backup-files nil)

;; Hide toolbar, menu bar, scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
;(toggle-scroll-bar -1)

;(add-hook 'c-mode-hook
;          (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
