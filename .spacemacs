;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ruby
     javascript
     html
     csv
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     ;; git
     markdown
     org
     python
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     emms
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 40
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 10
                               :height normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'right
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'right-then-bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 89
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (if (not (version<= emacs-version "26"))
      (defalias 'display-buffer-in-major-side-window 'window--make-major-side-window))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; ----------------------------------------
  ;; 基本的な設定
  ;; ----------------------------------------
  (setq-default line-spacing 4)
  (if window-system
     (progn
       (set-frame-parameter nil ' alpha 89)
       ))
  (setq create-lockfiles nil)           ; 自動保存したときの.#なんちゃらを作らない
  (setq delete-auto-save-files t)       ; これを非nilにすると勝手にバックアップファイルを消してくれる
  (setq auto-save-timeout 2)            ; 自動保存するidle-time [sec]
  (setq truncate-lines t)
  (setq truncate-partial-width-windows nil)

  ;; ----------------------------------------
  ;; IME on Mac
  ;; ----------------------------------------
  ;; (if (eq system-type 'darwin)
;;       (progn
;;         ;; IME関連機能の有効化とバージョン毎に異なる値を定義しとく
;;         (setq default-input-method "MacOSX") ; IMEパッチを当てたEmacsが必要。
;;         (setq mac-US-IME-name "com.apple.keylayout.US")                        ; ことえりじゃない英語キーボード。
;;         (setq mac-kotoeri-US-name "com.apple.inputmethod.Kotoeri.Roman")       ; ことえりの英語キーボード
;;         (setq mac-kotoeri-JP-name "com.apple.inpuutmethod.Kotoeri.Japanese")   ; ことえりの日本語キーボード
;;         (setq mac-ATOK-US-name "com.justsystems.inputmethod.atok31.Roman")     ; Atok 英字入力
;;         (setq mac-ATOK-IME-name "com.justsystems.inputmethod.atok31.Japanese") ; atok2016 -> atok29
;;         ;; IME ON/OFF時のカーソルカラー
;;         (mac-set-input-method-parameter mac-ATOK-US-name 'cursor-color "aqua") ; aqua は spacemacs-darkの色
;;         (mac-set-input-method-parameter mac-ATOK-IME-name 'cursor-color "LightGreen")
;;         (add-hook 'minibuffer-setup-hook
;;                   '(lambda ()
;;                      (mac-toggle-input-method nil)))

;;         ;; (mac-get-current-input-source) この関数を評価するとIMEの名前を評価される。`'

;;         ;; evilのノーマルステートではIMEをoffにする。
;;         (add-hook 'evil-normal-state-entry-hook
;;                   '(lambda ()
;;                      (mac-toggle-input-method nil)))
;;         ;; (defun mac-selected-keyboard-input-source-change-hook-func ()
;;         ;;   ;; 日本語入力するときは挿入モードに変更する
;;           ;(when (string-match "\\.Japanese$" (mac-get-current-input-source))
;;           ;  (evil-insert-state)))

;; ;;        (add-hook 'mac-selected-keyboard-input-source-change-hook
;; ;;                  'mac-selected-keyboard-input-source-change-hook-func)

;;         ;; ;; IME ON時のモードラインタイトル
;;         (mac-set-input-method-parameter mac-ATOK-IME-name `title "[あ]")
;;         ))

  (if (eq window-system 'mac)
      (progn
        ;; Emacs-macではalt->meta, Command->superにする
        (setq mac-command-modifier 'super)
        (setq mac-option-modifier 'meta)
        ))
  ;; ----------------------------------------
  ;; IME common
  ;; ----------------------------------------
  ;; normal-mode時にはIMEが有効にならないように制御していると、normal-modeで他のアプリケーションに行ったときに
  ;; IMEの制御が効いたままになっているので、フォーカスを失ったときにはInsert-stateにするように変更する。

  (defun my/change-evil-insert-state-focus-out-hook-func ()
    "focus outするとき現在のevilかnormal-stateかを保存してinsert-stateにする"
    (setq normal-state-before-focus-out (evil-normal-state-p))
    (evil-insert-state))

  (defun my/back-evil-state-focus-in-hook-func ()
    "focus in時に前回のstateにもどす"
    (if normal-state-before-focus-out
        (evil-normal-state)
      (evil-insert-state)))

  (add-hook 'focus-out-hook
            '(lambda ()
               (my/change-evil-insert-state-focus-out-hook-func)))

  (add-hook 'focus-in-hook
            '(lambda ()
               (my/back-evil-state-focus-in-hook-func)))

  ;; ----------------------------------------
  ;; helm
  ;; ----------------------------------------
  (bind-key "C-;" 'helm-mini)

  ;; ----------------------------------------
  ;; org-capture
  ;; ----------------------------------------
  (setq org-capture-templates
        '(("d" "Diary" entry(file+datetree "~/Documents/org/log.org")
           "* %(concat (format-time-string \"%y%m%d\")) %? :Diary:\n %U\n %i\n %a\n")
          ("j" "Journal" entry(file+datetree "~/Documents/org/log.org")
           "* %(concat (format-time-string \"%R\")) %? :Journal:\n%i\n")
          ("w" "Weekly Review" entry(file+datetree "~/Documents/org/log.org")
           "* %?:Log:Review:\n %U\n %i\n %a\n" )
          ("r" "Review" entry(file+headline "~/Documents/org/log.org" "Inbox")
           "* %(concat (format-time-string \"%y%m%d\")) %? :Review:\n%[~/org/4ld]" :prepend t)
          ("b" "Reading book note" entry(file "~/org/books.org")
           "Publisher:  Author:  Price: \n?\n Title: Author: Price:\n" :prepend t)
          ("d" "Daily Journal" plain(file+function "~/Documents/org/log.org" my/capture_datetree)
           "\n*** %(format-time-string \"%y%m%d\") %? :Journal: \n %U\n%i\n" )
          ("t" "Timeline Journal" plain(file (concat "~/Journal-" (format-time-string "%Y-%m") ".md"))
           "## %(format-time-string \"%Y-%m-%d %H:%M\")\n%?")
          ))

  ;; capture用の関数
  ;; ツリーを探すための関数
  (defun my/capture_datetree ()
  (interactive)
  (my/datetree-find-month-create(org-date-to-gregorian(format-time-string "%Y-%m-%d")))
  (org-end-of-subtree)  )

  ;; org-datetree-find-createが日まで作成してするので、月までの関数を作成した。
  (defun my/datetree-find-month-create (date &optional keep-restriction)
    "Find or create an entry for DATE.
     If KEEP-RESTRICTION is non-nil, do not widen the buffer.
     When it is nil, the buffer will be widened to make sure an existing date
     tree can be found."
    (require 'org-datetree)
    (org-set-local 'org-datetree-base-level 1)
    (or keep-restriction (widen))
    (save-restriction
      (let ((prop (org-find-property "DATE_TREE")))
        (when prop
          (goto-char prop)
          (org-set-local 'org-datetree-base-level
                         (org-get-valid-level (org-current-level) 1))
          (org-narrow-to-subtree)))
      (goto-char (point-min))
      (let ((year (nth 2 date))
            (month (car date))
            (day (nth 1 date)))
        (org-datetree-find-year-create year)
        (org-datetree-find-month-create year month)
        )))

  ;; org-captureするときは挿入モードにする。
  (add-hook 'org-capture-mode-hook
            '(lambda ()
               (evil-insert-state)))
  ;; ----------------------------------------
  ;; autocomplete
  ;; ----------------------------------------
  ;; 日本語を含む補完はしない
  (defadvice ac-candidate-words-in-buffer (after remove-word-contain-japanese activate)
    (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
      (setq ad-return-value
            (remove-if contain-japanese ad-return-value))))

  ;; ----------------------------------------
  ;; paradox
  ;; ----------------------------------------
  ;; (setq paradox-github-token 'token)
  ;; ----------------------------------------
  ;; google-translate
  ;; ----------------------------------------
  (defvar google-translate-english-chars "[:ascii:]"
    "これらの文字が含まれているときは英語とみなす")

  (custom-set-variables
   '(google-translate-default-source-language "en")
   '(google-translate-default-target-language "ja"))

  (setq google-translate-translation-directions-alist
        '(("en" . "ja")
          ("ja" . "en")))
  (setq google-translate-output-destination nil)
  (push '("*Google Translate*" :width 0.3 :position right) popwin:special-display-config)
  (defun my/google-translate-auto (&optional string)
    "現在位置の単語を翻訳する。C-u付きでquery指定も可能"
    (interactive)
    (setq string
          (cond ((stringp string) string)
                (current-prefix-arg
                 (read-string "Google Translate: "))
                ((use-region-p)
                 (buffer-substring (region-beginning) (region-end)))
                (t
                 (thing-at-point 'word))))
    (let* ((asciip (string-match
                    (format "\\`[%s]+\\'" google-translate-english-chars)
                    string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (if asciip (google-translate-at-point)
        (google-translate-at-point-reverse))
      ))
  (bind-key "SPC g" 'my/google-translate-auto evil-normal-state-map)

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(google-translate-default-source-language "en" t)
 '(google-translate-default-target-language "ja" t)
 '(package-selected-packages
   (quote
    (emms org-mime rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby winum unfill org-category-capture fuzzy web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode powerline org alert log4e gntp markdown-mode parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish company bind-map bind-key yasnippet packed f dash s helm avy helm-core async auto-complete popup package-build web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data csv-mode insert-shebang fish-mode company-shell yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic paradox spinner company-statistics adaptive-wrap ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gh-md flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
