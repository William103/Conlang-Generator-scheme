(define-library node
  (import scheme
          features
          (chicken base)
          (srfi 1))
  (export node?
          node-features
          node-type
          node-unvalued-features
          node-uninterpretable-features
          make-node)
  (begin
    (define (node? node)
      (and (list? node) (symbol? (car node)) (list? (cdr node))))
    (define node-features cdr)
    (define node-type car)
    (define (node-unvalued-features node)
      (filter (compose not feature-valued?) (node-features node)))
    (define (node-uninterpretable-features node)
      (filter (compose not feature-interpretable?) (node-features node)))
    (define (make-node type . features)
      (apply list (cons type features)))))
