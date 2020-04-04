(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("evince" "TeX-evince-sync-view"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(inhibit-startup-screen t)
 '(setq-default indent-tabs-mode)
 '(show-paren-mode t)
 '(tramp-default-method "scp"))

(global-set-key (kbd "C-x g") 'magit-status)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Emacs setup for following coding guidelines
;; http://astropy.readthedocs.org/en/latest/development/codeguide_emacs.html
;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)
;; Set the number to the number of columns to use.
(setq-default fill-column 79)
;; Add Autofill mode to mode hooks.
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; Show line number in the mode line.
(line-number-mode 1)
;; Show column number in the mode line.
(column-number-mode 1)
;; Syntax highlighting
(global-font-lock-mode 1)

;; Packages
(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line


;; LaTeX/AUCTeX stuff
(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o")

(setq tramp-verbose 10)
;;(setq tramp-ssh-controlmaster-options
;;      (concat
;;        "-o ControlPath=/tmp/ssh-ControlPath-%%r@%%h:%%p "
;;        "-o ControlMaster=auto -o ControlPersist=yes"))
(setq tramp-password-prompt-regexp
 (concat
  "^.*"
  (regexp-opt
   '("Passphrase" "passphrase"
     "Password" "password"
     "Passcode" "passcode") t)
  ".*:\0? *"))
(setq tramp-use-ssh-controlmaster-options nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
