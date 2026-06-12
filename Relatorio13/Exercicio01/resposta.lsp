
(defstruct erva
  nome
  preco-base)

(defun calcula-dosagem (peso idade)
  (cond
    ((or (<= idade 5) (<= peso 20.0)) "10ml")
    ((or (<= idade 12) (<= peso 40.0)) "25ml")
    (t "50ml")))

(defun ajusta-preco (e)
  (let ((n (erva-nome e))
        (p (erva-preco-base e)))
    (cond
      ((string-equal n "Ginseng") (* p 3.0))
      ((string-equal n "Lotus") (* p 1.5))
      (t p))))

(defun descricao-erva (e peso idade)
  (let ((preco (ajusta-preco e))
        (dosagem (calcula-dosagem peso idade)))
    (format nil "Erva: ~A | Preco p/ o pasciente: R$ ~,2F | Dosagme: ~A" 
            (erva-nome e) preco dosagem)))

(defun main ()
  (let ((ginseng (make-erva :nome "Ginseng" :preco-base 10.0))
        (lotus (make-erva :nome "Lotus" :preco-base 15.0))
        (camomila (make-erva :nome "Camomila" :preco-base 8.0)))
    
    (format t "--- Farmacia da Maomao ---~%")
    
    (format t "~A~%" (descricao-erva ginseng 15.0 4))
    
    (format t "~A~%" (descricao-erva lotus 35.0 10))
    
    (format t "~A~%" (descricao-erva camomila 70.0 25))))

(main)