;; Define some useful dictionary functions and variables
;; to abstract js-interop

(define window (js-eval "window"))
(define pc-app (.. `pc `app))
(define scene-root (.. `pc `app `root))

(define (find-entity name)
  (.. scene-root `(findByName ,name)))

(define delta-time 0)
(define ms-since-last 0)

(define (calculate-delta-time)
  (let ((curr-time (.. pc-app `_time)))
    (set! delta-time
	  (/ (- curr-time ms-since-last) 1000))))

(define update-list (list calculate-delta-time))

(define (update-playcanvas . args)
  (for-each (lambda (func)
	      (func)) update-list)
  (set! ms-since-last (.. pc-app `_time)))

(define (add-to-update! func)
  (set! update-list
	(append update-list (list func))))

(define (clear-update-list!)
  (set! update-list (list calculate-delta-time)))
