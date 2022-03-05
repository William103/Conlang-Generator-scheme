#! /usr/bin/chicken-csi -script

(import features (srfi 64))

(test-begin "features-test")

(define epp (make-feature #t 'EPP))
(test-eq "epp valued" #f (feature-valued? epp))
(test-eq "epp value" '() (feature-value epp))
(test-eq "epp interpretable" #t (feature-interpretable? epp))
(test-eq "epp type" 'EPP (feature-type epp))

(define tense (make-feature #t 'tense 'present))
(test-eq "tense valued" #t (feature-valued? tense))
(test-eq "tense value" 'present (feature-value tense))
(test-eq "tense interpretable" #t (feature-interpretable? tense))
(test-eq "tense type" 'tense (feature-type tense))

(define case (make-feature #f 'case))
(test-eq "case valued" #f (feature-valued? case))
(test-eq "case value" '() (feature-value case))
(test-eq "case interpretable" #f (feature-interpretable? case))
(test-eq "case type" 'case (feature-type case))

(test-assert "feature-match?"
  (feature-match?
   (make-feature #f 'case)
   (make-feature #t 'case 'nominative)))

(define det
  (list (make-feature #f 'case)
        (make-feature #f 'number)
        (make-feature #f 'gender)))

(define noun
  (list (make-feature #f 'case)
        (make-feature #t 'gender 'neuter)
        (make-feature #t 'number 'singular)))

(test-equal "matching-features"
  (list (cons (make-feature #f 'number)
              (make-feature #t 'number 'singular))
        (cons (make-feature #f 'gender)
              (make-feature #t 'gender 'neuter)))
  (matching-features det noun))

(test-end)
