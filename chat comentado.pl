
 % Modulos y archivos
 :- [db, patrones, readin, idioma, nombres, util]. % se llama los archivos complementarios que se usaran para el funcionamiento para el chat.
 :- use_module(library(random)). % se carga el modulo random

 % Variables que almacenan la información del Usuario
 :- dynamic nombre_usuario/1,
            dispositivo/1,
            solicitud/1.

%----------------------- INICIO --------------------------

% Funcion de consultar
% Inicia una conversación.
% entrada: No se esperan ninguna entrada directa por parte del usuario
% salida: llama a las funciones "saludar", "obtener_nombre" y "conversacion" para que estas obtengan informacion para interactuar con el usuario
consultar:-saludar,obtener_nombre,conversacion.% Saluda al usuario, luego pregunta por su nombre y finalmente inicia la conversacion

% saludar/0
% Saluda al usuario con una frase aleatoria en la base de datos al incio de la conversacion.
% Entradas: no se espera que esta funcion reciba ninguna entrada directa
% salidas: un saludo aleatorio de la base de datos, antes del saludo se indica que es el "bot" quien responder. Y se deja un "usuario" para indicar que se espera respuesta
saludar:-
  respuestas(saludo, D), % busca en la base de datos de respuestas la lista de posibles respuestas para el caso de un saludo. La variable D se asigna a la lista de respuestas encontrada.
  respuesta_aleatoria(D, W), %selecciona aleatoriamente una respuesta de la lista D y asignarla a la variable W. Esta respuesta seleccionada aleatoriamente se utilizará para saludar al usuario.
  imprimir_usuario(bot), % muestra un mensaje para indicar que la siguiente respuesta es del bot
  imprimir_lista(W), % muestra el saludo del bot
  imprimir_usuario(usuario), %muestra que se espera un mensaje del usuario
  readin(_). % se lee para leer la entrada del usuario y descartarla y se  espere a que el usuario proporcione una entrada antes de continuar con la conversación.

% conversacion/0
% esta funcion se usa para repetir el proceso de intercambio de mensajes entre el bot y el usuario hasta que se cumpla una condición de salida..
% Entradas: entradas del usuario en forma de oraciones, que se leerán utilizando la función readin.
%Salidas:
conversacion:-
  repeat,
  imprimir_usuario(usuario),
  readin(S), % lee la entrada del usuario como oraciones (string)
  append(S,[' n'],M), % se agrega el valor ' n' al final de la entrada del usuario ara evitar un error en caso de que el usuario no escriba un espacio después de su última palabra y se le asigna un valor al mensaje "M" y lo almacena
  generar_respuesta(M,R), % utiliza la entrada del usuario para generar una respuesta utilizando la función, esta Respuesta la almacena en la variable "R"
  imprimir_usuario(bot),
  imprimir_lista(R), % imprime la respuesta de la forma "Bot: respuesta"
    salir(S), %Verifica si se cumple con la condición para terminar, en este caso el usario se despide
    print_report, !. %imprime un informe y finaliza


%--------------------- RESPUESTAS ------------------------

% A) RESPUESTAS A UNA CONSULTA
% En caso que se haya indicado el dispositivo 
% entradas: "S" entrada de parte del usuario en forma de pregunta/oracion 
% Salidas: "R" Es la respuesta generada por la funcion y que la almacena
generar_respuesta(S,R):- % utiliza la entrada del usuario S para buscar un patrón de consulta que se corresponda con la entrada.
  patronConsulta(S,_), % busca en la base de datos de patrones de consulta para encontrar un patrón que coincida con la entrada del usuario.
  verificar_dispositivo(S),!, % verfica que el dispositivo se encunetre entre los que estan en la base de datos
  assert(solicitud(consulta)), % Almacena la consulta para generar el informe despues
  resolver_consulta, % Muestra al usuario las causas de un problema con su dispositivo
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R). % Se escoge una frase aleatoria para acompañar a la respuesta a la consulta, posteriormente se guarda en la variable "R"

