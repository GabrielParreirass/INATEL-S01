:- initialization(main).
categoria(motor_impulso, fundamental).
categoria(escudo_termico, defesa).
categoria(ia_navegacao, sistema).
categoria(comunicador, sistema).

precisa(escudo_termico, placa_titanio).
precisa(ia_navegacao, processador_quantico).
precisa(ia_navegacao, nucleo_energia).
precisa(motor_impulso, nucleo_energia).
precisa(comunicador, antena).

peca(hangar_beta, placa_titanio).
peca(hangar_beta, antena).

peca(hangar_gamma, processador_quantico).

hangar(hangar_beta).
hangar(hangar_gamma).

item_faltante(Hangar, Peca) :-
    hangar(Hangar),
    precisa(_, Peca),
    \+ peca(Hangar, Peca).

pode_montar(Hangar, Componente) :-
    hangar(Hangar),
    categoria(Componente, Categoria),
    Categoria \= fundamental,
    \+ (precisa(Componente, Req), item_faltante(Hangar, Req)).

main :-
    write('--- Componentes para o Hngar Beta ---'), nl,
    (   pode_montar(hangar_beta, C),
        write('Apto a montar: '), write(C), nl,
        fail
    ;   write('-------------------------------------'), nl
    ),
    write('--- Hangar Gamma pode montar IA Navegacaoo? ---'), nl,
    (   pode_montar(hangar_gamma, ia_navegacao) ->
        write('Sim, possui todos os requisitos.'), nl
    ;   write('Nao, requisitos insuficientes.'), nl
    ).