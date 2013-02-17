(in-package #:millipode)

(defun generate-base-css ()
  (let* (

	 (text-color "#3c3b37")
	 (bg-color "#e0e0e0")

	 (content-width "42%")

	 (p-size "18px")
	 (h3-font-size "36px")

	 (fonts "Droid Sans, Helvetica, Sans, Arial")

	 ) ;; closes the first form in let.

    (css-lite:css-string

      ((:body)
       ((:width content-width)
	(:background-color bg-color)
	(:color text-color)
	(:font-size p-size)
	(:font-family fonts)))
	
      ((:h3)
       ((:font-size h3-font-size)
	(:font-weight "normal")
	(:color text-color)
	(:margin-top "10px")
	(:margin-bottom "10px")
	(:margin-left "0px")))

      ((:p)
       ((:text-align "justify")
	(:color text-color)
	(:font-weight "normal")))

      )))

     
;; Uncomment while prototyping.
;; (generate-style #P"../css/")