% Si no lo introduce, en la consulta, se procede a preguntarlo
%entrada: S, que es la entrada del usuario en forma de una lista de palabras.
%Salida R, que es la respuesta generada por la función y que se almacenará en esta variable.
generar_respuesta(S,R):-
  patronConsulta(S,_),!,
  assert(solicitud(consulta)), % se utiliza para registrar la solicitud del usuario en la base de datos
  obtener_dispositivo, %pregunta al usuario si conoce el dispositivo con el que tiene problemas
  resolver_consulta, %Muestra al usuario las causas de un problema con su dispositivo
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración (LR)
  respuesta_aleatoria(LR,R). %En este caso recibe una respuesta del bot preguntando para especificar en el dispositivo

% B) RESPUESTAS A UNA REFERENCIA

% Si en la misma frase el usuario ya indicó el dispositivo y el problema
%entrada: La oración del usuario que se analiza (S) y La respuesta generada por el bot(R)
%salida R, que es la respuesta generada por la función y que se almacenará en esta variable.
generar_respuesta(S,R):-
  patronReferencia(S,_), verificar_dispositivo(S), %busca patrones relacionados con la entrada del usuario y verifica el dispositivo
  es_causa(S,N),!, % busca en la BD una solucion a base del problema indicado
  assert(solicitud(referencia)),% se utiliza para registrar la solicitud del usuario en la base de datos
  imprimir_usuario(bot),write('Esta referencia puede serte útil: '), %imprime que el bot dara respuesta para el usuario
  brindar_referencia(N), % Llama a una función que se encarga de proporcionar las referencias disponibles para el usuario.
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R).%%selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).
% Si se encuentra un patrón de referencia pero no hay una causa asociada, la función no generará una respuesta y se quedará en espera de una nueva entrada del usuario.


% Si en la misma frase el usuario ya indicó el dispositivo y el problema
%entrada: La oración del usuario que se analiza y La respuesta generada por el bot
%salida R, que es la respuesta generada por la función y que se almacenará en esta variable.
generar_respuesta(S,R):-
  patronReferencia(S,_), % Verifica si S contiene un patrón de referencia en la oracion del usuario.
  verificar_dispositivo(S), %verifica que el dispositivo mencionado se encuentre la base de datos
  es_caso_especial(S,N),!,
  assert(solicitud(referencia)), %se utiliza para registrar la solicitud del usuario en la base de datos.
  imprimir_usuario(bot),write('Estas referencias te ayudarán: \n'),
  brindar_referencia(N), % Llama a una función que se encarga de proporcionar las referencias disponibles para el usuario. En esta caso la indicada por el usuario
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R). %selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).

% Si el usuario solo brinda el dispositivo
%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
generar_respuesta(S,R):-
  patronReferencia(S,_), % Verifica si S contiene un patrón de referencia en la oracion del usuario.
  verificar_dispositivo(S),!, %verificar si la entrada del usuario incluye información sobre el dispositivo que está utilizando.
  assert(solicitud(referencia)), % se utiliza para registrar la solicitud del usuario en la base de datos
  brindar_referencias, % Llama a una función que se encarga de proporcionar las referencias disponibles para el usuario.
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R). %selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).

% Si no dice ni dispositivo, ni problema se brindan todas.
%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
generar_respuesta(S,R):-
  patronReferencia(S,_),!, %Verifica si S contiene un patrón de referencia en la oracion del usuario.
  assert(solicitud(referencia)),  % se utiliza para registrar la solicitud del usuario en la base de datos
  obtener_dispositivo, % %pregunta al usuario si conoce el dispositivo con el que tiene problemas
  brindar_referencias, %Llama a una función que se encarga de proporcionar las referencias disponibles para el usuario.
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R). %selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).

% C) RESPUESTAS A UN PROBLEMA
%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
% El usuario indica que tiene un problema, el dispositivo y dice cual
% es la causa (sea específica o general).

generar_respuesta(S,R):-
  patronProblema(S,_), verificar_dispositivo(S), %Verifica si S contiene un patrón de problema en la oracion del usuario. y el dispositivo esta en la base de datos
  es_causa(S,N),!, % Esta función busca en la base de datos si la entrada del usuario corresponde a alguna causa conocida de un problema registrado.
  assert(solicitud(problema)),  % se utiliza para registrar la solicitud del usuario en la base de datos
  brindar_solucion(N,R). % Esta función busca en la base de datos una solución al problema identificado por la causa "N" y genera una respuesta "R" para el usuario.

