:- initialization(main).
categoria(nucleo, propulsao).
categoria(revestimento, defesa).
categoria(cristal, armamento).
categoria(motor, propulsao).
categoria(asa, estrutural).
categoria(laser, armamento).

precisa(motor, nucleo).
precisa(asa, revestimento).
precisa(laser, cristal).

componente(P) :- 
    categoria(P, _).

peca_raiz(P) :-
    componente(P),
    \+ precisa(P, _).

peca_final(P) :-
    componente(P),
    \+ precisa(_, P).

main :-
    write('--- Componentes Raizz Validos ---'), nl,
    (   peca_raiz(P),
        categoria(P, C),
        C \= propulsao,
        write('Componente aproovado: '), write(P), nl,
        fail
    ;   write('---------------------------------'), nl
    ).