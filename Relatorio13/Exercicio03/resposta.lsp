(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (cond
    ((> forca 80) (* forca 1.5))
    (t forca)))

(defun descricao-venda (i)
  (format nil "Arma: ~A | Preco final: R$ ~,2F | Forca c/ bonnus: ~,1F"
          (item-nome i)
          (item-preco i)
          (item-forca-magica i)))

(defun processa-venda (catalogo)
  (let* (;; Passo 1: Filtra só armas
         (armas (remove-if-not (lambda (i) (eq (item-tipo i) 'arma)) catalogo))

         (armas-com-imposto (mapcar (lambda (i)
                                      (make-item :nome (item-nome i)
                                                 :tipo (item-tipo i)
                                                 :preco (adiciona-imposto (item-preco i))
                                                 :forca-magica (item-forca-magica i)))
                                    armas))
         
         (armas-processadas (mapcar (lambda (i)
                                      (make-item :nome (item-nome i)
                                                 :tipo (item-tipo i)
                                                 :preco (item-preco i)
                                                 :forca-magica (bonus-maldicao (item-forca-magica i))))
                                    armas-com-imposto)))
    
    (mapcar #'descricao-venda armas-processadas)))

(defun main ()
  (let ((catalogo (list
                   (make-item :nome "Faca de Sobrevivencia" :tipo 'arma :preco 100.0 :forca-magica 50)
                   (make-item :nome "Revolver Customizado" :tipo 'arma :preco 350.0 :forca-magica 85)
                   (make-item :nome "Racao de Batalha" :tipo 'pocao :preco 30.0 :forca-magica 10)
                   (make-item :nome "Estatua Amaldicoada" :tipo 'artefato :preco 500.0 :forca-magica 120)
                   (make-item :nome "Katana das Sombras" :tipo 'arma :preco 600.0 :forca-magica 95))))
    
    (format t "--- Loja Secreeta de Iwai ---~%")
    
    (let ((resultados (processa-venda catalogo)))
      (loop for linha in resultados do
            (format t "~A~%" linha)))))

(main)