%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
generar_respuesta(S,R):-
  patronProblema(S,_), verificar_dispositivo(S), %Verifica si S contiene un patrón de problema en la oracion del usuario. y el dispositivo esta en la base de datos
  es_caso_especial(S,N),!, %Verifica si el problema mencionado en la entrada del usuario es un caso especial, es decir, un problema conocido que se ha solucionado anteriormente.
  assert(solicitud(problema)), % se utiliza para registrar la solicitud del usuario en la base de datos
  brindar_solucion(N),% Llama a una función que se encarga de proporcionar las referencias disponibles para el usuario.
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R).  %selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).

% El usuario indica que tiene un problema y el dispositivo.
%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
generar_respuesta(S,R):-
  patronProblema(S,_), verificar_dispositivo(S),!, % Verifica si S contiene un patrón de problema en la oracion del usuario. y el dispositivo esta en la base de datos
  assert(solicitud(problema)),  % se utiliza para registrar la solicitud del usuario en la base de datos
  conoce_el_problema, % Pregunta al usuario si sabe el problema que tiene
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R). % selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).

% El usuario solo indica que tiene un problema.
%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
generar_respuesta(S,R):-
  patronProblema(S,_), !,
  assert(solicitud(problema)),
  obtener_dispositivo, %pregunta al usuario si conoce el dispositivo con el que tiene problemas
  conoce_el_problema, % Pregunta al usuario si sabe el problema que tiene
  respuestas(fin_oracion,LR), % Obtiene una lista de posibles respuestas de fin de oración
  respuesta_aleatoria(LR,R). %selecciona aleatoriamente una respuesta de fin de oración de la lista (LR) y la devuelve como resultado (R).

%--------------------------------------------------------
% buscar despedida "adios"
%Entradas: La oración del usuario que se analiza y La respuesta generada por el bot
%Salida La respuesta generada por el bot
generar_respuesta(S, R):-
  salir(S), !, %verfica que el usuario da cierre a la conversacion con "adios"
	respuestas(despedida, Res), % busca en la base de datos de respuestas una lista de respuestas de despedida.
	respuesta_aleatoria(Res, R). % selecciona una respuesta aleatoria de la lista y la devuelve como salida de la función en el parámetro R.

% Buscar frase de saludo
%Entradas: La oración del usuario que se analiza
%Salida La respuesta generada por el bot
generar_respuesta(S, R):-
  buscar_saludo(S), !, % Verifica si la oración es un saludo en la base de datos
	respuestas(saludo, Res), % busca en la base de datos de respuestas una lista de respuestas de saludo
	respuesta_aleatoria(Res, R). % selecciona una respuesta aleatoria de la lista y la devuelve como salida de la función en el parámetro R.

% Buscar frase de agradecimiento
%Entradas: La oración del usuario que se analiza
%Salida La respuesta generada por el bot
generar_respuesta(S, R):-
  buscar_gracias(S), !, % Verifica si la oración es un agradecimiento en la base de datos
  respuestas(agradecido, Res), % busca en la base de datos de respuestas una lista de respuestas
  respuesta_aleatoria(Res, R). % selecciona una respuesta aleatoria de la lista y la devuelve como salida de la función en el parámetro R.

% Pregunta por el nombre del bot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
generar_respuesta(S, R):-
  patronNombre(S, _), !,
  respuestas(mi_nombre, D),
  respuesta_aleatoria(D, R).


% Responder algo aleatorio%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
generar_respuesta(S, R):-
  buscar_pregunta(S), !,
  respuestas(respuestas_aleatorias, Res),
  respuesta_aleatoria(Res, R).

% Detectar pregunta con por qué%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
generar_respuesta(S, R):-
	oracion(S,_), buscar_pregunta(S), !,
  respuestas(preguntas_aleatorias,PA),
  respuesta_aleatoria(PA,R).

% Detectar frase válida y responder algo random%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
generar_respuesta(S, R):-
	oracion(S,_), !,
  respuestas(respuestas_aleatorias,PA),
  respuesta_aleatoria(PA,R).

