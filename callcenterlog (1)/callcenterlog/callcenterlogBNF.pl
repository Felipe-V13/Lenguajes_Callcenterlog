:-style_check(-singleton).

saludo([hola|S],S).
saludo([buen,dia|S],S).
saludo([buenos,dias|S],S).
saludo([buenas,tardes|S],S).
saludo([buenas,noches|S],S).

despedida([adios|S],S).
despedida([hasta,luego|S],S).

nombre([callcenterlog|S],S).
nombre([call|S],S).
nombre([center|S],S).
nombre([log|S],S).
nombre([ccl|S],S).

agradecimiento([gracias|S],S).
agradecimiento([muchas,gracias|S],S).
agradecimiento(['Gracias'|S],S).
agradecimiento(['Muchas',gracias|S],S).

determinante(s,m,[el|S],S).
determinante(s,f,[la|S],S).
determinante(p,m,[los|S],S).
determinante(p,f,[las|S],S).
determinante(s,m,[un|S],S).
determinante(s,f,[una|S],S).
determinante(p,m,[unos|S],S).
determinante(p,f,[unas|S],S).
determinante(s,m,[este|S],S).
determinante(s,f,[esta|S],S).
determinante(p,m,[estos|S],S).
determinante(p,f,[estas|S],S).
determinante(s,m,[ese|S],S).
determinante(s,f,[esa|S],S).
determinante(p,m,[esos|S],S).
determinante(p,f,[esas|S],S).
determinante(s,m,[aquel|S],S).
determinante(s,f,[aquella|S],S).
determinante(p,m,[aquellos|S],S).
determinante(p,f,[aquellas|S],S).
determinante(s,m,[nuestro|S],S).
determinante(s,m,[algun|S],S).
determinante(p,m,[algunos|S],S).
determinante(s,f,[alguna|S],S).
determinante(p,f,[algunas|S],S).

pronombre(p,[mis|S],S).
pronombre(p,['Mis'|S],S).
pronombre(s,[mi|S],S).
pronombre(s,['Mi'|S],S).
pronombre(s,[me|S],S).
pronombre(s,['¿Me'|S],S).
pronombre(s,['¿me'|S],S).
pronombre(s,[nada|S],S).

adverbio([no|S],S).
adverbio(['No'|S],S).
adverbio(['no,'|S],S).
adverbio(['No,'|S],S).
adverbio([si|S],S).
adverbio(['Si'|S],S).
adverbio(['si,'|S],S).
adverbio(['Si,'|S],S).
adverbio([aun,no|S],S).
adverbio([de,que|S],S).
adverbio([ya|S],S).
adverbio([para|S],S).
adverbio([automaticamente|S],S).

sustantivo(s,m,[vehiculo|S],S).
sustantivo(s,m,[carro|S],S).
sustantivo(s,m,[model_s|S],S).
sustantivo(s,m,[model_3|S],S).
sustantivo(s,m,[model_x|S],S).
sustantivo(s,m,[model_y|S],S).
sustantivo(s,m,[panel_solar|S],S).
sustantivo(p,m,[paneles,solares|S],S).
sustantivo(p,m,[cyber_truck|S],S).
sustantivo(s,m,[techo_solar|S],S).
sustantivo(s,f,[referencia|S],S).
sustantivo(p,f,[referencias|S],S).
sustantivo(s,f,[consulta|S],S).
sustantivo(p,f,[consultas|S],S).
sustantivo(s,f,[causa|S],S).
sustantivo(p,f,[causas|S],S).
sustantivo(s,f,[problema|S],S).
sustantivo(p,f,[problemas|S],S).
sustantivo(p,f,[posibles,causas|S],S).
sustantivo(s,f,[error|S],S).
sustantivo(s,f,[bateria|S],S).

verbo([funciona|S], S).
verbo([funciono|S], S).
verbo([sirve|S], S).
verbo([sirvio|S], S).
verbo([arranca|S], S).
verbo([arranco|S], S).
verbo([enciende|S],S).
verbo([trabaja|S],S).
verbo([funka|S],S).
verbo([podria, pasar|S],S).
verbo([podrias, pasar|S],S).
verbo([podria,facilitar|S],S).
verbo([podrias,facilitar|S],S).
verbo([conoce,cuales,son|S],S).
verbo([tiene|S],S).
verbo([tienes|S],S).
verbo([tendra|S],S).
verbo([esta|S],S).
verbo([estan|S],S).
verbo([es|S],S).
verbo([tengo|S],S).
verbo([necesito|S],S).
verbo([realizar|S],S).
verbo([hacer|S],S).
verbo([consultar|S],S).
verbo([necesito, conocer|S],S).
verbo([puede, causar|S],S).
verbo([presenta|S],S).
verbo([presentan|S],S).
verbo([esta, funcionando|S],S).
verbo([estan, funcionando|S],S).
verbo([funciona, mal|S],S).
verbo([funcionan, mal|S],S).
verbo([deja, ingresar|S],S).
verbo([deja, manejar|S],S).

