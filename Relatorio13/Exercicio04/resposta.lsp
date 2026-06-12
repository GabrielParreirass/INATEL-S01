(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

(defun bonus-elemental (loc)
  (let ((el (local-elemento loc))
        (rec (local-recompensa loc)))
    (cond
      ((or (eq el 'pyro) (eq el 'electro)) (* rec 1.20))
      ((eq el 'cryo) (* rec 1.10))
      (t rec))))

(defun vale-a-pena (loc)
  (and (> (bonus-elemental loc) 500)
       (<= (local-dificuldade loc) 3)))

(defun rota-de-farm (catalogo)
  (mapcar (lambda (loc)
            (format nil "[~A] - Recompensa: ~,2F" (local-nome loc) (bonus-elemental loc)))
          (remove-if-not #'vale-a-pena catalogo)))

(defun main ()
  (let ((catalogo (list
                   (make-local :nome "Dominio das Chamas" :elemento 'pyro :dificuldade 2 :recompensa 450)
                
                   (make-local :nome "Caverna Submersa" :elemento 'hydro :dificuldade 4 :recompensa 600)

                   (make-local :nome "Pico Nevado" :elemento 'cryo :dificuldade 3 :recompensa 480)
                   
                   (make-local :nome "Planicie dos Ventos" :elemento 'anemo :dificuldade 1 :recompensa 300)

                   (make-local :nome "Altar do Trovao" :elemento 'electro :dificuldade 3 :recompensa 420))))
    
    (format t "--- Catalogo de Teyvat ---~%")
    (loop for loc in catalogo do
          (format t "Local: ~A | Elemento: ~A | Bounus: ~,2F~%" 
                  (local-nome loc) 
                  (local-elemento loc) 
                  (bonus-elemental loc)))
    
    (format t "~%--- Roita de Farm Recomendada ---~%")
    (let ((rota (rota-de-farm catalogo)))
      (loop for linha in rota do
            (format t "~A~%" linha)))))

(main)