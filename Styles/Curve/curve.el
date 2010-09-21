;;; curve.el --- AUC-TeX style file for CurVe

;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 Didier Verna.

;; Author:        Didier Verna <didier@lrde.epita.fr>
;; Maintainer:    Didier Verna <didier@lrde.epita.fr>
;; Created:       Tue Apr 18 14:49:29 2000
;; Last Revision: Wed Jul 18 17:28:55 2007
;; Keywords:      tex abbrev data

;; This file is part of CurVe.

;; CurVe may be distributed and/or modified under the
;; conditions of the LaTeX Project Public License, either version 1.1
;; of this license or (at your option) any later version.
;; The latest version of this license is in
;; http://www.latex-project.org/lppl.txt
;; and version 1.1 or later is part of all distributions of LaTeX
;; version 1999/06/01 or later.

;; CurVe consists of all files listed in the file `README'.


;;; Commentary:

;; Contents management by FCM version 0.1-b2.


;;; Code:

(defun curve-rubric-file (optional &optional prompt)
  "Prompt for a CurVe rubric filename in the current directory.

Caution: because of the flavor mechanism of CurVe, this function will use
the choosen  file name sans the last TWO extensions."
  (TeX-argument-insert
   (file-name-sans-extension
    (file-name-sans-extension
     (read-file-name (TeX-argument-prompt optional
					  prompt "Rubric file")
		     "" "" nil)))
   optional))

(defun curve-rubric-item ()
  ;; Ideally, we should have a way (like, a prefix) to specify either an
  ;; entry, an entry* or a subrubric. But that would require to hack AUC-TeX
  ;; in order to pass an optional argument to LaTeX-insert-item.
  (TeX-insert-macro "entry*"))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq LaTeX-item-list
		  (cons '("rubric" . curve-rubric-item) LaTeX-item-list))))


(TeX-add-style-hook "curve"
  (function
   (lambda ()
     (TeX-add-symbols
      '("photo" [ "Placement (l, c or r)" ] t)
      '("photosep")
      '("photoscale" t)
      '("leftheader" t)
      '("rightheader" t)
      '("headerscale" t)
      '("headerspace")
      '("makeheaders" [ "Alignment (t, c or b)" ])

      ;; no need to support \today since it is a standard command
      '("title" "Title")
      '("subtitle" "Subtitle")
      '("titlespace")
      '("titlefont" "Font for title")
      '("titlealignment" "Alignment (l, c, r)")
      '("subtitlefont" "Font for subtitle")
      '("maketitle")

      '("flavor" "Flavor")
      '("makerubric" curve-rubric-file)

      '("rubricalignment" "Alignment (l, c, r, cl, cc)")
      '("rubricfont" "For for rubrics")
      '("rubricspace")
      '("rubricafterspace")

      '("subrubric" "Subrubric name")
      '("subrubricalignment" "Alignment (l, c, r, cl, cc)")
      '("subrubricfont" "Font for subrubrics")
      '("subrubricspace")
      '("subrubricbeforespace")

      '("entry"  [ "Key" ] t)
      '("entry*" [ "Key" ])
      '("noentry" "Invisible (long) key")
      '("keyfont" "Font for keys")
      '("keyalignment" "Alignment (l, c, or r)")
      '("prefix" "Prefix command")

      '("continuedname" "Continuation name")
      '("listpubname" "List of publications name"))
     (LaTeX-add-environments
      '("rubric" "Name")))))




;;; Local variables:
;;; eval: (put 'TeX-add-style-hook 'lisp-indent-function 1)
;;; End:

;;; curve.el ends here
