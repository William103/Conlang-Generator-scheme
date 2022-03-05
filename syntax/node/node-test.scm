#! /usr/bin/chicken-csi -script

(import node features (srfi 64))

(test-begin "node-test")

(define cat (make-node 'CAT))
(test-assert "node cat" (node? cat))
(test-eq "node-features cat" '() (node-features cat))
(test-eq "node-type cat" 'CAT (node-type cat))
(test-eq "node-unvalued-features cat" '() (node-unvalued-features cat))
(test-eq "node-uninterpretable-features cat" '() (node-uninterpretable-features cat))

(define t (make-node 'T
                     (make-feature #t 'tense 'present)
                     (make-feature #f 'number)
                     (make-feature #f 'person)))
(test-assert "node t" (node? t))
(test-equal "node-features t"
  (list (make-feature #t 'tense 'present)
        (make-feature #f 'number)
        (make-feature #f 'person))
  (node-features t))
(test-eq "node-type t" 'T (node-type t))
(test-equal "node-unvalued-features t"
  (list (make-feature #f 'number)
        (make-feature #f 'person))
  (node-unvalued-features t))
(test-equal "node-uninterpretable-features t"
  (list (make-feature #f 'number)
        (make-feature #f 'person))
  (node-uninterpretable-features t))

(test-end)
