;;melpa package include
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
 
(require 'evil)
(evil-mode 1)
(require 'powerline)
(require 'powerline-evil)
(powerline-default-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))


(defun single-line-comment ()
  (interactive)
  (let ((block-comment-token ";; "))
    (back-to-indentation)
    (insert block-comment-token)))

(evil-define-operator visual-line-comment (beg end)
  (let ((block-comment-token ";; "))
    (setq num-lines (count-lines beg end))
    (goto-char beg)
    (beginning-of-line)
    (dotimes (i num-lines)
      (insert block-comment-token)
      (forward-line))
    num-lines))

(evil-define-operator visual-line-uncomment (beg end)
  (let ((block-comment-token ";; "))
    (setq num-lines (count-lines beg end))
    (goto-char beg)
    (beginning-of-line)
    (dotimes (i num-lines)
      (delete-char (length block-comment-token))
      (forward-line))
    num-lines))

(evil-define-operator are-all-lines-block-comments (beg end)
  (let ((block-comment-token ";; ")
	(lines-commented t))
    (setq num-lines (count-lines beg end))
    (goto-char beg)
    (dotimes (i num-lines)
      (beginning-of-line)
      (setq lines-commented
	    (and (search-forward block-comment-token (line-end-position) t)
		 lines-commented))
      (forward-line))
    lines-commented))

(evil-define-operator toggle-block-comment (beg end)
  (if (are-all-lines-block-comments beg end)
      (visual-line-uncomment beg end)
    (visual-line-comment beg end))
  (evil-visual-make-selection beg (1- end)))

(evil-define-key 'visual (current-global-map)
  (kbd "C-/") 'toggle-block-comment)

(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "C-/") 'single-line-comment)
(define-key evil-insert-state-map (kbd "C-SPC") 'dabbrev-expand)
(define-key evil-visual-state-map (kbd "C-/") 'visual-line-comment)
(define-key evil-insert-state-map (kbd "C-/") 'single-line-comment)
