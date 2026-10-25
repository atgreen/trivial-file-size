(require :asdf)
(asdf:initialize-source-registry
 (list :source-registry
       (list :directory (merge-pathnames "../" (uiop:pathname-directory-pathname *load-truename*)))
       :inherit-configuration))
(asdf:load-system "trivial-file-size")
(require :egcl-posix)
(with-open-file (s "size-input" :direction :output :element-type '(unsigned-byte 8) :if-exists :supersede)
 (write-sequence #(0 128 255 42) s))
(assert (= 4 (trivial-file-size:file-size-in-octets "size-input")))
(assert (null (trivial-file-size:file-size-in-octets "absent-input")))
(assert (= (egcl-posix:stat-size (egcl-posix:stat "."))
           (trivial-file-size:file-size-in-octets (truename #p"./"))))
(format t "TRIVIAL-FILE-SIZE-PASS~%")
