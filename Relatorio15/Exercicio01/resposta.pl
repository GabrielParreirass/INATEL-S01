:- initialization(main).
consumo(reator_nuclear, 10).
consumo(suporte_vital, 6).
consumo(computador_bordo, 6).
consumo(painel_solar, 2).

categoria(suporte_vital, sistemas).
categoria(computador_bordo, sistemas).
categoria(reator_nuclear, energia).

precisa(propulsor, reator_nuclear).
precisa(escudos, reator_nuclear).

precisa(oxigenador, suporte_vital).

peca_critica(P) :-
    consumo(P, MW),
    MW > 5,
    precisa(P1, P),
    precisa(P2, P),
    P1 \= P2.

main :-
    write('--- Avaliacao de Peca Crtica ---'), nl,
    (   peca_critica(P),
        write('Componente vital: '), write(P), nl,
        fail
    ;   write('--------------------------------'), nl
    ),
    
    write('--- Query: Sistemas de 6 MW Isolados ---'), nl,
    (   categoria(C, sistemas),
        consumo(C, 6),
        \+ precisa(_, C),
        write('Componente isolado (nenhumma dependencia): '), write(C), nl,
        fail
    ;   write('----------------------------------------'), nl
    ).