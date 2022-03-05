(define feature-type cadr)
(define (feature-valued? feature) (not (null? (cddr feature))))
(define (feature-interpretable? feature) (eq? (car feature) 'i))
(define (feature-value feature) (if (feature-valued? feature)
                                    (caddr feature)
                                    '()))

(define (make-feature interpretable type . values)
  (if (null? values)
      (list (if interpretable 'i 'u) type)
      (list (if interpretable 'i 'u) type
            (if (null? (cdr values))
                (car values)
                (error
                 "Expected (make-feature interpretable type <value>)")))))

(define (feature-match? feature1 feature2)
  (and (eq? (feature-type feature1) (feature-type feature2))
       (or (and
            (and (feature-interpretable? feature1)
                 (feature-valued? feature1))
            (and (not (feature-interpretable? feature2))
                 (not (feature-valued? feature2))))
           (and
            (and (feature-interpretable? feature2)
                 (feature-valued? feature2))
            (and (not (feature-interpretable? feature1))
                 (not (feature-valued? feature1)))))))

(define (matching-features feature-list-1 feature-list-2)
  (if (null? feature-list-1)
      '()
      (let* ([feature (car feature-list-1)]
             [first-feature-match
              (let loop ([features feature-list-2])
                (cond
                 [(null? features) #f]
                 [(feature-match? feature (car features))
                  (cons feature (car features))]
                 [else (loop (cdr features))]))])
        (if first-feature-match
            (cons first-feature-match (matching-features (cdr feature-list-1) feature-list-2))
            (matching-features (cdr feature-list-1) feature-list-2)))))