% Si el usuario ingresa una incoherencia
generar_respuesta(_,R):-
  respuestas(incompresion,RL),
  respuesta_aleatoria(RL,R).

%---------------------------------------------------------

% respuesta_aleatoria/2
% Escoge una respuesta aleatoria de una lista de respuestas.
%Entrada: Lista de respuestas
%Salida: Respuesta aleatoria escogida
respuesta_aleatoria(Res, R):-
    length(Res, Longitud), %  calcula la longitud de la lista de respuestas Res y la asigna a la variable Longitud.
    Mayor is Longitud + 1, % incrementa la longitud de la lista Res en 1 y asigna el resultado a la variable Mayor. Esto es necesario para asegurarse de que se elige un índice aleatorio que esté dentro de los límites de la lista de respuestas.
    random(1, Mayor, Rand), %genera un número aleatorio Rand entre 1 y Mayor
    nElemento(Res, Rand, R). % busca el elemento en la posición Rand de la lista Res y lo asigna a la variable R. 

%----------------------- Obtener las respuestas de parte del usuario -------------------------

% obtener_nombre/0
% Le pide al usuario un nombre y lo almacena como nombre
% de usuario
%Entrada: Nombre del usuario
%Salida: ninguna. Almacena el nombre del usuario
obtener_nombre:-
  preguntas_db(nombre,LP), %Busca una pregunta en la base datos para preguntar por el nombre del usuario
  respuesta_aleatoria(LP,R), %devuelve una respuesta aleatoria de la lista de preguntas
  imprimir_usuario(bot), % muestran un mensaje al usuario para informar que el bot esta hablando
  imprimir_lista(R), %muestra la respuesta aleatoria seleccionada
  imprimir_usuario(usuario), % muestran un mensaje al usuario para informar que el usuario esta hablando
  readin(S), %lee la entrada del usuario y la almacena
  obtener_nombre(S). %si la entrada del usuario no está vacía, se llama a la función

% obtener_nombre/1
% Verifica que el nombre que ingresa el usuario es válido.
%entrada: nombre del usario dato por este
%saldia: oferta de ayuda del bot
obtener_nombre(P):-
  verificar_nombre(P),!, %verifica que el nombre es valido
  ofrecer_ayuda. %llama funcion que le ofrece ayuda al usuario

%bucle que espera por una entrada del usuario para obtener su nombre. La entrada se verifica y se toma una acción según si es un nombre válido o no.
%Entrada nombre del usuario
%salida oferta de ayuda del bot
obtener_nombre(_):-
  respuestas(obtener_nombre,LR),
  respuesta_aleatoria(LR,RA),
  imprimir_usuario(bot),imprimir_lista(RA),
  imprimir_usuario(usuario),readin(S),
  obtener_nombre(S).

% ofrecer_ayuda/0
% Funciona que indica que el bot esta listo para ayudar.
%Entrada: No se esperan entradas
%salida: mensaje del bot indicando que esta listp para seguir la conversacion
ofrecer_ayuda:-
  respuestas(listo,RL), %obtiene una respuesta aleatoria de la base de datos para seguir la conversacion
  respuesta_aleatoria(RL,R), %Busca una respuesta aleatoria de la base de datos
  imprimir_usuario(bot), %muestra la respuesta escogida
  imprimir_lista(R).

% obtener_dispositivo/0
% Le pide al usuario un dispositivo válido.
%entrada espera entrada del usuario
%salida: pregunta al usuario
obtener_dispositivo:-
  preguntas_db(dispositivo,LP), %se buscan preguntas en la base de datos sobre que el usuario indqiue el dispositivo 
  respuesta_aleatoria(LP,P), %se escoge una pregunta aleatoria de la lista de preguntas para que el usuario responda
  imprimir_usuario(bot),imprimir_lista(P), %se indica "Bot: pregunta escogida"
  imprimir_usuario(usuario),readin(S), %se espera la respuesta del usuario y esta se almacena en "S"
  obtener_dispositivo(S). %se vuelve a llamar hasta que el usario de el nombre del dispositivo o decida terminar la conversacion

