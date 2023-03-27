:- use_module(library(random)).

input_to_list(L):-
	read_line_to_codes(user_input,Cs),
	atom_codes(A,Cs),
	atomic_list_concat(L,' ',A).

respuesta_aleatoria(Res, R):-
    length(Res, Longitud),
    Mayor is Longitud + 1,
    random(1, Mayor, Rand),
    nElemento(Res, Rand, R).

nElemento([H|_], 1, H).
nElemento([_|T], N, X):-
    nElemento(T, N1, X),
    N is N1 + 1.

imprimir_usuario(bot):-
    nombre_bot(X), write(X), write(': '), flush_output.
imprimir_usuario(usuario):-
    n_usuario(X), write(X), write(': '), flush_output.
nombre_bot('CallCenterLog').
n_usuario('Usuario').

imprimir_lista([]):- nl.
imprimir_lista([H|T]):-
    write(H),
    write(' '),
    imprimir_lista(T).

% imprimir_ul/2
% Imprime el contenido de una lista como una unsorted list
imprimir_ul(0,_).
imprimir_ul(N,L):-
  nElemento(L, N, R),
  write('\t* '), imprimir_lista(R),
  M is N - 1,
  imprimir_ul(M,L).

% imprimir_seleccion/2
% Imprime el contenido de los indices seleccionados
imprimir_seleccion(_,[]).
imprimir_seleccion(L,[N1|NX]):-
  nElemento(L, N1, R),
  write('\t* '), imprimir_lista(R),
  imprimir_seleccion(L,NX).

interseca([], _, []).
interseca([H|T1], L2, [H|T3]):-
        member(H, L2), !,
        interseca(T1, L2, T3).
interseca([_|T1], L2, L3):-
        interseca(T1, L2, L3).

