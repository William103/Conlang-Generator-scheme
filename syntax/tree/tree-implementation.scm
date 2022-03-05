(define (merge a b) (cons a b))

(define (match-features probe goal)
  (let* ([probe-features (node-features probe)]
         [goal-features (node-features goal)]
         [common (matching-features probe-features goal-features)])
    (apply make-node
           (cons (node-type goal)
                 (let loop ([features '()] [common common])
                   (if (null? common)
                       features
                       (let ([feature (car common)])
                         (loop
                          (cons
                           (make-feature
                            (feature-interpretable? (car feature))
                            (feature-type (car feature))
                            (feature-value (cdr feature)))
                           features)
                          (cdr common)))))))))

(define (agree tree)
  (let ([probe (car tree)])
    (let loop ([current (cdr tree)])
      (cond
       [(pair? current)
        (cons (loop (car current))
              (loop (cdr current)))]
       [(node? current)
        (match-features probe current)]
       [else (error "something weird happened")]))))
