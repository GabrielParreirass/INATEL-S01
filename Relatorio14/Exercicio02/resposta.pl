:- initialization(main).
nicho(capivara, rios).
nicho(capivara, floresta).
local_comum(capivara, margens).

nicho(garca, rios).
local_comum(garca, margens).

nicho(jacare, rios).
nicho(jacare, pantano).
local_comum(jacare, pantano).

nicho(lontra, rios).
nicho(lontra, lagos).
nicho(lontra, floresta).
local_comum(lontra, margens).

especie_dominante(Animal) :-
    local_comum(Animal, margens),
    nicho(Animal, X),
    nicho(Animal, Y),
    X \= Y.

main :-
    write('--- Analise do Ecossitema ---'), nl,

    (   especie_dominante(Animal),
        write('Especie dominante encontrada: '), write(Animal), nl,
        fail
    ;   write('-----------------------------'), nl
    ).