% Clausa de salida del bucle de detección de problemas
%entrada: entrada del usuario
%salida: no se espera dar una salida ya que verifica si se dio cierta palabra
obtener_dispositivo(D):-
  member('salir',D), !,fail. %verifica si "salir" se indica por parte del usuario y se detiene

%entrada: entrada del usuario sobre el dispositivo
%salida: no se espera dar una salida explicita ya que es una funcion que verifica 
obtener_dispositivo(D):-
  verificar_dispositivo(D),!. %verifica si el dispositivo dado esta en la base de datos de lo contrario falla

%entrada: no se espera una entrada
%salida: no se espera dar una salida al ser llamada por recursividad y se cumpla que se haya dado el dispositivo
obtener_dispositivo(_):-
  respuestas(obtener_dispositivo,LR), %obtiene una lista de preguntas relacionadas con los dispositivos
  respuesta_aleatoria(LR,RA), %selecciona una pregunta de la lista anterior 
  imprimir_usuario(bot),imprimir_lista(RA), %muestra en pantalla el bot respondiendo al usuario con la pregunta escogida
  imprimir_usuario(usuario),readin(D), %espera la respuesta del usuario y la almacena
  obtener_dispositivo(D). %devuelve la respuesta del usuario

% conoce_el_problema/0
% Realiza preguntas al usuario para determinar si conoce el problema
%Entrada: Respuesta del usuario
%salida: no se espera dar una salida ya que se espera la respuesta del usuario y validarla
conoce_el_problema:-
  imprimir_usuario(bot),write('¿Conoces el problema? (responde con "Si, conozco el problema" o "No, no lo conozco"): ')
  write('¿Conoces cual es tu problema?'), %El bot pregunta si conoce el problema e indica al usuario que espera su respuesta
  readin(S), % lee la respuesta del usario y la almacena
  validar_respuesta(S), %verifica que se haya dado mas que un si o no
  conoce_el_problema(S),!. % llama recursivamente a si mismo con la respuesta dada por el usuario

% Si Sí conoce el problema, solicita la causa y luego lo soluciona
%Entrada: respuesta dada por el usuario (S)
%salida: no se espera una
conoce_el_problema(S):-
  afirmativo(S), !, %verifica que la respuesta dada es una afirmacion
  imprimir_usuario(bot), %imprime el dialogo del bot
  write('¡Sí lo sabes! ¡Entonces dime cuál es!\n'),
  imprimir_usuario(usuario),readin(M),append(M,[' n'],P), %agrega un espacio al final de la respuesta del usuario para evitar error y lo guarda en la variable P
  verificar_problema(P). %verifica si el problema se encuentra en la base de datos

% Si no lo conoce, se procede a realizar obtener_problema
%Entrada: respuesta dada por el usuario (S)
%salida: no se espera una
conoce_el_problema(S):-
  negativo(S), !,%verifica que la respuesta dada es una negacion
  imprimir_usuario(bot),%imprime el dialogo del bot
  write('¡No lo sabes! Bueno, vamos a encontrarlo!\n'),
  obtener_problema. %se llama esta funcion para buscar el problema del usuario

% Clausa de salida del bucle de detección de problemas
%Entrada: respuesta dada por el usuario (S)
%salida: no se espera una
conoce_el_problema(S):-
  member('salir',S), !. %termina la conversacion sobre buscar el problema

% Si el usuario no ingresa si o no, le pide que ingrese una%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
conoce_el_problema(_):-
  imprimir_usuario(bot),
  write('No respondiste con SI o NO, intentalo de nuevo'),
  readin(S), conoce_el_problema(S).

% obtener_problema/0
obtener_problema:-
  imprimir_usuario(bot), %imprime el dialogo del bot
  write('Responde a las siguientes preguntas con SI o NO de forma explicita\n'),
  dispositivo(D),nElemento(D,1,Disp), %solicita el dispositivo mencionado por el usuario y lo asigna a una variable "Disp"
  preguntas_db(Disp,PP), %Toma el dispositivo mencionada y busca preguntas de este en la base de datos y regresa estas
  length(PP,N),obtener_problema(N). %se determina la longitud de la lista de preguntas y empieza hacerle las preguntas necesarias al usuario

