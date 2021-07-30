(define pcui (js-eval "pcui"))

(define (:dom arg)
  (.. arg `dom))

(define repl-button (js-new "pcui.Button"))

(define repl-button-style '(("top" . "32.0rem")
			    ("width" . "7.0rem")
			    ("height" . "3.0rem")
			    ("position" . "absolute")))

(define repl-box (js-new "pcui.TextAreaInput"))

(define repl-box-style '(("height" . "30.0rem")
			 ("width" . "25%")
			 ("position" . "absolute")))

(define (apply-style! element style-list)
  (for-each (lambda (style)
	      (set-style! element
			  (car style) (cdr style))) style-list))

(apply-style! (:dom repl-button) repl-button-style)
(apply-style! (:dom repl-box) repl-box-style)

(element-append-child! (getelem "body") (:dom repl-box))
(element-append-child! (getelem "body") (:dom repl-button))

(element-write-attribute! repl-box "value" box-script)
(element-write-attribute! repl-button "text" "Run!")

(define (repl-text)
  (.. repl-box `value))

(define (submit . args)
  (run-scheme (repl-text)))

(js-set! (:dom repl-button) "onclick" (js-closure submit))

(submit)

(define biwa-logo (js-new "Image"))

(define biwa-logo-style '(("left" . "80%")
			  ("position" . "absolute")
			  ("opacity" . "0.5")))

(element-write-attribute! biwa-logo
			  "src" "https://www.biwascheme.org/website/images/biwascheme_logo.png")

(apply-style! biwa-logo biwa-logo-style)

(element-append-child! (getelem "body") biwa-logo)
