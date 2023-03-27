:-consult('callcenterlogBD').
:-consult('callcenterlogBNF').
:-consult('callcenterlogSE').

:- dynamic dispositivo/1.

encabezado():-
	sleep(0.02),
	write('       ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||       '),nl,
	sleep(0.02),
	write('       ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||       '),nl,
	sleep(0.02),
	write('       ||||||||||||||||||||||||||| TESLA ||||||||||||||||||||||||||||||||       '),nl,
	sleep(0.02),
	write('       ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||       '),nl,
	sleep(0.02),
	write('       ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||       '),nl, nl,
	write('      Hola, soy CallCenterLog, ayudante de Tesla, sera un placer ayudarle '), nl,nl.

saludo:-
  respuestas(saludo, D),
  respuesta_aleatoria(D, W),
  imprimir_usuario(bot),
  imprimir_lista(W),
  imprimir_usuario(usuario),
  input_to_list(Z),
  validacion_gramatical(Z),
  imprimir_usuario(bot),
  nl, writeln('¿En qué lo puedo ayudar?').

conversacion:-
  repeat,
  imprimir_usuario(usuario),
  input_to_list(S),
  validacion_gramatical(S),
  append(S,[' n'],M), % Evita el
  generar_respuesta(M,R),
  imprimir_usuario(bot),
  imprimir_lista(R),
    salir(S), !.


%--------------------- RESPUESTAS ------------------------

% A) RESPUESTAS A UNA CONSULTA
% Si en la misma frase el usuario ya indicó el dispositivo
generar_respuesta(S,R):-
  patronConsulta(S,_),
  verificar_dispositivo(S),!,
  resolver_consulta,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si no lo introduce, en la consulta, se procede a preguntarlo
generar_respuesta(S,R):-
  patronConsulta(S,_),!,
  obtener_dispositivo,
  resolver_consulta,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% B) RESPUESTAS A UNA REFERENCIA