% obtener_problema/1
%Entrada: número de preguntas disponibles es 0
%Salida: mensaje informando que el problema no se encuentra en la base de datos
obtener_problema(0):-
  imprimir_usuario(bot),
  write('Lo lamento, parece que tu problema no se encuentra en mi base datos.\n'),!.

%Entrada: Numero disponibles de preguntas acerca del dispositivo escogido
%Salida: no se espera una salida explicita
obtener_problema(N):-
  integer(N),!, %verifica que el numero de preguntas sea un entero
  dispositivo(D),nElemento(D,1,Disp), %se busca el dispositivo en la base de datos
  preguntas_db(Disp,PP),%se busca en la base de datos las preguntas correspondientes a ese dispositivo. 
  nElemento(PP,N,PG),% Se obtiene la pregunta número N de esa lista de preguntas y se imprime en pantalla.
  imprimir_usuario(bot),
  imprimir_lista(PG),
  readin(S),obtener_problema(S,N). %se espera la respuesta del usuario para y el numero de preguntas disponibles

%entrada: Respuesta del usuario y pregunta hecha anteriormente
%salida: Preguntas sobre el dispositivo
% obtener_problema/2
obtener_problema(S,N):-
  negativo(S),!, % %verifica que la respuesta dada es una negacion
  brindar_solucion(N,R), %verifica el numero de preguntas disponibles en la base de datos
  imprimir_lista(R).% genera nueva pregunta

obtener_problema(S,N):-
  afirmativo(S),!,%verifica que la respuesta dada es una afirmacion
  M is N-1, obtener_problema(M). %se quita la pregunta hecha de la lista de preguntas al usuario sobre el problema con dispositivo dado

obtener_problema(S,_):-
  member('salir',S), !. %se sale el proceso de preguntas

obtener_problema(_,_):-
  imprimir_usuario(bot),
  write('No respondiste de forma valida, responde de nuevo'),
  readin(S), obtener_problema(S).

%----------------------- Preguntas y respuestas, funciones axuliares (validacion de condiciones) --------------------------

% resolver_consulta/0
% Muestra al usuario las causas de un problema con su dispositivo
%entrada: no se espera recibir una entrada directa
%salida: lista de posibles causas del problema relacionados al dispositivo
resolver_consulta:-
  imprimir_usuario(bot), %imprime el dialogo del bot
  write('Las posibles causas de su problema son: \n'),
  dispositivo(D),nElemento(D,1,Disp), %obtiene el dispositivo dado y lo almacena en "Disp"
  causas_db(Disp,LS), %Busca en la base datos las causas que se tienen al problema del dispositivo
  length(LS,N), %Obtiene la cantidad de causas disponibles en la base de datos
  imprimir_ul(N,LS),!. %imprime una lista de las causas de forma enumerada y termina la busqueda en la base datos

% brindar_referencias/0
% Brinda al usuario todas las referencias de un dispositivo.
brindar_referencias:-
  imprimir_usuario(bot),write('Esta referencias pueden ayudarte con tu problema: \n'), %imprime el dialogo del bot
  dispositivo(D),nElemento(D,1,Disp), obtiene el dispositivo dado y lo almacena en "Disp"
  referencias(Disp,LR), %Obtiene la cantidad de referencias disponibles en la base de datos
  length(LR,N),imprimir_ul(N,LR),!.  %imprime una lista de las referencias de forma enumerada y termina la busqueda en la base datos

% brindar_referencia/1
% Brinda una o varias referencias asociadas a un problema.
%entrada: Numero de referencias disponibles en la base de datos relacionadas al dispositivo
%salida: Lista de referencias en la base de datos relacionadas al dispositivo
brindar_referencia(N):-
  integer(N),!, %verifica que el numero de referencias sea un entero
  dispositivo(D),nElemento(D,1,Disp), %se busca el dispositivo en la base de datos
  referencias(Disp,LRF), %busca en la base de datos la lista de referencias
  nElemento(LRF,N,RF), %busca la referencia número N de la lista de referencias LRF y se guarda en RF.
  imprimir_lista(RF). %imprime la referencia obtenida

