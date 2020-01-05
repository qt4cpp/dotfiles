;; Meta -> Command
(setq mac-option-modifier 'meta)
(setq mac-command-modifier (quote super))

;; Don't create backup file
(setq make-backup-files nil)

;; kill whole line on C-k
(setq kill-whole-line t)

;; yes or no -> y or n
(fset 'yse-or-no-p 'y-or-n-p)

;; display line number
(global-display-line-numbers-mode)

;; Backup Autosave
(setq auto-save-default nil)

;; Appearance
(when window-system
  ;; Toolbar
  (tool-bar-mode 0)
  ;; scrollbar
  (scroll-bar-mode 0)
  ;; Insert things at the cursor when mouse pasting.
  (setq mouse-yank-at-point t)
  ;; highlight paren
  (show-paren-mode 1)
  ;; display picture.
  (auto-image-file-mode t)
  )

;; 13inch Macbook Pro
(setq default-frame-alist
      '((width . 238)
	(height . 79)
	(top . 0)
	(left . 0)
	(font . "-*-Fira Code-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; straight
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(package-initialize)

;; use-packageをインストールする
(straight-use-package 'use-package)

(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")))

;; all-the-icons
(use-package all-the-icons)

(use-package doom-themes
  :straight t
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-neotree-config)
  (doom-themes-org-config)
  :custom-face
  (doom-modeline-bar ((t (:background "#6272a4"))))
)

(use-package doom-modeline
  :straight t
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-height 1)
  :custom-face
  (mode-line ((nil (:height 140))))
  (mode-line-inactive ((nil (:height 100))))
  :hook
  (after-init . doom-modeline-mode)
  :config
  ;; (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline 'main
					;    '(bar workspace-number window-number evil-state god-state ryo-modal xah-fly-keys matches buffer-info remote-host buffer-position parrot selection-info)
    '(bar matches buffer-info buffer-position selection-info)
    '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker)))

(use-package beacon
  :straight t
  :custom
  (beacon-color "yellow")
  (beacon-blink-duration 0.4)
  (beacon-blink-delay 0.3)
  (beacon-size 60)
  :config
  (beacon-mode 1))

(use-package rainbow-delimiters
  :straight t
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package highlight-symbol
  :straight t
  :hook
  (prog-mode . highlight-symbol-mode)
  (prog-mode . highlight-symbol-nav-mode)
  :custom
  (highlight-symbol-idle-delay 0.5)
  (highlight-symbol-colors "RoyalBlue1"))

(use-package which-key
  :straight t
  :diminish which-key-mode
  :hook (after-init . which-key-mode))

(use-package counsel :straight t)

(use-package ivy
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 20)
  (setq ivy-extra-direcotires nil)
  (setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))
  :bind
  (("C-s" . swiper)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("s-r" . counsel-recentf)
   ("s-s" . counsel-rg))
  )

(use-package ivy-rich
  :straight t
  :config
  (ivy-rich-mode 1))

(use-package recentf
  :straight t
  :init
  (setq recentf-save-file "~/.emacs.d/.recentf")
  (setq recentf-max-saved-items 100)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 'never)
  (setq recentf-list
      '(
        "/Users/tatsu/.emacs.d/init.el"
        ))
  (setq recentf-filter-changer-current 'nil)
)

(use-package company
  :straight t
  :custom
  (company-idle-delay 0)		 ; default 0.5
  (company-echo-delay 0)
  (company-minimum-prefix-length 2)	 ; default 4
  (company-selection-wrap-around t)
  :config
  (push 'company-lsp company-backends)
  :init
  (global-company-mode t)
)

(use-package company-box
  :straight t
  :hook (company-mode . company-box-mode))

(use-package yasnippet
  :straight t
  :config
  (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
  :init
  (yas-global-mode 1))
  
(use-package lsp-mode
  :straight t
  :custom ((lsp-enable-snippet t)
	   (lsp-document-sync-method 'incremental)
	   (lsp-inhibit-message t)
	   (lsp-message-project-root-warning t)
	   (create-lockfiles nil))
  :hook (prog-major-mode . lsp-prog-major-mode-enable)
  )

(use-package lsp-ui
  :straight t
  :after lsp-mode
  :custom (scroll-margin 0)
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)		; top, bottom or at-point
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  ;; (lsp-ui-doc-max-height 150)
  ;; (lsp-ui-doc-max-width 30)
  (lsp-ui-peek-enable t)
  )

(use-package company-lsp
  :straight t
  :defines company-backends
  :functions company-backend-with-yas
  :custom
  (company-lsp-async t)
  (company-lsp-enable-recompletion t)
  (company-lsp-enable-snippet t)
  :after
  (:all lsp-mode lsp-ui company yasnippet)
  :init
  (push 'company-lsp company-backends)
  ;(cl-pushnew (company-backend-with-yas 'company-lsp) company-backends)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; haskell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package haskell-mode
  :straight t
  :hook (haskell-mode . lsp)
  )

(use-package lsp-haskell
  :straight t
  )

;; projectile
(use-package projectile
  :straight t
  :config
  (bind-keys :map projectile-mode-map
	     ("s-p" . projectile-command-map)
	     ("C-c p" . projectile-command-map))
  (projectile-mode +1))

(use-package anzu
  :straight t
  :config
  (global-anzu-mode +1))

(use-package avy
  :straight t
  :bind
  (("s-l" . avy-goto-line)
   ("s-c" . avy-goto-char)
   ("s-w" . avy-goto-word-0))
  )

(use-package imenu-list
  :straight t
  :bind
  ("<f10>" . imenu-list-smart-toggle)
  :custom-face
  (imenu-list-entry-face-1 ((t (:foreground "white"))))
  :custom
  (imenu-list-focus-after-activation t)
  (imenu-list-auto-resize nil)
  )

(use-package ace-window
  :straight t
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :custom-face
  (aw-leading-char-face ((t (:height 4.0 :foreground "#d1da00"))))
  :bind
  (("C-x o" . ace-window)))

(use-package hydra
  :straight t
  )

(use-package python
  :straight t
  :config
  (add-hook 'python-mode-hook #'lsp))

(use-package pyenv-mode-auto
  :straight t)
  ;; :config
  ;; (pyenv-mode))

(use-package conda
  :straight t
  :init
  (custom-set-variables '(conda-anaconda-home "~/.pyenv/versions/anaconda3-2019.10")))
	 
(setq lsp-haskell-process-path-hie "~/.local/bin/hie")

(use-package super-save
  :straight t
  :config
  (setq super-save-auto-save-when-idle t
	super-save-idle-duration 2)
  (super-save-mode +1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(package-selected-packages
   (quote
    (lsp-mode super-save company counsel swiper avy which-key doom-modeline doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#6272a4")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Org-captureの設定

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/Documents/memo/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
	("b" "TEST" entry (file+headline "~/Documents/memo/notes.org" "Notes")
	 "* %t %?\n")
	("j" "Journal" entry (file+datetree "~/Documents/memo/notes.org")
	 "**** %<%H:%M> %?\n" :tree-type week)
        ))

; メモをC-M-^一発で見るための設定
; https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Documents/memo/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

;; hydra
(defhydra hydra-avy (global-map "s-e" :hint nil :exit t)
  "
^Line^       ^Region^      ^Goto^
------------------------------------------------------------
[_y_] yank   [_Y_] yank    [_c_] timed char  [_C_] char
[_m_] move   [_M_] move    [_w_] word        [_W_] any word
[_k_] kill   [_K_] kill    [_l_] line        [_L_] end of line"
  ("c" avy-goto-char-timer)
  ("C" avy-goto-char)
  ("w" avy-goto-word-1)
  ("W" avy-goto-word-0)
  ("l" avy-goto-line)
  ("L" avy-goto-end-of-line)
  ("m" avy-move-line)
  ("M" avy-move-region)
  ("k" avy-kill-whole-line)
  ("K" avy-kill-region)
  ("y" avy-copy-line)
  ("Y" avy-copy-region))

(defhydra hydra-window (global-map "<f7>" :color red :hint nil)
  "
^Split^            ^size^
^^^^^----------------------------------------
[_v_] vertical     [_i_] enlarge
[_h_] horizontal   [_m_] shrink
[_o_] other-window [_j_] enlarge_horizontal
[_1_] delete-other [_k_] shrink_horiozontal
[_0_] delete-this  [_+_] balance-window"
  ("v" split-window-horizontally)
  ("h" split-window-vertically)
  ("o" other-window)
  ("1" delete-other-windows)
  ("0" delete-window)
  
  ("i" enlarge-window)
  ("m" shrink-window)
  ("j" enlarge-window-horizontally)
  ("k" shrink-window-horizontally)
  ("+" balance-window))
