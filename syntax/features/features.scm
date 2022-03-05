(define-library features
  (import scheme
          (chicken base))
  (export feature-type
          feature-valued?
          feature-interpretable?
          feature-value
          make-feature
          feature-match?
          matching-features)
  (include "./syntax/features/features-implementation.scm"))
