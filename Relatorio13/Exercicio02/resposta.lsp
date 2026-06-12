(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)


(defun descricao-criatura (c)

  (format nil "Criatura: ~A | Ambiente: ~A | Periculsidade: ~A"
          (criatura-nome c)
          (criatura-ambiente c)
          (criatura-periculosidade c)))


(defun filtra-por-perigo (catalogo)

  (remove-if (lambda (c) (eq (criatura-periculosidade c) 'baixa)) catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar (lambda (c)
            (format nil "[~A]: Vive em ~A" (criatura-nome c) (criatura-ambiente c)))
          (remove-if-not (lambda (c) (string-equal (criatura-ambiente c) "Deep")) catalogo)))

(defun main ()
  (let ((catalogo (list
                   (make-criatura :nome "Peeper" 
                                  :ambiente "Safe Shallows" 
                                  :periculosidade 'baixa 
                                  :vida-media 5)
                   (make-criatura :nome "Reaper Leviathan" 
                                  :ambiente "Crash Zone" 
                                  :periculosidade 'alta 
                                  :vida-media 100)
                   (make-criatura :nome "Crabsquid" 
                                  :ambiente "Deep" 
                                  :periculosidade 'media 
                                  :vida-media 40)
                   (make-criatura :nome "Ghost Leviathan" 
                                  :ambiente "Deep" 
                                  :periculosidade 'alta 
                                  :vida-media 500))))
    
    (format t "--- Catalogo Completo ---~%")
    (loop for c in catalogo do
          (format t "~A~%" (descricao-criatura c)))
    
    (format t "~%--- Criaturas Perigosas ---~%")
    (let ((perigosas (filtra-por-perigo catalogo)))
      (loop for c in perigosas do
            (format t "~A~%" (descricao-criatura c))))
    
    (format t "~%--- Relaotrio de Profundidade ---~%")
    (let ((relatorio (relatorio-profundidade catalogo)))
      (loop for linha in relatorio do
            (format t "~A~%" linha)))))

(main)