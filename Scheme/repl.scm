(define scheme-interpreter (js-new "BiwaScheme.Interpreter"))

(define (run-scheme str)
  (.. scheme-interpreter `(evaluate ,str)))
