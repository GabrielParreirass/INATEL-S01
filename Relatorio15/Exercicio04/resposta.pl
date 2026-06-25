componente(reator_fusao, 0, fundamental).
componente(propulsor_ion, 8, propulsao).
componente(dobra_espacial, 10, propulsao).
componente(escudo_plasma, 6, defesa).
componente(canhao_laser, 4, combate).
componente(torpedo_foton, 6, combate).
componente(ia_navegação, 4, sistemas).
componente(scanner_deep_space, 6, sistemas).
componente(modulo_suporte_vida, 8, sistemas).
componente(cloaking_device, 6, defesa).
componente(android_reparo, 4, suporte).
componente(estacao_pesquisa, 10, pesquisa).

precisa(propulsor_ion, reator_fusao).
precisa(dobra_espacial, propulsor_ion).
precisa(escudo_plasma, reator_fusao).
precisa(ia_navegação, propulsor_ion).
precisa(ia_navegação, modulo_suporte_vida).
precisa(canhao_laser, ia_navegação).
precisa(canhao_laser, propulsor_ion).
precisa(torpedo_foton, ia_navegação).
precisa(scanner_deep_space, modulo_suporte_vida).
precisa(android_reparo, modulo_suporte_vida).
precisa(estacao_pesquisa, scanner_deep_space).
precisa(estacao_pesquisa, android_reparo).

possui(hangar_alpha, reator_fusao).
possui(hangar_alpha, modulo_suporte_vida).
possui(hangar_beta, reator_fusao).
possui(hangar_beta, propulsor_ion).
possui(hangar_beta, modulo_suporte_vida).
possui(hangar_gamma, reator_fusao).
possui(hangar_gamma, cloaking_device).
possui(hangar_gamma, scanner_deep_space).
possui(hangar_delta, modulo_suporte_vida).
possui(hangar_delta, android_reparo).
possui(hangar_delta, scanner_deep_space).
possui(hangar_epsilon, propulsor_ion).
possui(hangar_epsilon, dobra_espacial).
possui(hangar_epsilon, cloaking_device).
possui(hangar_epsilon, canhao_laser).

peca_raiz(P) :-
    componente(P, _, _),
    \+ precisa(P, _).

peca_final(P) :-
    componente(P, _, _),
    \+ precisa(_, P).

main :-
    write('--- Pecas Raiz (Nao Propulsao) ---'), nl,
    (   peca_raiz(R),
        componente(R, _, Cat),
        Cat \= propulsao,
        write('Raiz: '), write(R), nl,
        fail
    ;   write('----------------------------------'), nl
    ).