%Entrada: numero de referencias obtenido 
%Salida: imprime las referencias dadas
brindar_referencia(N):-
  dispositivo(D),nElemento(D,1,Disp), obtiene el dispositivo dado y lo almacena en "Disp"
  referencias(Disp,LRF), %Obtiene la cantidad de referencias disponibles en la base de datos
  imprimir_seleccion(LRF,N),!. %imprime la referencia obtenida

% brindar_solucion/2
% Brinda una o varias referencias asociadas a un problema.
brindar_solucion(N,S):-
  integer(N),!,%verifica que el numero de soluciones sea un entero
  dispositivo(D),nElemento(D,1,Disp), %se busca el dispositivo en la base de datos
  respuestas(Disp,LRF),%busca en la base de datos la lista de referencias
  nElemento(LRF,N,S).

% brindar_solucion/1
%entrada: numero de soluciones
%salida: soluciones disponibles
brindar_solucion(N):-
  imprimir_usuario(bot),write('\n'), %imrpime dialogo del bot
  dispositivo(D),nElemento(D,1,Disp), %Se busca el dispositivo en la base de datos para obtener la lista de posibles soluciones.
  respuestas(Disp,LRF), %La selección del usuario se almacena en la variable N.
  imprimir_seleccion(LRF,N),!. %Se imprime la solución seleccionada

%-----------------------Funciones de ayuda sobre el texto  --------------------------


% imprimir_usuario/1
% Escribe en la consola el nombre del usuario que habla
%entrada: atom bot o usuario
%salida: nombre del usuario o bot
imprimir_usuario(bot):-
    nombre_bot(X), write(X), write(': '), flush_output. %muestra que el bot es quien habla
imprimir_usuario(usuario):-
    n_usuario(X), write(X), write(': '), flush_output. % muestra que el usuario es el que habla
nombre_bot('CallCenterLog').
n_usuario('tu').

% buscar_saludo/1
% Verifica si la oración es un saludo en la base de datos
%Entrada: mensaje del usuario
%salida: no hay saldia explicita
buscar_saludo(S):-
  saludos(D), %verifica los saludos en la base de datos
  interseca(S, D, A), %verifica que el mensaje del usuario contiene un saludo
  A \== [].% si no es una lista vacia verifica que efectivamente el usuario saludo

% buscar_pregunta/1
% Verifica si la entrada es una pregunta en la base de datos
%Entrada: mensaje del usuario
%salida: no hay salida explicita
buscar_pregunta(S):-
  member('?',S). %verifica que se esta haciendo una pregunta en el mensaje del usuario

% buscar_gracias/1
% Verifica si la oración es de agradecimiento en la base de datos
%Entrada: mensaje del usuario
%salida: no hay salida explicita
buscar_gracias(S):-
  gracias(D), %busca en la base de datos los agradecimientos
  interseca(S, D, A), %verifica que el mensaje del usuario contiene un agradecimiento
  A \== [].% si no es una lista vacia verifica que efectivamente el usuario agradece

% afirmativo/1
% Retorna verdadero si el usuario responde SI
%entrada: entrada de texto del usuario
%Salida: no hay explicita
afirmativo(S):-
  member('si',S). %verifica que la entrada del usuario es una afirmacion

%Validar_respuesta
%entrada: entrada del usuario
%salida: mensaje indicando error en caso de cumplir
validar_respuesta(S):-
  \+ member('si,', S), %verifica que no se haya dado solo un "si"
  \+ member('no,', S), %verifica que no se haya dado solo un "no"
  imprimir_usuario(bot), %mensaje del bot
  write('Respuesta inválida. Por favor, responde con "Si, conozco el problema" o "No, no lo conozco".\n'),
  readin(NuevaRespuesta), %espera nueva respuesta del usuario
  append(NuevaRespuesta, [' n'], S). %verifica que se cumplio el formato



% afirmativo/1
%entrada: entrada de texto del usuario
%Salida: Retorna verdadero si el usuario responde SI
negativo(S):-
  member('no',S).

% salir/1
% Verifica si la entrada contiene la frase de despedida
%entrada: entrada de texto del usuario
%Salida: mensaje de finalizacion de conversacion
salir(S):-
    subset([adios], S). %verifica si el usuario se despide

