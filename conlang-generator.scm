(define-library conlang-generator
  (import scheme tree features node)
  (begin
    (display
     (match-features
      (make-node 'V (make-feature #f 'tense) (make-feature #f 'mood))
      (make-node 'T (make-feature #t 'tense 'present)
                 (make-feature #t 'mood 'subjunctive))))
    (newline)))
