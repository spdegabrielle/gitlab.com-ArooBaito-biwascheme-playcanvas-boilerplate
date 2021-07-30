(define box-script  "(clear-update-list!)

  (define box (find-entity \"Model\"))

  (define (rotate entity . args)
    (.. entity `(rotate ,@args)))

  (define (translate entity . args)
    (.. entity `(translate ,@args)))

  (define (is-pressed? key)
    (.. pc-app `keyboard `(isPressed ,(.. `pc key))))

  (define (box-update)
    (rotate box 0 (* delta-time 10) 0)
    
    (when (is-pressed? 'KEY_W)
      (translate box 0 (* delta-time 2) 0))
    
    (when (is-pressed? 'KEY_S)
      (translate box 0 (* delta-time -2) 0)))

  (add-to-update! box-update)")