adjetivo(s,[cargado|S],S).
adjetivo(p,[cargados|S],S).
adjetivo(s,[encendido|S],S).
adjetivo(s,[danado|S],S).
adjetivo(p,[danados|S],S).
adjetivo(s,[cerrado|S],S).
adjetivo(s,[actualizado|S],S).
adjetivo(s,[sucia|S],S).
adjetivo(s,[desactualizado|S],S).
adjetivo(s,[pago|S],S).
adjetivo(s,[desconectado|S],S).

pregunta(_, [que|S],S).
pregunta(_, ['Que'|S],S).
pregunta(_, ['¿que'|S],S).
pregunta(_, ['¿Que'|S],S).
pregunta(p, [cuales|S],S).
pregunta(p, ['Cuales'|S],S).
pregunta(p, ['¿cuales'|S],S).
pregunta(p, ['¿Cuales'|S],S).
pregunta(p, [cuales, son|S],S).
pregunta(p, ['Cuales', son|S],S).
pregunta(p, ['¿cuales', son|S],S).
pregunta(p, ['¿Cuales', son|S],S).
pregunta(s, [cual|S],S).
pregunta(s, ['Cual'|S],S).
pregunta(s, ['¿cual'|S],S).
pregunta(s, ['¿Cual'|S],S).
pregunta(_, [?|S],S).

oracion(A,B):-
    sintagma_nominal(A,C).



sintagma_nominal(A,B):-
   saludo(A,C),
   nombre(C,B).
sintagma_nominal(A,B):-
    pronombre(N,A,C),
    sustantivo(N,_,C,D),
    adverbio(D,E),
    sintagma_verbal(E,B).
sintagma_nominal(A,B):-
    determinante(N,G,A,C),
    sustantivo(N,G,C,B).
sintagma_nominal(A,B):-
    determinante(N,G,A,C),
    sustantivo(N,G,C,D),
    adverbio(D,E),
    sintagma_verbal(E,B).
sintagma_nominal(A,B):-
    agradecimiento(A,C),
    adverbio(C,Z),
    sintagma_verbal(Z,B).
sintagma_nominal(A,B):-
    adverbio(A,Z),
    sintagma_verbal(Z,B).
sintagma_nominal(A,B):-
    adverbio(A,C),
    adverbio(C,D),
    sintagma_verbal(D,B).
sintagma_nominal(A,B):-
    adverbio(A,B).
sintagma_nominal(A,B):-
    agradecimiento(A,B).
sintagma_nominal(A,B):-
    despedida(A,B).
sintagma_nominal(A,B):-
    adverbio(A,C),
    pronombre(_,C,D),
    sintagma_verbal(D,E),
    determinante(I,G,E,F),
    sustantivo(I,G,F,B).
sintagma_nominal(A,B):-
    sintagma_verbal(A,B).
sintagma_nominal(A,B):-
    adverbio(A,C),
    pronombre(_,C,D),
    sintagma_verbal(D,E),
    determinante(N,G,E,F),
    sustantivo(N,G,F,H),
    pregunta(_,H,B).
sintagma_nominal(A,B):-
    pronombre(_,A,D),
    sintagma_verbal(D,E),
    determinante(N,G,E,F),
    sustantivo(N,G,F,H),
    pregunta(_,H,B).
sintagma_nominal(A,B):-
    pregunta(_,A,C),
    determinante(N,G,C,D),
    sustantivo(N,G,D,H),
    adverbio(H,I),
    determinante(Q,S,I,J),
    sustantivo(Q,S,J,K),
    adverbio(K,L),
    sintagma_verbal(L,M),
    pregunta(_,M,B).
sintagma_nominal(A,B):-
    determinante(N,G,A,C),
    sustantivo(N,G,C,D),
    adverbio(D,E),
     pronombre(N,A,C),
    sustantivo(N,_,C,D),
    adverbio(D,E),
    sintagma_verbal(E,B).

sintagma_verbal(A,B):-
	verbo(A,B).

validacion_gramatical(Oracion):-
    oracion(Oracion,[]),
	!.

validacion_gramatical(Oracion):-
    imprimir_usuario(bot),
	nl, writeln('Oracion gramaticalmente incorrecta'),
	writeln('Escriba de nuevo su oracion'),nl,
        imprimir_usuario(usuario),
	input_to_list(Oracion2),
	validacion_gramatical(Oracion2).




