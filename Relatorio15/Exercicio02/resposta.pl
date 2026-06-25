:- initialization(main).
peca(h1, canhao_laser, combate).
peca(h1, missil_teleguiado, combate).
peca(h1, propulsor_ion, propulsao).

peca(h2, metralhadora_pesada, combate).
peca(h2, lanca_foguetes, combate).

peca(h3, sensor_calor, exploracao).

hangar(H) :- 
    peca(H, _, _).

hangar_combate(H) :-
    peca(H, P1, combate),
    peca(H, P2, combate),
    P1 \= P2.

falta_energia(H) :-
    hangar(H),
    \+ peca(H, _, propulsao).

main :-
    write('--- Hnagares de Combate Sem Energia ---'), nl,
    (   hangar_combate(H),
        falta_energia(H),
        write('Hangar em perigoo: '), write(H), nl,
        fail
    ;   write('---------------------------------------'), nl
    ).