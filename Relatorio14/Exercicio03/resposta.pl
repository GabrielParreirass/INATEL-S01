:- initialization(main).
alimenta(arvore, sol).
alimenta(arvore, terra).

alimenta(samambaia, sol).
alimenta(samambaia, terra).

alimenta(arbusto, sol).
alimenta(arbusto, terra).

alimenta(alga, sol).
alimenta(alga, agua).

competidores_diretos(A, B) :-
    alimenta(A, sol),
    alimenta(A, terra),
    alimenta(B, sol),
    alimenta(B, terra),
    A @< B.

main :-
    write('--- Analise de Competidores Diretos ---'), nl,
    
    (   competidores_diretos(PlantaA, PlantaB),
        write('Par de competidores econtrados: '), 
        write(PlantaA), write(' e '), write(PlantaB), nl,
        fail
    ;   write('--------------------------------------'), nl
    ).