% Si en la misma frase el usuario ya indicó el dispositivo y el problema
generar_respuesta(S,R):-
  patronReferencia(S,_), verificar_dispositivo(S),
  es_causa(S,N),!,
  imprimir_usuario(bot),write('Esta referencia puede serte útil: '),
  brindar_referencia(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si en la misma frase el usuario ya indicó el dispositivo y el problema
generar_respuesta(S,R):-
  patronReferencia(S,_),
  verificar_dispositivo(S),
  es_caso_especial(S,N),!,
  imprimir_usuario(bot),write('Estas referencias te ayudarán: \n'),
  brindar_referencia(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si el usuario solo brinda el dispositivo
generar_respuesta(S,R):-
  patronReferencia(S,_),
  verificar_dispositivo(S),!,
  brindar_referencias,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si no dice ni dispositivo, ni problema se brindan todas.
generar_respuesta(S,R):-
  patronReferencia(S,_),!,
  obtener_dispositivo,
  brindar_referencias,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% C) RESPUESTAS A UN PROBLEMA

% El usuario indica que tiene un problema, el dispositivo y dice cual
% es la causa (sea específica o general).
generar_respuesta(S,R):-
  patronProblema(S,_), verificar_dispositivo(S),
  es_causa(S,N),!,
  brindar_solucion(N,R).

generar_respuesta(S,R):-
  patronProblema(S,_), verificar_dispositivo(S),
  es_caso_especial(S,N),!,
  brindar_solucion(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% El usuario indica que tiene un problema y el dispositivo.
generar_respuesta(S,R):-
  patronProblema(S,_), verificar_dispositivo(S),!,
  conoce_el_problema,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% El usuario solo indica que tiene un problema.
generar_respuesta(S,R):-
  patronProblema(S,_), !,
  obtener_dispositivo,
  conoce_el_problema,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------------------------------------
% buscar despedida "adios"
generar_respuesta(S, R):-
  salir(S), !,
	respuestas(despedida, Res),
	respuesta_aleatoria(Res, R).

% Buscar frase de saludo
generar_respuesta(S, R):-
  buscar_saludo(S), !,
	respuestas(saludo, Res),
	respuesta_aleatoria(Res, R).

% Buscar frase de agradecimiento
generar_respuesta(S, R):-
  buscar_gracias(S), !,
  respuestas(agradecido, Res),
  respuesta_aleatoria(Res, R).

% Responder algo aleatorio
generar_respuesta(S, R):-
  buscar_pregunta(S), !,
  respuestas(respuestas_aleatorias, Res),
  respuesta_aleatoria(Res, R).

% Detectar pregunta con por qué
generar_respuesta(S, R):-
	oracion(S,_), buscar_pregunta(S), !,
  respuestas(preguntas_aleatorias,PA),
  respuesta_aleatoria(PA,R).

% Detectar frase válida y responder algo random
generar_respuesta(S, R):-
	oracion(S,_), !,
  respuestas(respuestas_aleatorias,PA),
  respuesta_aleatoria(PA,R).

% Si el usuario ingresa una incoherencia
generar_respuesta(_,R):-
  respuestas(incompresion,RL),
  respuesta_aleatoria(RL,R).

salir(S):-
    subset([adios], S).

% verificar_dispositivo/1
% Verifica si el dispositivo es valido, y lo agrega a la base de datos actual.
verificar_dispositivo(S):-
  dispositivos(D),
  interseca(S, D, A),
  A \== [],
  assert(dispositivo(A)).

% verificar_problema/1
% Verifica que el usuario este ingresando un problema.
verificar_problema(S):-
  es_causa(S,N),!,
  brindar_solucion(N,R),
  imprimir_lista(R).

verificar_problema(S):-
  es_caso_especial(S,N),!,
  brindar_solucion(N).

verificar_problema(_):-
  respuestas(problema,LP),
  respuesta_aleatoria(LP,RA),
  imprimir_usuario(bot),
  imprimir_lista(RA),fail.

% es_causa/2
% Indica si en una oración se da una causa principal
es_causa(S,N):-
  dispositivo(D),nElemento(D,1,Disp),
  patronCausa(Disp,S,_,N).

% es_caso_especial/?
% Indica si se hace request de un problema específico
es_caso_especial(S,N):-
  dispositivo(D),nElemento(D,1,Disp),
  patronProbRef(Disp,S,_,N).

% resolver_consulta/0
% Muestra al usuario las causas de un problema con su dispositivo
resolver_consulta:-
  imprimir_usuario(bot),
  write('Las posibles causas de su problema son: \n'),
  dispositivo(D),nElemento(D,1,Disp),
  causas_db(Disp,LS),
  length(LS,N),
  imprimir_ul(N,LS),!.

% brindar_referencias/0
% Brinda al usuario todas las referencias de un dispositivo.
brindar_referencias:-
  imprimir_usuario(bot),write('Esta referencias pueden ayudarte con tu problema: \n'),
  dispositivo(D),nElemento(D,1,Disp),
  referencias(Disp,LR),
  length(LR,N),imprimir_ul(N,LR),!.

% brindar_referencia/1
% Brinda una o varias referencias asociadas a un problema.
brindar_referencia(N):-
  integer(N),!,
  dispositivo(D),nElemento(D,1,Disp),
  referencias(Disp,LRF),
  nElemento(LRF,N,RF),
  imprimir_lista(RF).

brindar_referencia(N):-
  dispositivo(D),nElemento(D,1,Disp),
  referencias(Disp,LRF),
  imprimir_seleccion(LRF,N),!.

% brindar_solucion/2
% Brinda una o varias referencias asociadas a un problema.
brindar_solucion(N,S):-
  integer(N),!,
  dispositivo(D),nElemento(D,1,Disp),
  respuestas(Disp,LRF),
  nElemento(LRF,N,S).

% brindar_solucion/1
brindar_solucion(N):-
  imprimir_usuario(bot),write('\n'),
  dispositivo(D),nElemento(D,1,Disp),
  respuestas(Disp,LRF),
  imprimir_seleccion(LRF,N),!.

% obtener_dispositivo/0
% Le pide al usuario un dispositivo válido.
obtener_dispositivo:-
  preguntas_db(dispositivo,LP),
  respuesta_aleatoria(LP,P),
  imprimir_usuario(bot),imprimir_lista(P),
  imprimir_usuario(usuario),input_to_list(S),
  obtener_dispositivo(S).

% Clausa de salida del bucle de detección de problemas
obtener_dispositivo(D):-
  member('salir',D), !,fail.

obtener_dispositivo(D):-
  verificar_dispositivo(D),!.

obtener_dispositivo(_):-
  respuestas(obtener_dispositivo,LR),
  respuesta_aleatoria(LR,RA),
  imprimir_usuario(bot),imprimir_lista(RA),
  imprimir_usuario(usuario),input_to_list(D),
  obtener_dispositivo(D).

% conoce_el_problema/0
% Realiza preguntas al usuario para determinar si conoce el problema
conoce_el_problema:-
  imprimir_usuario(bot),write('Responde a la siguiente pregunta con SI o NO\n'),
  write('¿Conoces cual es tu problema?'),
  input_to_list(S),
  validacion_gramatical(S),
  conoce_el_problema(S),!.

% Si Sí conoce el problema, solicita la causa y luego lo soluciona
conoce_el_problema(S):-
  afirmativo(S), !,
  imprimir_usuario(bot),
  write('¡Sí lo sabes! ¡Entonces dime cuál es!\n'),
  imprimir_usuario(usuario),input_to_list(M),validacion_gramatical(S),append(M,[' n'],P),
  verificar_problema(P).

% Si no lo conoce, se procede a realizar obtener_problema
conoce_el_problema(S):-
  negativo(S), !,
  imprimir_usuario(bot),
  write('¡No lo sabes! Bueno, vamos a encontrarlo!\n'),
  obtener_problema.

% Clausa de salida del bucle de detección de problemas
conoce_el_problema(S):-
  member('salir',S), !.

% Si el usuario no ingresa si o no, le pide que ingrese una
conoce_el_problema(_):-
  imprimir_usuario(bot),
  write('No respondiste con SI o NO, intentalo de nuevo'),
  input_to_list(S),validacion_gramatical(S), conoce_el_problema(S).

% obtener_problema/0
obtener_problema:-
  imprimir_usuario(bot),
  write('Responde a las siguientes preguntas con SI o NO\n'),
  dispositivo(D),nElemento(D,1,Disp),
  preguntas_db(Disp,PP),
  length(PP,N),obtener_problema(N).

% obtener_problema/1
obtener_problema(0):-
  imprimir_usuario(bot),
  write('Lo lamento, parece que tu problema no se encuentra en mi base datos.\n'),!.

obtener_problema(N):-
  integer(N),!,
  dispositivo(D),nElemento(D,1,Disp),
  preguntas_db(Disp,PP),
  nElemento(PP,N,PG),
  imprimir_usuario(bot),
  imprimir_lista(PG),
  input_to_list(S),validacion_gramatical(S),obtener_problema(S,N).

% obtener_problema/2
obtener_problema(S,N):-
  negativo(S),!,
  brindar_solucion(N,R),
  imprimir_lista(R).

obtener_problema(S,N):-
  afirmativo(S),!,
  M is N-1, obtener_problema(M).

obtener_problema(S,_):-
  member('salir',S), !.

obtener_problema(_,_):-
  imprimir_usuario(bot),
  write('No respondiste con SI o NO, intentalo de nuevo'),
  input_to_list(S),validacion_gramatical(S), obtener_problema(S).

buscar_saludo(S):-
  saludos(D),
  interseca(S, D, A),
  A \== [].

% buscar_pregunta/1
% Verifica si la entrada es una pregunta en la DB
buscar_pregunta(S):-
  member('?',S).

% buscar_gracias/1
% Verifica si la oración es de agradecimiento en la DB
buscar_gracias(S):-
  gracias(D),
  interseca(S, D, A),
  A \== [].

afirmativo(S):-
  member('si',S).

% afirmativo/1
% Retorna verdadero si el usuario responde SI
negativo(S):-
  member('no',S).

inicio():-
    encabezado(),
    saludo,
    conversacion.
