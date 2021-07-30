;; I will be commenting these for people who are new to BiwaScheme

;; JavaScript: var express = require('express')
(define express (node-require "express"))

;;JavaScript: var app = express()
(define app (express))

;; JavaScript: app.use(express.static('..'));
;; is the same as
;; BiwaScheme: (.. app `(use ,(.. express `(static ".."))))
;; but we're going to make it look nice with helper functions

;;JavaScript: arg.use(static-directory)
(define (set-directory! arg static-directory)
  (js-invoke arg "use" static-directory))

;;JavaScript: express.static(path-string)
(define (get-static-directory path-string)
  (js-invoke express "static" path-string))

;;JavaScript: arg.listen(port)
(define (start-server arg port)
  (js-invoke arg "listen" port))

;; And finally our actual logic

;; Serve the directory one file up from this scm file
(define path (get-static-directory ".."))

(define server-port 5000)

(set-directory! app path)

(define server (start-server app server-port))

(display
 (string-append "Server started on port: "
		(number->string server-port)))

;; If you'd like to make it customizable which port you host using
;; command-line arguments, Yutaka Hara has implemented macros for
;; that as well. (command-line) returns a Scheme list equivalent
;; of JavaScript process.argv, so I could do
;; (define server-port (list-ref (command-line) 3))
;; and then run "biwas express-server.scm 5000" at the
;; command-line

;; Note that anything that doesn't exist already can be
;; defined by you. If Hara hadn't made (command-line),
;; you could make it yourself:
;; (define (command-line)
;;    (js-array->list (js-eval "process.argv")))

;; It's up to you to bend BiwaScheme as you need

;; If you don't know how macros work, learn (define-macro
;; It will change your life
