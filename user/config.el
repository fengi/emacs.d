;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom libs
(setq load-path (cons (expand-file-name "~/.emacs.d/user/rails-reloaded") load-path))
(require 'rails-autoload)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom functions

;; Buffer wechseln wie click auf modeline, aber mit tasten...
(defun ska-previous-buffer ()
  "Hmm, to be frank, this is just the same as bury-buffer.
     Used to wander through the buffer stack with the keyboard."
  (interactive)
  (bury-buffer))

(defun ska-next-buffer ()
  "Cycle to the next buffer with keyboard."
  (interactive)
  (let* ((bufs (buffer-list))
         (entry (1- (length bufs)))
         val)
    (while (not (setq val (nth entry bufs)
                      val (and (/= (aref (buffer-name val) 0)
                                   ? )
                               val)))
      (setq entry (1- entry)))
    (switch-to-buffer val)))

(defun my-git-status ()
  "split and run git-status."
  (interactive)
  (split-window-vertically 12)
  (magit-status default-directory))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom key bindings

;; jump through windows using <shift>+[up|down|left|right]
(windmove-default-keybindings)
(global-set-key [(ctrl c) (left)]  'windmove-left)
(global-set-key [(ctrl c) (right)] 'windmove-right)
(global-set-key [(ctrl c) (up)]    'windmove-up)
(global-set-key [(ctrl c) (down)]  'windmove-down)

;; Buffer cycling key bindings
(global-set-key [(ctrl >)] 'ska-next-buffer)
(global-set-key [(ctrl <)] 'ska-previous-buffer)

(global-set-key "\C-cm" 'menu-bar-mode)
(global-set-key "\C-cl" 'goto-line)
(global-set-key "\C-ct" 'toggle-truncate-lines)
(global-set-key "\M-#"  'shell-command-on-region)
(global-set-key [(ctrl c) (b)] 'comment-box)
(global-set-key [(ctrl c) (c)] 'comment-region)
(global-set-key [(ctrl tab)] 'hippie-expand)
(global-set-key [(ctrl c) (g)] 'my-git-status)
(global-set-key [(ctrl c) (i)] 'ispell-change-dictionary)
(global-set-key "\C-c," 'rails/goto)
(global-set-key [(ctrl |)] 'linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom look
(set-foreground-color "white")
(set-background-color "black")
(set-cursor-color "light grey")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load auto-complete
(add-to-list 'load-path "~/.emacs.d/user/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/user/ac-dict")
(ac-config-default)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; turn on icy-mode
;(setq load-path (cons (expand-file-name "~/.emacs.d/user/icicles") load-path))
;(require 'icicles)
;(icy-mode 1)
