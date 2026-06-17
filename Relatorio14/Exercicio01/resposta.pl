:- initialization(main).
alimenta(sucuri, agua).
alimenta(sucuri, terra).

alimenta(jacare, agua).
alimenta(tubarao, agua).
alimenta(lobo, terra).

nicho(sucuri, rios).
nicho(jacare, pantano).
nicho(tubarao, profundezas).
nicho(lobo, floresta).


especie_chave(Animal) :-
    (alimenta(Animal, agua) ; alimenta(Animal, terra)),
    (nicho(Animal, rios) ; nicho(Animal, pantano) ; nicho(Animal, profundezas)).


main :-
    write('--- Esepcies Chaves do Ecossistema ---'), nl,
    
    (   especie_chave(X),
        % Erro intencional 2: "econtrada"
        write('Especie econtrada: '), write(X), nl,
        fail
    ;   write('--------------------------------------'), nl
    ).