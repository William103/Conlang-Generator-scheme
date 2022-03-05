(define-library tree
  (import scheme node features (chicken base))
  (export merge agree match-features)
  (include "./syntax/tree/tree-implementation.scm"))
