;; Define important variables
;; and js-interop abstractions

(load "./Scheme/dictionary.scm")
(load "./Scheme/box-spin-text.scm")
(load "./Scheme/repl.scm")
(load "./Scheme/repl-ui.scm")

;; Attach update function to game loop
(.. pc-app `(on "update" ,(js-closure update-playcanvas)))

(console-log "Scheme initialized!")
