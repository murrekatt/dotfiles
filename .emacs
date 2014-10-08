;; ----------------------------------------------------------------------------
;; ----------------------------------------------------------------------------

;; Set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

;; Add to load path
(setq load-path (cons (expand-file-name "~/.emacs.d/packages/") load-path))

;; Enable column numbers
(column-number-mode t)

;; Backup files into own directory
(setq backup-directory-alist '(("." . "~/.saves")))
;; Backup by copying
(setq backup-by-copying t)
;; Preserve several versions as backup
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Goto-line short-cut key
(global-set-key "\M-l" 'goto-line)
;; Re-map navigate word forward
;;(global-set-key "\C-f" 'forward-word)
;; Re-map navigate word backward
;;(global-set-key "\C-d" 'backward-word)
;; Re-map dekete word forward
(global-set-key "\C-q" 'kill-word)
;; Re-map dekete word backward
(global-set-key "\C-w" 'backward-kill-word)

(require 'autoinsert)
(auto-insert-mode t)

;; Remove ending newline for all skeletons
(setq skeleton-end-newline nil)

;; File template for C++ header files
(define-skeleton hpp-skeleton
  "C++ header skeleton" nil
  '(setq namespaces '())
  '(setq ns (read-string "Namespace: "))
  '(while (string< "" ns)
     (add-to-list 'namespaces ns)
     (setq ns (read-string "Namespace: "))
     )
  '(setq namespaces (reverse namespaces))
  '(setq header_guard "")
  '(dotimes (index (list-length namespaces))
     (setq header_guard (concat header_guard (upcase (nth index namespaces))))
     (if (< index (list-length (butlast namespaces 1)))
	 (setq header_guard (concat header_guard "_"))
       )
     )
  '(setq name (replace-regexp-in-string "\\." "_" (buffer-name)))
  (insert (concat "#ifndef " header_guard "\n"))
  (insert (concat "#define " header_guard "\n\n\n"))
  (insert (concat "#endif // " header_guard "\n"))
  (previous-line)
  (previous-line)
  '(dotimes (index (list-length namespaces))
     (insert (concat "namespace " (nth index namespaces) "\n{\n"))
     (insert (concat "} // namespace " (nth index namespaces) "\n"))
     (previous-line)
     )
  (newline)
  (previous-line)
  )
(define-auto-insert "\\.\\([Cc]\\|hxx\\|hpp\\)\\'" 'hpp-skeleton)

;; File template for C++ header files
(define-skeleton cpp-skeleton
  "C++ source skeleton" nil
  '(setq namespaces '())
  '(setq ns (read-string "Namespace: "))
  '(while (string< "" ns)
     (add-to-list 'namespaces ns)
     (setq ns (read-string "Namespace: "))
     )
  '(setq namespaces (reverse namespaces))
  '(setq name (replace-regexp-in-string "\\...." ".hpp" (buffer-name)))
  (insert (concat "#include \"" name "\"\n\n"))
  '(dotimes (index (list-length namespaces))
     (insert (concat "namespace " (nth index namespaces) "\n{\n"))
     (insert (concat "} // namespace " (nth index namespaces) "\n"))
     (previous-line)
     )
  (newline)
  (previous-line)
  )
(define-auto-insert "\\.\\([Cc]\\|cpp\\|cxx\\|cc\\)\\'" 'cpp-skeleton)

;; ----------------------------------------------------------------------------
;; C++
;; http://www.emacswiki.org/emacs/IndentingC
(require 'cc-mode)

(defun my-build-tab-stop-list (width)
(let ((num-tab-stops (/ 80 width))
 (counter 1)
 (ls nil))
 (while (<= counter num-tab-stops)
   (setq ls (cons (* width counter) ls))
   (setq counter (1+ counter)))
 (set (make-local-variable 'tab-stop-list) (nreverse ls))))

(defun my-c-mode-common-hook ()
(setq tab-width 4)
(my-build-tab-stop-list tab-width)
(setq c-basic-offset tab-width)
(setq indent-tabs-mode nil)) ;; force only spaces for indentation
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; highlight lines over 80 characters long
(add-hook 'find-file-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-green-b)))

;; personal preferences
(c-set-offset 'cpp-define-intro' 0)
;;(c-set-offset 'defun-block-intro' 0)
(c-set-offset 'substatement-open' 0)
(c-set-offset 'statement-case-open' 0)
(c-set-offset 'case-label '+)
(c-set-offset 'arglist-cont-nonempty '+)
(c-set-offset 'arglist-intro '+)
(c-set-offset 'innamespace '0)
(c-set-offset 'topmost-intro '0)
(c-set-offset 'topmost-intro-cont '0)
(c-set-offset 'cpp-define-intro '+)
(c-set-offset 'brace-list-open '0)
(c-set-offset 'label '0)
;;(c-set-offset 'arglist-cont-nonempty 8)
(c-set-offset 'arglist-intro '+)

;; Enable global font lock
(global-font-lock-mode t)

;; ----------------------------------------------------------------------------
;; CMake
(require 'cmake-mode)
  (setq auto-mode-alist
        (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist))

;; ----------------------------------------------------------------------------
;; Google Protobuf
(require 'protobuf-mode)
  (setq auto-mode-alist
        (append '(("\\.proto\\'" . protobuf-mode))
                auto-mode-alist))

(require 'go-mode)
