:- initialization(main).
alimenta(sol, grama).
alimenta(sol, arvore).
alimenta(sol, alga).

alimenta(grama, gafanhoto).
alimenta(grama, capivara).
alimenta(arvore, macaco).
alimenta(alga, peixe).

alimenta(gafanhoto, sapo).
alimenta(sapo, cobra).
alimenta(cobra, gaviao).
alimenta(capivara, onca).

fluxo_energia(A, D) :- 
    alimenta(A, D).

fluxo_energia(A, D) :- 
    alimenta(A, Z), 
    fluxo_energia(Z, D).

main :-
    write('--- Analise do Fluxo de Energia do Sol ---'), nl,
    
    (   fluxo_energia(sol, Recebedor),
        write('O Sol envia energia (direta ou inidretamente) para: '), 
        write(Recebedor), nl,
        fail
    ;   write('---------------------------------------------'), nl
    ).