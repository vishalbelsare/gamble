;; Copyright (c) 2014 Ryan Culpepper
;; Released under the terms of the 2-clause BSD license.
;; See the file COPYRIGHT for details.

#lang racket/base
(require racket/class
         "../interfaces.rkt")
(provide (all-defined-out)
         Info)

;; ============================================================

(define mh-transition<%>
  (interface ()
    run  ;; (-> A) Trace -> (cons (U Trace #f) TxInfo)
    accinfo ;; -> AccInfo
    ))

;; A TxInfo
;; - (vector 'delta DB)          -- delta db
;; - (vector 'slice Real Real)   -- slice w/ interval bounds
;; - #f

;; ============================================================

(define proposal<%>
  (interface ()
    propose1 ;; Key Zones Dist Value -> (U (cons Value Real) #f)
    propose2 ;; Key Zones Dist Dist Value -> (U (list* Value Real Real) #f)
    accinfo  ;; -> AccInfo
    feedback ;; Key Boolean -> Void
    ))

(define (proposal? x)
  (is-a? x proposal<%>))
