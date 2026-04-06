;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(vimscript
     ;;php
     helm
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-use-company-box t
                      auto-completion-enable-sort-by-usage t
                      )
     better-defaults
     emacs-lisp
     git
     markdown
     ;;neotree
     (treemacs :variables
               ;; treemacs-use-git-mode 'deferred
               treemacs-use-git-mode 'extended
               treemacs-lock-width t
               treemacs-use-filewatch-mode t
               treemacs-use-all-the-icons-theme t
               )
     (org :variables
          org-todo-dependencies-strategy 'naive-auto
          ;; org-enable-notifications t
          ;; org-start-notification-daemon-on-startup t
          ;; alert-default-style 'notifications
          org-enable-github-support t
          org-enable-bootstrap-support t
          org-enable-hugo-support t
          )
     (shell :variables
            shell-default-height 30
            ;; shell-default-shell 'ansi-term
            ;; brew install libvterm
            shell-default-shell 'vterm
            shell-default-term-shell "/bin/zsh"
            shell-default-position 'bottom
            terminal-here-mac-terminal-command 'iterm2
            )
     ;;  spell-checking
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-change-dictionary "american"
                     spell-checking-enable-by-default nil
                     )
     (syntax-checking)
     version-control
     sql
     (python :variables
             python-format-on-save t
             ;; python-formatter 'yapf
             python-formatter 'black
             python-sort-imports-on-save t
             python-shell-interpreter "python3"
             python-backend 'lsp
             python-lsp-server 'pyright
             python-test-runner '(pytest)
             ;; python-fill-column 99
             python-poetry-activate t
             python-virtualenv-management 'pet
             )
     emoji
     (chinese :variables
              ;;chinese-enable-fcitx t
              )
     c-c++
     csv
     (html :variables
           css-enable-lsp t
           less-enable-lsp t
           scss-enable-lsp t
           html-enable-lsp t
           web-fmt-tool 'web-beautify
           )
     ;;java
     (plantuml :variables
               plantuml-jar-path "~/.local/bin/plantuml.jar"
               org-plantuml-jar-path "~/.local/bin/plantuml.jar"
               plantuml-default-exec-mode 'jar
               org-confirm-babel-evaluate nil
               ;; plantuml-java-command
               )
     ;;lua
     (shell-scripts :variables
                    shell-scripts-format-on-save t
                    shell-scripts-backend 'lsp
                    )
     yaml
     ;;  windows-scripts
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-backend 'lsp
                 ;; typescript-backend 'tide
                 typescript-fmt-tool 'typescript-formatter
                 typescript-linter 'eslint
                 ;; 'tide is default value
                 ;; typescript-fmt-tool 'tide
                 ;; By default lsp will explicitly set itself as the linter, if you don't want that, then set the variable typescript-lsp-linter to nil.
                 ;; typescript-lsp-linter nil
                 )
     pandoc
     lsp
     (go :variables
         go-backend 'lsp
         go-use-gometalinter t
         go-format-before-save t
         gofmt-command "goimports"
         godoc-at-point-function 'godoc-gogetdoc
         ;; Disabled: golangci-lint conflicts with LSP diagnostics and lacks real-time feedback
         ;; go-use-golangci-lint t
         )
     ;;django
     (javascript :variables
                 javascript-backend 'lsp
                 ;;javascript-lsp-linter nil
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 javascript-repl `nodejs
                 node-add-modules-path t
                 js2-include-node-externs t
                 )
     (node :variables node-add-modules-path t)
     (json :variables
           json-fmt-tool 'prettier
           json-fmt-on-save t
           json-backend 'lsp
           )
     react
     (vue :variables
          ;; vue-backend 'lsp
          vue-backend 'dumb
          )
     prettier
     ;;web-beautify
     (rust :variables
           lsp-rust-analyzer-cargo-auto-reload t
           rustic-format-on-save t)
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
     themes-megapack
     major-modes
     debug
     templates
     dap
     ;; (github-copilot :variables
     ;;                 github-copilot-enable-commit-messages 'golem)
     (llm-client :variables
                 llm-client-enable-gptel t
                 llm-client-enable-ellama t
                 )
     (claude-code :variables
                  claude-code-ide-window-side 'right
                  claude-code-ide-window-width 100)
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      eterm-256color
                                      ;; (copilot :location (recipe
                                      ;;                     :fetcher github
                                      ;;                     :repo "zerolfx/copilot.el"
                                      ;;                     :files ("*.el" "dist")))
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    pangu-spacing
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   ;;    dotspacemacs-initial-scratch-message "#+TITLE: Scratch
   ;; #+AUTHOR: Elvin Zeng
   ;; #+STARTUP: indent
   ;; #+OPTIONS: ^:nil

   ;; "
   dotspacemacs-initial-scratch-message "#+TITLE: Scrach
#+AUTHOR: Elvin Zeng
#+STARTUP: indent
#+OPTIONS:

"

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-monokai-classic
                         idea-darkula
                         monokai
                         intellij
                         ;; github-modern
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;;dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; all-the-icons-install-fonts
   ;; M-x nerd-icons-install-fonts
   dotspacemacs-mode-line-theme '(doom :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("JetBrainsMono Nerd Font"
                               :size 16.0
                               ;; :scale 1.8
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'nerd-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   ;;dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 30

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'right-then-bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Make consecutive tab key presses after commands such as
   ;; `spacemacs/alternate-buffer' (SPC TAB) cycle through previous
   ;; buffers/windows/etc. Please see the option's docstring for more information.
   ;; Set the option to t in order to enable cycling for all current and
   ;; future cycling commands. Alternatively, choose a subset of the currently
   ;; supported commands: '(alternate-buffer alternate-window). (default nil)
   dotspacemacs-enable-cycling nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 95

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   ;;dotspacemacs-line-numbers nil
   dotspacemacs-line-numbers '(
                               :enabled-for-modes go-mode vue-mode js-mode html-mode css-mode
                               :size-limit-kb 1000)


   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `ack' and `grep'.
   ;; (default '("rg" "ag" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-redo', `undo-fu' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system from or to undo-tree. (default `undo-redo')
   dotspacemacs-undo-system 'undo-redo

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "Hi, Elvin Zeng~ o(*￣▽￣*)ブ ～(￣▽￣～)~ 🖥"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ;;         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
  ;;         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  ;;         ("nongnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
  ;;         ))


  ;; apt-get install ncurses-term
  (add-hook 'term-mode-hook #'eterm-256color-mode)

  (setq package-check-signature nil)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Set escape keybinding to "jk"
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  (add-hook 'spacemacs-buffer-mode-hook (lambda ()
                                          (set (make-local-variable 'mouse-1-click-follows-link) nil)))

  (add-hook 'after-change-major-mode-hook
            (lambda ()
              (when (eq major-mode 'go-mode)
                (progn
                  (set-fill-column 120)
                  (display-fill-column-indicator-mode 1)
                  (message "keep it simple and stupid")))))
  (add-hook 'after-change-major-mode-hook
            (lambda ()
              (when (eq major-mode 'python-mode)
                (progn
                  (set-fill-column 88)
                  (display-fill-column-indicator-mode 1)
                  (message "keep it simple and stupid")))))
  (add-hook 'after-change-major-mode-hook (lambda ()
                                            (when (eq major-mode 'org-mode)
                                              (progn
                                                (org-toggle-pretty-entities)
                                                ))))

  (if (display-graphic-p)
      (progn
        (setq-default dotspacemacs-default-font '(
                                                  "JetBrainsMono Nerd Font"
                                                  :size 16
                                                  :weight normal
                                                  :width normal
                                                  ))
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset (font-spec
                                     ;; :family "Noto Sans Mono CJK SC"
                                     ;; :family "楷体-简"
                                     :family "Kaiti SC"
                                     ;; :family "Noto Sans CJK SC"
                                     ;; :family "Microsoft YaHei"
                                     :size 20
                                     )))
        ))

  ;;(require 'poetry)
  ;;(poetry-tracking-mode 1)

  ;; (defun my-flycheck-python-setup ()
  ;;   "Set up Flycheck for Python mode."
  ;;   (setq-local flycheck-disabled-checkers '(python-pycompile python-pylint python-mypy lsp))
  ;;   (setq-local flycheck-checker 'python-pyright)

  ;;   ;; Add flake8 as a next checker after pyright
  ;;   (flycheck-add-next-checker 'python-pyright 'python-flake8 'append)

  ;;   ;; Select pyright as the main checker for this buffer
  ;;   (flycheck-select-checker 'python-pyright)

  ;;   ;; Ensure Flycheck is enabled
  ;;   (flycheck-mode 1)

  ;;   ;; Capture the buffer reference
  ;;   (let ((target-buffer (current-buffer)) ;; Save the current buffer
  ;;         (intervals '(5 10 20 30)))       ;; List of intervals
  ;;     (dolist (interval intervals)
  ;;       (run-with-timer interval nil
  ;;                       (lambda ()
  ;;                         ;; Use the captured buffer explicitly
  ;;                         (when (buffer-live-p target-buffer) ;; Check if buffer is still alive
  ;;                           (with-current-buffer target-buffer ;; Switch to the correct buffer
  ;;                             (when (derived-mode-p 'python-mode) ;; Ensure it's still Python mode
  ;;                               (flycheck-select-checker 'python-pyright)))))))))

  ;; Add the setup function to python-mode-hook
  ;;(add-hook 'python-mode-hook #'my-flycheck-python-setup)


  ;;    (setq org-html-validation-link nil)

  ;; https://github.com/syl20bnr/spacemacs/issues/11798
  (when (version<= "9.2" (org-version))
    (require 'org-tempo))

  ;; (spacemacs/toggle-transparency)

  (setq auto-insert-query nil)

  ;; accept completion from copilot and fallback to company
  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))

  ;; (with-eval-after-load 'copilot
  ;;   (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  ;;   (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  ;;   (define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
  ;;   (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word))

  ;; (add-hook 'prog-mode-hook 'copilot-mode)

  ;; (setq-default copilot-indent-offset-warning-disable t)

  ;;(setq default-input-method nil)

  ;; ============================================================
  ;; macOS input source auto-switch (macism, no extra packages)
  ;; ============================================================
  (when (and (eq system-type 'darwin)
             (executable-find "macism"))

    (defvar ez/im-english "com.apple.keylayout.ABC")
    (defvar ez/im-cooldown 0.05)
    (defvar ez/im--last-switch 0)

    (defun ez/im-switch-to-english ()
      (let ((now (float-time)))
        (when (> (- now ez/im--last-switch) ez/im-cooldown)
          (setq ez/im--last-switch now)
          (start-process "macism" nil "macism" ez/im-english))))

    ;; Evil: switch to English when leaving insert mode
    (add-hook 'evil-insert-state-exit-hook #'ez/im-switch-to-english)
    (add-hook 'evil-normal-state-entry-hook #'ez/im-switch-to-english)
    ;; Switch to English after C-g / ESC
    (advice-add 'keyboard-quit :after (lambda (&rest _) (ez/im-switch-to-english)))
    (advice-add 'keyboard-escape-quit :after (lambda (&rest _) (ez/im-switch-to-english)))
    ;; Minibuffer / isearch
    (add-hook 'minibuffer-setup-hook #'ez/im-switch-to-english)
    (add-hook 'isearch-mode-hook #'ez/im-switch-to-english)
    ;; Switch to English when frame gains focus (except in insert mode)
    (add-hook 'focus-in-hook
              (lambda ()
                (when (not (eq evil-state 'insert))
                  (ez/im-switch-to-english))))
    ;; Shell environments
    (dolist (hook '(shell-mode-hook eshell-mode-hook))
      (add-hook hook #'ez/im-switch-to-english))
    (with-eval-after-load 'term
      (add-hook 'term-mode-hook #'ez/im-switch-to-english))
    (with-eval-after-load 'vterm
      (add-hook 'vterm-mode-hook #'ez/im-switch-to-english))
    ;; Treemacs
    (with-eval-after-load 'treemacs
      (add-hook 'treemacs-mode-hook #'ez/im-switch-to-english)
      (when (boundp 'window-selection-change-functions)
        (add-hook 'window-selection-change-functions
                  (lambda (_frame)
                    (when (eq major-mode 'treemacs-mode)
                      (ez/im-switch-to-english))))))
    ;; Magit
    (with-eval-after-load 'magit
      (add-hook 'magit-mode-hook #'ez/im-switch-to-english)))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(connection-local-criteria-alist
     '(((:application tramp :protocol "flatpak")
        tramp-flatpak-connection-local-default-profile)
       ((:application tramp :protocol "kubernetes")
        tramp-kubernetes-connection-local-default-profile)
       ((:application eshell) eshell-connection-default-profile)
       ((:application tramp :machine "localhost")
        tramp-connection-local-darwin-ps-profile)
       ((:application tramp :machine "Elvins-MacBook-Pro.local")
        tramp-connection-local-darwin-ps-profile)
       ((:application tramp) tramp-connection-local-default-system-profile
        tramp-connection-local-default-shell-profile)))
   '(connection-local-profile-alist
     '((tramp-flatpak-connection-local-default-profile
        (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin"
                           "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin"
                           "/local/bin" "/local/freeware/bin" "/local/gnu/bin"
                           "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin"
                           "/opt/bin" "/opt/sbin" "/opt/local/bin"))
       (tramp-kubernetes-connection-local-default-profile
        (tramp-config-check . tramp-kubernetes--current-context-data)
        (tramp-extra-expand-args 97
                                 (tramp-kubernetes--container
                                  (car tramp-current-connection))
                                 104
                                 (tramp-kubernetes--pod
                                  (car tramp-current-connection))
                                 120
                                 (tramp-kubernetes--context-namespace
                                  (car tramp-current-connection))))
       (eshell-connection-default-profile (eshell-path-env-list))
       (tramp-connection-local-darwin-ps-profile
        (tramp-process-attributes-ps-args "-acxww" "-o"
                                          "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                          "-o" "state=abcde" "-o"
                                          "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
        (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                            (user . string) (egid . number)
                                            (comm . 52) (state . 5)
                                            (ppid . number) (pgrp . number)
                                            (sess . number) (ttname . string)
                                            (tpgid . number) (minflt . number)
                                            (majflt . number)
                                            (time . tramp-ps-time) (pri . number)
                                            (nice . number) (vsize . number)
                                            (rss . number) (etime . tramp-ps-time)
                                            (pcpu . number) (pmem . number) (args)))
       (tramp-connection-local-busybox-ps-profile
        (tramp-process-attributes-ps-args "-o"
                                          "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                          "-o" "stat=abcde" "-o"
                                          "ppid,pgid,tty,time,nice,etime,args")
        (tramp-process-attributes-ps-format (pid . number) (user . string)
                                            (group . string) (comm . 52)
                                            (state . 5) (ppid . number)
                                            (pgrp . number) (ttname . string)
                                            (time . tramp-ps-time) (nice . number)
                                            (etime . tramp-ps-time) (args)))
       (tramp-connection-local-bsd-ps-profile
        (tramp-process-attributes-ps-args "-acxww" "-o"
                                          "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                          "-o"
                                          "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
        (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                            (user . string) (egid . number)
                                            (group . string) (comm . 52)
                                            (state . string) (ppid . number)
                                            (pgrp . number) (sess . number)
                                            (ttname . string) (tpgid . number)
                                            (minflt . number) (majflt . number)
                                            (time . tramp-ps-time) (pri . number)
                                            (nice . number) (vsize . number)
                                            (rss . number) (etime . number)
                                            (pcpu . number) (pmem . number) (args)))
       (tramp-connection-local-default-shell-profile (shell-file-name . "/bin/sh")
                                                     (shell-command-switch . "-c"))
       (tramp-connection-local-default-system-profile (path-separator . ":")
                                                      (null-device . "/dev/null"))))
   '(package-selected-packages
     '(ac-ispell ace-jump-helm-line ace-link ace-pinyin ace-window aggressive-indent
                 alert all-the-icons anaconda-mode anzu async auto-compile
                 auto-complete auto-dictionary auto-highlight-symbol
                 auto-yasnippet avy bind-key bind-map browse-at-remote bui ccls
                 centered-cursor-mode clang-format claude-code-ide
                 clean-aindent-mode color-theme-sanityinc-tomorrow
                 column-enforce-mode company company-anaconda company-box
                 company-c-headers company-emoji company-go company-quickhelp
                 company-rtags company-shell company-statistics company-tern
                 company-web concurrent counsel counsel-projectile csv-mode ctable
                 cython-mode dactyl-mode dap-mode dash dash-functional deferred
                 define-word diff-hl diminish disaster doom-modeline doom-themes
                 dotenv-mode dracula-theme dumb-jump editorconfig elisp-slime-nav
                 emmet-mode emoji-cheat-sheet-plus emojify epc epl esh-help
                 eshell-prompt-extras eshell-z eval-sexp-fu evil evil-anzu
                 evil-args evil-cleverparens evil-ediff evil-escape evil-exchange
                 evil-goggles evil-iedit-state evil-indent-plus evil-lion
                 evil-lisp-state evil-magit evil-matchit evil-mc
                 evil-nerd-commenter evil-numbers evil-org evil-surround
                 evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar
                 expand-region eyebrowse eziam-theme f fancy-battery
                 fill-column-indicator find-by-pinyin-dired fish-mode flx flx-ido
                 flycheck flycheck-bashate flycheck-gometalinter flycheck-pos-tip
                 flycheck-rtags flyspell-correct flyspell-correct-helm font-lock+
                 frame-local fringe-helper fuzzy ggtags gh-md git-commit
                 git-gutter git-gutter+ git-gutter-fringe git-gutter-fringe+
                 git-link git-messenger git-timemachine gitattributes-mode
                 gitconfig-mode github-modern-theme gitignore-mode gntp gnuplot
                 go-eldoc go-fill-struct go-gen-test go-guru go-impl go-mode
                 go-rename go-tag godoctor golden-ratio google-c-style
                 google-translate goto-chg haml-mode helm helm-ag helm-c-yasnippet
                 helm-company helm-core helm-css-scss helm-descbinds helm-flx
                 helm-gitignore helm-lsp helm-make helm-mode-manager
                 helm-projectile helm-purpose helm-pydoc helm-rtags helm-swoop
                 helm-themes helm-xref hierarchy highlight-indentation
                 highlight-numbers highlight-parentheses hl-todo ht htmlize
                 hungry-delete hydra idea-darkula-theme iedit imenu-list
                 impatient-mode importmagic indent-guide insert-shebang
                 intellij-theme ivy jazz-theme js-doc js2-mode js2-refactor
                 json-mode json-navigator json-reformat json-snatcher link-hint
                 live-py-mode livid-mode log4e lorem-ipsum lsp-mode lsp-treemacs
                 lsp-ui lv macrostep magit magit-gitflow magit-popup magit-svn
                 markdown-mode markdown-toc memoize mmm-mode monokai-theme
                 move-text multi-term multiple-cursors mwim nameless neotree
                 open-junk-file org-brain org-bullets org-category-capture
                 org-download org-mime org-plus-contrib org-pomodoro org-present
                 org-projectile org-ql org-super-agenda organic-green-theme orgit
                 ov overseer ox-pandoc package-lint packed pandoc-mode
                 pangu-spacing paradox paredit parent-mode password-generator
                 pcre2el peg persistent-scratch persp-mode pfuture pinyinlib
                 pip-requirements pipenv pippel pkg-info plantuml-mode popup
                 popwin pos-tip powerline projectile pug-mode py-isort pyenv-mode
                 pyim pyim-basedict pytest pythonic pyvenv rainbow-delimiters
                 request restart-emacs rtags rust-mode s sass-mode scss-mode
                 shell-pop simple-httpd skewer-mode slim-mode smartparens smeargle
                 solarized-theme spaceline spaceline-all-the-icons spinner
                 sql-indent string-inflection swiper symon tagedit
                 tango-plus-theme tern tide toc-org transient treemacs
                 treemacs-all-the-icons treemacs-evil treemacs-magit
                 treemacs-projectile ts typescript-mode undo-tree unfill
                 use-package uuidgen vi-tilde-fringe vimrc-mode
                 volatile-highlights vterm web-beautify web-completion-data
                 web-mode web-server websocket which-key window-purpose winum
                 with-editor writeroom-mode ws-butler xr xterm-color yaml-mode
                 yapfify yasnippet yasnippet-snippets yatemplate))
   '(safe-local-variable-values
     '((eval let*
             ((root
               (or (locate-dominating-file default-directory "pyproject.toml")
                   default-directory))
              (poetry (or (executable-find "poetry") "poetry"))
              (venv-path
               (ignore-errors (car (process-lines poetry "env" "info" "--path"))))
              (flake8-bin
               (and venv-path (expand-file-name "bin/flake8" venv-path))))
             (when (and flake8-bin (file-executable-p flake8-bin))
               (setq flycheck-python-flake8-executable flake8-bin)))
       (eval let*
             ((venv-path
               (string-trim (shell-command-to-string "poetry env info --path")))
              (flake8-bin (concat venv-path "/bin/flake8")))
             (setq flycheck-python-flake8-executable flake8-bin))
       (typescript-backend . tide) (typescript-backend . lsp)
       (javascript-backend . tide) (javascript-backend . tern)
       (javascript-backend . lsp))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
  )
