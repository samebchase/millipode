(in-package :millipode)

(defun generate-atom-feed-xml (content-dir)
  (with-xml-output (cxml:make-string-sink :indentation 1 :canonical nil)
    (with-element "feed" (attribute "xmlns" "http://www.w3.org/2005/Atom")
      (with-element "title" (text +title+))
      (with-element "link" (attribute "href" (format nil "~a~a" +uri+ "feed/")))
      (with-element "link" (attribute "href" +uri+))


        )))
      
