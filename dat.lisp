;;; Compiled by f2cl version:
;;; ("f2cl1.l,v 2bc8b118fd29 2011/12/02 22:01:32 toy $"
;;;  "f2cl2.l,v 96616d88fb7e 2008/02/22 17:19:34 rtoy $"
;;;  "f2cl3.l,v 96616d88fb7e 2008/02/22 17:19:34 rtoy $"
;;;  "f2cl4.l,v 96616d88fb7e 2008/02/22 17:19:34 rtoy $"
;;;  "f2cl5.l,v 2bc8b118fd29 2011/12/02 22:01:32 toy $"
;;;  "f2cl6.l,v 1d5cbacbb977 2008/08/23 20:56:27 rtoy $"
;;;  "macros.l,v fceac530ef0c 2011/11/25 20:02:26 toy $")

;;; Using Lisp SBCL 1.0.54
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing t) (:declare-common nil)
;;;           (:float-format single-float))

(in-package :common-lisp-user)


(defun sla_dat (utc)
  (declare (type (double-float) utc))
  (prog ((dt 0.0d0) (sla_dat 0.0d0))
    (declare (type (double-float) sla_dat dt))
    (cond (f2cl-lib:%false%) ((>= utc 56109.0d0) (setf dt 35.0d0))
          ((>= utc 54832.0d0) (setf dt 34.0d0))
          ((>= utc 53736.0d0) (setf dt 33.0d0))
          ((>= utc 51179.0d0) (setf dt 32.0d0))
          ((>= utc 50630.0d0) (setf dt 31.0d0))
          ((>= utc 50083.0d0) (setf dt 30.0d0))
          ((>= utc 49534.0d0) (setf dt 29.0d0))
          ((>= utc 49169.0d0) (setf dt 28.0d0))
          ((>= utc 48804.0d0) (setf dt 27.0d0))
          ((>= utc 48257.0d0) (setf dt 26.0d0))
          ((>= utc 47892.0d0) (setf dt 25.0d0))
          ((>= utc 47161.0d0) (setf dt 24.0d0))
          ((>= utc 46247.0d0) (setf dt 23.0d0))
          ((>= utc 45516.0d0) (setf dt 22.0d0))
          ((>= utc 45151.0d0) (setf dt 21.0d0))
          ((>= utc 44786.0d0) (setf dt 20.0d0))
          ((>= utc 44239.0d0) (setf dt 19.0d0))
          ((>= utc 43874.0d0) (setf dt 18.0d0))
          ((>= utc 43509.0d0) (setf dt 17.0d0))
          ((>= utc 43144.0d0) (setf dt 16.0d0))
          ((>= utc 42778.0d0) (setf dt 15.0d0))
          ((>= utc 42413.0d0) (setf dt 14.0d0))
          ((>= utc 42048.0d0) (setf dt 13.0d0))
          ((>= utc 41683.0d0) (setf dt 12.0d0))
          ((>= utc 41499.0d0) (setf dt 11.0d0))
          ((>= utc 41317.0d0) (setf dt 10.0d0))
          ((>= utc 39887.0d0)
           (setf dt (+ 4.21317d0 (* (- utc 39126.0d0) 0.002592d0))))
          ((>= utc 39126.0d0)
           (setf dt (+ 4.31317d0 (* (- utc 39126.0d0) 0.002592d0))))
          ((>= utc 39004.0d0)
           (setf dt (+ 3.84013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38942.0d0)
           (setf dt (+ 3.74013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38820.0d0)
           (setf dt (+ 3.64013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38761.0d0)
           (setf dt (+ 3.54013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38639.0d0)
           (setf dt (+ 3.44013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38486.0d0)
           (setf dt (+ 3.34013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38395.0d0)
           (setf dt (+ 3.24013d0 (* (- utc 38761.0d0) 0.001296d0))))
          ((>= utc 38334.0d0)
           (setf dt (+ 1.945858d0 (* (- utc 37665.0d0) 0.0011232d0))))
          ((>= utc 37665.0d0)
           (setf dt (+ 1.845858d0 (* (- utc 37665.0d0) 0.0011232d0))))
          ((>= utc 37512.0d0)
           (setf dt (+ 1.372818d0 (* (- utc 37300.0d0) 0.001296d0))))
          ((>= utc 37300.0d0)
           (setf dt (+ 1.422818d0 (* (- utc 37300.0d0) 0.001296d0))))
          (t (setf dt (+ 1.417818d0 (* (- utc 37300.0d0) 0.001296d0)))))
    (setf sla_dat dt)
   end_label
    (return (values sla_dat nil))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::sla_dat
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo :arg-types '((double-float))
                                            :return-values '(nil) :calls 'nil)))