% verificar_nombre/1
% Verifica si la entrada contiene un nombre válido
%entrada: entrada de texto del usuario
%Salida: no hay salida explicita, en caso de ingresar nombre valida se almacena en la base de datos
verificar_nombre([N|_]):-
	nombre(N),!, %verifica valides del nombre
	assert(nombre_usuario(N)). % se utiliza para registrar la solicitud del usuario en la base de datos

%entrada: entrada de texto del usuario
%Salida: no hay salida explicita, en caso de ingresar nombre valida se almacena en la base de datos
verificar_nombre([_|R]):-
 	verificar_nombre(R). %verifica el nombre

% verificar_dispositivo/1
% Verifica si el dispositivo es valido, y lo agrega a la base de datos actual.
%entrada: entrada de texto del usuario
%Salida: no hay salida explicita, en caso de ingresar nombre valida se almacena en la base de datos
verificar_dispositivo(S):-
  dispositivos(D), %busca en la base de datos los dispositivos
  interseca(S, D, A), %verifica que se haya dado un dispositivo que se conoce
  A \== [],
  assert(dispositivo(A)). % se utiliza para registrar la solicitud del usuario en la base de datos

% verificar_problema/1
% Verifica que el usuario este ingresando un problema.
%entrada: entrada de texto del usuario
%Salida: lista de posibles causas
verificar_problema(S):-
  es_causa(S,N),!, %verifica si la causa mencionada por el usuario esta presente en la base de datos
  brindar_solucion(N,R), % si la entrada del usuario coincide guara la respuesta en R
  imprimir_lista(R). %imprime la causa

verificar_problema(S):-
%entrada: entrada de texto del usuario
%Salida: true o false
  es_caso_especial(S,N),!, %busca en la base de datos
  brindar_solucion(N). %toma el caso especial

%en caso de que ninguna de las condiciones anteriores se cumplieran 
%se obtiene todas las posibles respuestas para el problema
%entrada: entrada anterior de texto del usuario
%Salida: imprime una lista de los problemas en la base de datos
verificar_problema(_):-
  respuestas(problema,LP), %busca todos los problemas conocidos en la base de datos y los guarda en "LP"
  respuesta_aleatoria(LP,RA), %elige una respuesta a problema conocido aleatoria y la guarda 
  imprimir_usuario(bot), %muestra el comentario del bot mostrando la respuesta aleatoria escogida
  imprimir_lista(RA),fail. %muestra que hubo un problema con esta respuesta y busca una condicion  que encuentre la respuesta

% es_causa/2
% Indica si en una oración se da una causa principal
%entrada: entrada de texto del usuario
%Salida: causa del problema
es_causa(S,N):-
  dispositivo(D), %busca los dispositivos conocidos por la basse de datos
  nElemento(D,1,Disp), %obtiene el primer dispositivo en la lista
  patronCausa(Disp,S,_,N). %busca si el usuario menciona una posible causa que este en la base datos

% es_caso_especial/?
% Indica si se hace request de un problema específico
%entrada: entrada de texto del usuario
%Salida: problema encontrado en la base de datos
es_caso_especial(S,N):-
  dispositivo(D),nElemento(D,1,Disp), %se busca el dispositivo en la base de datos
  patronProbRef(Disp,S,_,N). %se busca si la consulta del usuario es un caso especial, en caso de serlo devuelve respuesta de lo que se tiene en la base de datos

% print_report/0
% Retorna un resumen de la conversación que se tuvo.
print_report:-
  write('\n Conversación: \n'),
	nombre_usuario(X), dispositivo(Z), solicitud(Y), %se busca los valores almacenados en la base de datos con el nombre de usuario, dispositivo y la consulta hecha
  imprimir_lista(['Usuario: ', X, '\nDispositivo: ', Z, '\nSolicitud: ',Y]), %muestra en pantalla los valores mencionado anteriormente
  retract(nombre_usuario(X)),retract(dispositivo(Z)),retract(solicitud(Y)),fail. %Remueve de la base de datos los valores correspondientes al nombre del usuario, dispositivo y solicitud. 
  %Luego, se hace un fail para forzar a la función a fallar, de manera que se pueda activar la siguiente regla que tenga la misma signatura

  print_report. %muestra el resumen de la conversacion

:- consultar.
