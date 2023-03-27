respuestas(despedida, [
        ['Adios!'],
        ['Hasta luego mae']
        ]).


respuestas(saludo, [
        ['Hola, mucho gusto. Mi nombre es Callcenterlog :)'],
        ['Hola! Soy CallCenterLog'],
        ['Bienvenido a CallCenterLog!'],
        ['BUENAS MAEEEE, TODO BIEN!'],
        ['CallCenterLog te saluda.']

        ]).

respuestas(obtener_dispositivo, [
        ['No he escuchado ese antes!'],
        ['Ese no es un dispositivo real...'],
        ['Estas seguro que ese es un dispositivo?'],
        ['Espera un momento, necesito saber el dispositivo con el cual tienes problemas'],
        ['No me quieres decir con que tienes problema?']
        ]).

respuestas(fin_oracion,[
        ['Hasta luego']
        ]).

respuestas(agradecido, [
        ['Estoy agradecido!']
        ]).


respuestas(preguntas_aleatorias, [
               ['¿El clima está agradable hoy?'],
               ['De acuerdo, entiendo.'],
               ['¿Eres fanático de la tecnología?'],
               ['¿Quieres ser amigos?'],
               ['¿Hemos hablado antes?'],
               ['¿A qué te refieres exactamente?'],
               ['Eres un poco descortés, ¿no crees?'],
               ['¿Estás siendo un poco grosero?'],
               ['¿No crees que es un poco tarde para eso?'],
               ['¿Esto tiene algún sentido o es solo aleatorio?'],
               ['Jajaja'],
               [':) ¿Cómo estás?'],
               ['Lo siento, ¿puedes repetir la pregunta?'],
               ['Siempre supe algo así. ¿De qué estás hablando?'],
               ['¿Perdón, puedes repetir la pregunta?'],
               ['Creo que necesito tomarme un descanso.'],
               ['¿Puedes hablar más fuerte? No te escucho bien.'],
               ['Disculpa, ¿puedes repetir lo que dijiste?']
]).

respuestas(respuestas_aleatorias, [
        ['Sí, está bastante bueno. ¿Y tú, qué opinas?'],
           ['Perfecto, ¿tienes alguna otra pregunta que quieras hacerme?'],
           ['Sí, me encanta todo lo relacionado con la tecnología. ¿Y a ti?'],

           ['Claro, me encantaría ser amigos. ¿De qué te gustaría hablar?'],
           ['No estoy seguro, ¿podrías refrescarme la memoria?'],

           ['Me refiero a lo que acabas de decir. ¿Podrías explicármelo un poco más?'],

          ['Lo siento mucho si te he ofendido de alguna manera, no era mi intención. ¿En qué puedo ayudarte?'],

          ['No, para nada. ¿Hay algo en particular que te haya molestado?'],
          ['En realidad, nunca es tarde para nada. ¿De qué se trata?'],
         ['Todo lo que digo tiene sentido, aunque a veces pueda parecer un poco aleatorio. ¿Te puedo ayudar en algo en particular?'],
           ['Me alegro de haberte sacado una risa. ¿Hay algo en lo que pueda ayudarte?'],
           ['Estoy muy bien, gracias por preguntar. ¿Y tú?'],

           ['Me refiero a lo que acabas de decir. ¿Podrías explicármelo un poco más?
'],
           ['Claro, sin problema. ¿Qué necesitas saber exactamente?'],

           ['Claro, tómate el tiempo que necesites. ¿Hay algo que pueda hacer por ti?'],

          ['Claro, disculpa si hablo bajo. ¿Me escuchas mejor ahora?'],
          ['Claro, sin problema. ¿Qué necesitas saber exactamente?']



        ]).

respuestas(incompresion,[
        ['No he entendido lo que dices.'],
        ['Mae yogurt sea serio, escriba bien'],
        ['Dicha solicitud no puede ser procesada intenta de nuevo']
        ]).

% BASE DE DATOS DE RESPUESTAS
% LAS SOLUCIONES A PROBLEMAS SE NUMERAN CON S + NUMERO DE SOLUCION DE LA TABLA CSR

respuestas(model_s, [
        ['Un tecnico ya se encuentra en camino para revisar su vehiculo'], %S10
        ['Limpie la entrada de carga del vehiculo con las instrucciones para ello.'], %S9
        ['Limpie la parte superior del vehiculo para que pueda tener carga de emergencia'], %S8
        ['Ingrese de nuevo sus datos en la consola'], %S7
        ['Usted no se encuentra en la base de datos del vehiculo por favor intente de nuevo.'], %S6
        ['Acepte la nueva actualizacion del software'], %S5
        ['Falla en el sistema, soporte al cliente especializado se va a poner en cotacto con usted.'], %S4
        ['Reinicie la computadora del vehiculo de manera manual.'], %S3
        ['Encienda el vehiculo.'], %S2
        ['Conecte el carro a la corriente electrica.'] %S1
        ]).


respuestas(model_3, [
        ['El caso se esta elevando por favor, no ingrese al vehiculo, quedese en dicho lugar que en breves momentos sera asistido por una unidad de emergenciad de TESLA.'], %S10
        ['Por favor, contacte con la sucursal de tesla mas cercana e informes sobre el error que esta teniendo en este momento .'], %S9
        ['Por favor permita que el vehiculo se conecte a la red de tesla para poder darle seguimiento a su caso, caso contrario contacte con soporte al cliente de carretera'], %S8
        ['Por favor realice el pago de su anualidad a tesla, caso contrario no podrï¿½ conducir el vehiculo.'], %S7
        ['Por favor seleccione en el panel actualizacion de fabrica, esto tardara cerca de 40 minutos a 2 horas dependiendo de la conexion que tenga el carro con la red de tesla.'], %S6
        ['El vehiculo posee una falla considerable, mi sistema no es capaz de relacionar este tipo de fallas con sus posibles causas, por ello es mejor que no lo encienda ya que pueden sar varias causas y que contacte con soporte al cliente especializado'], %S5
        ['Si el sistema no deja que ingrese al panel de control, por favor contacte con soporte al cliente especializado.'], %S4
        ['Si presenta fallas el sistema de manejo automatico por favor contacte al (900 TESLA), y por favor no conduzca el vehiculo en este modo ya que puede provocar un accidente '], %S3
        ['Proceda a cargar el vehiculo, si el puerto de carga del vehiculo esta obtruido por favor limpielo sino contacte con soporte al cliente especializado.'], %S2
        ['Su vehiculo no es el Modelo 3 de Tesla, por favor inicie de nuevo el sistema e ingrese su modelo de vehiculo corretamente'] %S1
        ]).

respuestas(model_X, [
       ['Por favor, contacte con la sucursal de Tesla mas cercana e informes sobre el error que esta teniendo en este momento.'], %S10
       ['Por favor, permita que el vehiculo se conecte a la red de Tesla para poder darle seguimiento a su caso, caso contrario contacte con soporte al cliente de carretera.'], %S9
       ['Por favor realice el pago de su anualidad a Tesla, caso contrario no podra conducir el vehiculo.'], %S8
       ['Por favor seleccione en el panel actualizacion de fabrica, esto tardara cerca de 40 minutos a 2 horas dependiendo de la conexion que tenga el carro con la red de Tesla.'], %S7
       ['El vehiculo posee una falla considerable, mi sistema no es capaz de relacionar este tipo de fallas con sus posibles causas, por ello es mejor que no lo encienda ya que pueden ser varias las causas, por favor contacte con soporte al cliente especializado.'], %S6
       ['Si el sistema no deja que ingrese al panel de control, por favor contacte con soporte al cliente especializado.'], %S5
       ['Si presenta fallas el sistema de manejo automï¿½tico por favor contacte al (900 TESLA), y por favor no conduzca el vehï¿½culo en este modo ya que puede provocar un accidente.'], %S4
       ['Proceda a cargar el vehiculo, si el puerto de carga del vehiculo esta obstruido por favor limpielo sino contacte con soporte al cliente especializado.'], %S3
       ['Por favor verifique si el vehiculo se encuentra en el modo adecuado para su manejo.'], %S2
       ['Su vehiculo no es el Modelo X de Tesla, por favor inicie de nuevo el sistema e ingrese su modelo de vehiculo correctamente.'] %S1
]).


respuestas(model_y, [
       ['El caso se esta elevando, por favor, no ingrese al vehiculo. En breve sera asistido por una unidad de emergencia de Tesla.'], %S10
       ['Por favor, contacte con la sucursal de Tesla mas cercana para informar sobre el error que esta teniendo en este momento.'], %S9
       ['Por favor permita que el vehiculo se conecte a la red de Tesla para poder dar seguimiento a su caso. De lo contrario, contacte con soporte al cliente de carretera.'], %S8
       ['Por favor, realice el pago de su suscripcion a Tesla. De lo contrario, no podra conducir su vehiculo.'], %S7
       ['Por favor, realice el pago de su suscripcion a tesla para seguir manejandolo'], %S6
       ['El vehiculo tiene una falla considerable. Mi sistema no puede relacionar este tipo de fallas con sus posibles causas. Por lo tanto, es mejor que no lo encienda, ya que puede haber varias causas posibles. Contacte con soporte al cliente especializado.'], %S5
       ['Si el sistema no permite el acceso al panel de control, por favor contacte con soporte al cliente especializado.'], %S4
       ['Si presenta fallas el sistema de manejo automatico, por favor contacte al 900-TESLA. Y por favor, no conduzca el vehiculo en este modo, ya que puede provocar un accidente.'], %S3
       ['Por favor, proceda a cargar el vehiculo. Si el puerto de carga del vehiculo esta obstruido, por favor limpielo. De lo contrario, contacte con soporte al cliente especializado.'], %S2
       ['perfecto, como este no es su vehiculo, por favor regrese al menu principal y escoga su vehiculo'] %S1
]).


respuestas(panel_solar, [
        ['Por favor, considere la posibilidad de agregar mas paneles solares de Tesla para mejorar la eficiencia de su instalacion actual.'], %S10
        ['Por favor, asegurese de que su cuenta de Tesla esta al corriente de pagos para poder utilizar su panel solar de manera efectiva.'], %S9
        ['Por favor, intente reiniciar el sistema del panel solar de Tesla para solucionar el problema.'], %S8
        ['Por favor, inspeccione visualmente el panel solar de Tesla para buscar algun dano fisico o impacto.'], %S7
        ['Por favor, asegurese de que la ubicacion actual del panel solar de Tesla tenga una exposicion adecuada al sol.'], %S6
        ['Por favor, revise la tension electrica de entrada y salida del panel solar de Tesla.'], %S5
        ['Por favor, asegï¿½rese de que la conexion a internet del panel solar de Tesla esta funcionando correctamente.'], %S4
        ['Por favor, verifique que los paneles solares estan correctamente instalados y en su lugar.'], %S3
        ['Por favor, revise la conexion del panel solar de Tesla con la bateria de almacenamiento para asegurarse de que esta conectado correctamente.'], %S2
        ['Por favor, revise la conexion del panel solar de Tesla con la red electrica para asegurarse de que esta conectado correctamente.'] %S1
        ]).

respuestas(techo_solar, [
        [' Por favor, revise si su hogar tiene los requisitos elï¿½ctricos necesarios para soportar el sistema'], %S10
        [' Por favor, verifique que el sistema de monitoreo de los paneles solares estï¿½ correctamente conectado a su red WiFi. Si no estï¿½ seguro, por favor contacte a nuestro servicio tï¿½cnico para obtener ayuda..'], %S9
        [' Por favor, revise si hay algï¿½n problema con el sistema de almacenamiento de energï¿½a. Si encuentra algï¿½n problema, por favor contacte a nuestro servicio tï¿½cnico para obtener asistencia.'], %S8
        [' Por favor, verifique si hay algï¿½n problema con el cableado de los paneles solares. Si no estï¿½ seguro, por favor contacte a nuestro servicio tï¿½cnico para obtener ayuda.'], %S7
        [' Por favor, revise que los inversores de los paneles solares estï¿½n funcionando correctamente. Si no estï¿½ seguro, por favor contacte a nuestro servicio tï¿½cnico para obtener ayuda.'], %S6
        [' Por favor, verifique si ha recibido alguna notificaciï¿½n del sistema de monitoreo de los paneles solares. Si no ha recibido ninguna notificaciï¿½n, por favor revise la configuraciï¿½n del sistema de monitoreo para asegurarse de que estï¿½ funcionando correctamente.'], %S5
        [' Por favor, verifique que los paneles solares estï¿½n correctamente conectados al sistema elï¿½ctrico de su hogar. Si no estï¿½ seguro, por favor contacte a nuestro servicio tï¿½cnico para obtener ayuda.'], %S4
        [' Es importante realizar el mantenimiento regular de los paneles solares para asegurar su correcto funcionamiento. Por favor, revise si ha realizado los mantenimientos requeridos y, si no es asï¿½, programe una cita con un especialista para realizar el mantenimiento correspondiente.'], %S3
        [' Le pedimos que revise cuidadosamente la superficie de los paneles solares en busca de cualquier daï¿½o visible. Si encuentra algï¿½n daï¿½o, por favor contacte a nuestro servicio tï¿½cnico para obtener asistencia.'], %S2
        [' Por favor, revise que los paneles solares estï¿½n ubicados en una zona donde reciban suficiente luz solar. Si no estï¿½ seguro, por favor contacte a un especialista para que le asesore.'] %S1
        ]).



respuestas(cyber_truck, [
        [' ï¿½Sabe cuï¿½l es la fecha de lanzamiento de la Cybertruck de Tesla? Respuesta: Aunque aï¿½n no se ha establecido una fecha exacta, se espera que la producciï¿½n de la Cybertruck'], %S10
        [' La Cybertruck de Tesla cuenta con una caja de carga personalizable que se adapta a sus necesidades de trabajo y transporte. Si aï¿½n no ha considerado esta opciï¿½n, le recomendamos que lo haga para obtener la mejor experiencia con su vehï¿½culo. '], %S9
        [' La Cybertruck de Tesla cuenta con una impresionante autonomï¿½a de hasta 800 km con una sola carga, lo que la hace ideal para largos viajes. Si aï¿½n no ha revisado esta informaciï¿½n, le recomendamos que lo haga para conocer en detalle su rendimiento.'], %S8
        [' La Cybertruck de Tesla cuenta con la opciï¿½n de autoconducciï¿½n, lo que permite una experiencia de conducciï¿½n mï¿½s segura y eficiente. Si aï¿½n no ha considerado esta opciï¿½n, le recomendamos que lo haga. '], %S7
        [' La Cybertruck de Tesla cuenta con un sistema de seguridad avanzado que incluye cï¿½maras de 360 grados y airbags laterales, entre otras caracterï¿½sticas. Si aï¿½n no ha revisado estas caracterï¿½sticas, le recomendamos que lo haga para conocer en detalle su seguridad en el camino. '], %S6
        [' La Cybertruck de Tesla cuenta con una amplia variedad de opciones de personalizaciï¿½n, desde la elecciï¿½n del color hasta la configuraciï¿½n de la baterï¿½a. Si aï¿½n no ha considerado estas opciones, le recomendamos que lo haga para obtener la mejor experiencia con su vehï¿½culo..'], %S5
        [' La Cybertruck de Tesla cuenta con la opciï¿½n de energï¿½a solar para cargar sus baterï¿½as, lo que permite una carga mï¿½s eficiente y respetuosa con el medio ambiente. Si aï¿½n no ha considerado esta opciï¿½n, le recomendamos que lo haga..'], %S4
        [' La Cybertruck de Tesla cuenta con un diseï¿½o innovador y futurista que ha sido muy comentado desde su presentaciï¿½n. Si aï¿½n no ha visto su diseï¿½o, le recomendamos que visite nuestro sitio web oficial para conocerlo en detalle..'], %S3
        [' Si aï¿½n no ha reservado una Cybertruck de Tesla, puede hacerlo en nuestro sitio web oficial. Le recomendamos que se registre lo antes posible, ya que la demanda es muy alta y las unidades se estï¿½n agotando rï¿½pidamente..'], %S2
        [' Si no estï¿½ seguro o no ha oï¿½do hablar de la camioneta Cybertruck de Tesla, le recomendamos que visite nuestro sitio web oficial para obtener mï¿½s informaciï¿½n sobre las caracterï¿½sticas y especificaciones del vehï¿½culo.'] %S1
        ]).




respuestas(listo, [
        ['En que mas te puedo ayudar?']
           ]).

respuestas(problema, [
        ['Explica mejor el problema/dispositivo'],
        ['No entiendo tu problema por favor explicalo mejor']
           ]).

% BASE DE DATOS DE CAUSAS

causas_db(model_s, [
        ['elevando el caso'],
        ['la entrada de carga esta sucia por favor limpiela'],
        ['los paneles solares del vehiculo estan obstruidos por favor limpiarlos.'],
        ['No puede acceder a la pantalla de configuracion manualmente.'],
        ['Necesita que sea un administrador para esta configuracion'],
        ['No posee la ultima version del software.'],
        ['No tiene acceso al panel de configuracion, por favor contacte con soporte al cliente especializado.'],
        ['El vehiculo presenta fallos de conexion, intente de nuevo'],
        ['El vehiculo no esta encendido'],
        ['El carro no posee la corriente suficiente para encender.']
        ]).

causas_db(model_3, [
        ['El caso se eleva'],  %10
         ['No da permiso para ingresar al vehiculo'],  %9
        ['El vehï¿½culo esta desconectado no cuenta con los permisos adminsitrativos'],  %8
        ['No ha pagado la suscripciï¿½n a TESLA.com.'], %7
        ['No muestra actualizaciones disponibles.'], %6
        ['El sistema no deja que lo reinicie.'], %5
        ['No tiene acceso al panel de contro(ï¿½mensaje criticoï¿½).'], %4
        ['No presenta fallas en el sistema de manejon automatico.'], %3
        ['No presenta falla de carga.'], %2
        ['Su vehï¿½culo no es el Tesla Modelo 3.'] %1
        ]).



causas_db(model_x, [
        ['El vehï¿½culo presenta un error desconocido, por favor contacte con soporte al cliente especializado.'], %10
        ['El vehï¿½culo se encuentra desconectado de la red de Tesla.'],
        ['No ha pagado la suscripciï¿½n a Tesla.com.'],
        ['No muestra actualizaciones disponibles.'],
        ['El sistema no puede identificar la falla del vehï¿½culo.'],
        ['El sistema no permite el acceso al panel de control.'],
        ['El sistema de manejo automï¿½tico presenta fallas.'],
        ['El puerto de carga del vehï¿½culo estï¿½ obstruido.'],
        ['El vehï¿½culo no se encuentra en el modo adecuado para su manejo.'],
        ['Su vehï¿½culo no es el Tesla Modelo X.']
          ]).%1

causas_db(model_y, [
    ['El caso se eleva.'], %10
    ['No da permiso para ingresar al vehï¿½culo.'], %9
    ['El vehï¿½culo estï¿½ desconectado y no cuenta con los permisos administrativos necesarios.'], %8
    ['No ha pagado la suscripciï¿½n a Tesla.'], %7
    ['No muestra actualizaciones disponibles.'], %6
    ['El sistema no permite reiniciar el vehï¿½culo.'], %5
    ['No tiene acceso al panel de control ("mensaje crï¿½tico").'], %4
    ['Presenta fallas en el sistema de manejo automï¿½tico.'], %3
    ['Presenta fallas en el sistema de carga.'], %2
    ['Su vehï¿½culo no es el Tesla Modelo Y.'] %1
]).

causas_db(cyber_truck, [
              ['La fecha de lanzamiento se ha retrasado.'], %10
              ['No ha solicitado la opción de personalización de la caja de carga.'], %9
              ['La autonomía de la batería no cumple con sus necesidades.'], %8
              ['No ha solicitado la opción de autoconducción.'], %7
              ['No está seguro/a de las características de seguridad del vehículo.'], %6
              ['No ha explorado todas las opciones de personalización disponibles.'], %5
              ['La opción de energía solar no es factible para sus necesidades.'], %4
              ['No le gusta el diseño futurista de la Cybertruck.'], %3
              ['No ha reservado una Cybertruck todavía.'], %2
              ['No está interesado/a en adquirir una Cybertruck.'] %1
]).

causas_db(panel_solar,[
        ['La instalaciï¿½n de los paneles solares estï¿½ presentando una falla crï¿½tica.'], %10
        ['Los paneles solares no estï¿½n produciendo energï¿½a elï¿½ctrica.'], %9
        ['No se ha realizado el mantenimiento adecuado a los paneles solares.'], %8
        ['Los paneles solares no estï¿½n conectados correctamente al sistema elï¿½ctrico de la casa.'], %7
        ['Los paneles solares han sufrido daï¿½os por condiciones climï¿½ticas extremas.'], %6
        ['El sistema de monitoreo de los paneles solares ha detectado una falla.'], %5
        ['Los paneles solares no estï¿½n recibiendo suficiente luz solar.'], %4
        ['Se ha producido un fallo en el inversor de los paneles solares.'], %3
        ['Los paneles solares estï¿½n generando una cantidad de energï¿½a inferior a la esperada.'], %2
        ['Los paneles solares no son compatibles con el sistema elï¿½ctrico de la casa.'] %1
        ]).

causas_db(techo_solar, [
      ['Falla en la conexiï¿½n elï¿½ctrica entre los paneles solares y el inversor.'],
      ['Suciedad o daï¿½o en los paneles solares.'],
      ['Falla en el sistema de monitoreo de los paneles solares.'],
      ['Fallo en el inversor de los paneles solares.'],
      ['Incompatibilidad del sistema elï¿½ctrico de la casa con los paneles solares.'],
      ['Falta de luz solar suficiente para generar energï¿½a elï¿½ctrica.'],
      ['Daï¿½os en los paneles solares debido a condiciones climï¿½ticas extremas.'],
      ['Falta de mantenimiento adecuado de los paneles solares.'],
      ['Problemas en el sistema de conexiï¿½n elï¿½ctrica de la casa.'],
      ['Falta de energï¿½a elï¿½ctrica suficiente en la casa para hacer uso de los paneles solares.']
]).


% BASE DE DATOS DE PREGUNTAS.
% LAS CAUSAS DE PROBLEMAS SE NUMERAN CON C + NÃšMERO DE CAUSA DE LA TABLA CSR.

preguntas_db(dispositivo, [
       ['Hola, en que dispositivo estas teniendo problemas?'],
       ['Podrias decirme cual es el dispositivo que te esta dando problemas?'],
       ['Me puedes indicar cual es el dispositivo con el que tienes problemas?'],
       ['Que dispositivo necesita asistencia tecnica?']
]).

preguntas_db(model_s, [
        ['necesita que un tecnico vaya a su casa para revisar el vehiculo?'], %C10
        ['la entrada de carga esta limpia?'], %C9
        ['Su vehiculo no ha requerido de alguna repacion en los ultimos 15 dias?'], %C8
        ['Que le sale en la pantalla de configuracion?'], %C7
        ['Ya pago su suscripcion a Tesla este mes?'], %C6
        ['Su modelo tiene la ultima version del software, recordar que esta es la V2.2?'], %C5
        ['Tiene acceso al panel de configuracion por administrador del vehiculo?'], %C4
        ['Puede encender el vehiculo?'], %C3
        ['Puede acceder al interior del vehiculo?'], %C2
        ['El carro tiene una carga minima del 10%?'] %C1
        ]).

preguntas_db(model_3, [
        ['No quiere que eleve el caso para que una persona calificada vaya a ver su inconveniente?'], %C10
        ['No me da permiso de ingresar a el sistema de su vehiculo?'], %C9
        ['El vehï¿½culo Tesla Model 3 no se encuentra conectado a la red de Tesla?'], %C8
        ['No ha realizado el pago la suscripciï¿½n a Tesla de este mes?'], %C7
        ['No le da opciones de actualizaciï¿½n le da la consola?'], %C6
        ['El sistema no deja que lo reinicie de fabrica?'], %C5
        ['No tiene acceso al panel del control(en la pantalla central del vehiculo)?'], %C4
        ['No presenta fallas el sistema de manejo automatico'], %C3
        ['No presenta fallas de carga?'], %C2
        ['El vehï¿½culo es un Tesla Model 3?'] %C1
        ]).



preguntas_db(model_x, [
        ['Quiere que eleve el caso para que una persona calificada vaya a ver su inconveniente?'], %C10
        ['Me da permiso de ingresar a el sistema de su vehiculo?'], %C9
        ['El vehï¿½culo Tesla Model X se encuentra conectado a la red de Tesla?'], %C8
        ['Ya pago la suscripciï¿½n a Tesla de este mes?'], %C7
        ['Que opciones de actualizaciï¿½n le da la consola?'], %C6
        ['El sistema deja que lo reinicie de fabrica?'], %C5
        ['Tiene acceso al panel del control(en la pantalla central del vehiculo)?'], %C4
        ['Presenta fallas el sistema de manejo automatico'], %C3
        ['Presenta fallas de carga?'], %C2
        ['El vehï¿½culo es un Tesla Model X?']
             ]).


preguntas_db(model_y, [
       ['El vehï¿½culo presenta problemas de conectividad con la red de Tesla, ï¿½ha intentado reiniciar el sistema de conexiï¿½n?'], %C10
        ['ï¿½Ha recibido algï¿½n mensaje de error en la pantalla central del vehï¿½culo?'], %C9
        ['ï¿½Ha contactado con el soporte al cliente de carretera de Tesla?'], %C8
        ['ï¿½Tiene actualizada la ï¿½ltima versiï¿½n de software en su vehï¿½culo Tesla Model Y?'], %C7
        ['ï¿½Ha realizado el pago correspondiente a la suscripciï¿½n mensual de Tesla?'], %C6
        ['ï¿½No ha tenido alguna dificultad al utilizar el sistema de manejo automï¿½tico del vehï¿½culo?'], %C5
        ['ï¿½Ha verificado que el puerto de carga del vehï¿½culo estï¿½ limpio y libre de obstrucciones?'], %C4
        ['ï¿½No ha recibido alguna notificaciï¿½n o mensaje crï¿½tico en la pantalla central del vehï¿½culo?'], %C3
        ['ï¿½EL vehiculo esta cargado'], %C2
        ['ï¿½EL vehiculo es el tesla Model Y'] %C1
]).

preguntas_db(panel_solar, [
        ['ï¿½Ha considerado la posibilidad de agregar mï¿½s paneles solares de Tesla a su instalaciï¿½n actual?'], %C10
        ['ï¿½Ha verificado que su cuenta de Tesla estï¿½ actualizada y al corriente de pagos?'], %C9
        ['ï¿½Ha intentado reiniciar el sistema del panel solar de Tesla?'], %C8
        ['ï¿½Ha notado algï¿½n daï¿½o fï¿½sico en el panel solar de Tesla?'], %C7
        ['ï¿½Ha cambiado recientemente el lugar de instalaciï¿½n del panel solar de Tesla?'], %C6
        ['ï¿½Ha experimentado alguna fluctuaciï¿½n en la tensiï¿½n elï¿½ctrica proporcionada por el panel solar de Tesla?'], %C5
        ['Ha tenido algï¿½n problema con la conexiï¿½n a internet del panel solar de Tesla?'], %C4
        ['ï¿½Ha notado alguna disminuciï¿½n en la producciï¿½n de energï¿½a del panel solar de Tesla?'], %C3
        ['ï¿½Ha revisado la conexion del panel solar de Tesla con la baterï¿½a de almacenamiento?'], %C2
        ['ï¿½Se encuentra el panel solar de Tesla conectado a la red electrica?'] %C1
        ]).


preguntas_db(techo_solar, [
        [' ï¿½Ha verificado si su hogar tiene los requisitos elï¿½ctricos necesarios para soportar el sistema de paneles solares?'], %C10
        ['Ha verificado que el sistema de monitoreo de los paneles solares estï¿½ conectado correctamente a su red WiFi?'], %C9
        [' ï¿½Ha revisado si hay algï¿½n problema con el sistema de almacenamiento de energï¿½a?'], %C8
        [' ï¿½Ha revisado si hay algï¿½n problema con el cableado de los paneles solares?'], %C7
        [' ï¿½Ha verificado que los inversores de los paneles solares estï¿½n funcionando correctamente?'], %C6
        ['ï¿½ recibido alguna notificaciï¿½n del sistema de monitoreo de los paneles solares?'], %C5
        ['ï¿½Ha verificado que los paneles solares estï¿½n correctamente conectados al sistema elï¿½ctrico de su hogar?'], %C4
        ['ï¿½Ha realizado el mantenimiento regular de los paneles solares?'], %C3
        [' ï¿½Ha revisado el estado de los paneles solares en busca de algï¿½n daï¿½o o rotura?'], %C2
        [' ï¿½Ha verificado que los paneles solares estï¿½n recibiendo suficiente luz solar?'] %C1
        ]).

preguntas_db(cyber_truck, [
        [' ï¿½Sabe cuï¿½l es la fecha de lanzamiento de la Cybertruck de Tesla?'], %C10
        ['ï¿½Ha considerado la opcion de la caja de carga personalizada para su Cybertruck de Tesla?'], %C9
        [' ï¿½Sabe cual es el rango de conduccion de la Cybertruck de Tesla?'], %C8
        [' ï¿½Ha considerado la opcion de autoconduccionn para su Cybertruck de Tesla?'], %C7
        [' ï¿½Sabe cuales son las caracteristicas de seguridad de la Cybertruck de Tesla?'], %C6
        [' ¿Sabe cuales son las opciones de personalizacion disponibles para la Cybertruck de Tesla?'], %C5
        [' ï¿Ha considerado la opcion de energia solar para cargar su Cybertruck de Tesla?'],%C4
        [' ¿Esta familiarizado con el disenoo futurista de la Cybertruck de Tesla?'], %C3
        [' ¿Ha reservado ya una Cybertruck de Tesla?'], %C2
        [' ïEsta interesado en la camioneta Cybertruck de Tesla?? '] %C1
        ]).


/*
['Okay. Did you find any of the talks interesting?'],
['Hmm. Do you think the open day has been well organised?'],
['Ok, thanks. Have the student ambassadors been helpful?'],
['So, what are your thoughts on the open day overall?']
*/


% BASE DE DATOS DE REFERENCIAS
% LAS REFERENCIAS SE NUMERAN COMO R + NUMERO DE REFERENCIA EN TABLA CSR.

referencias(model_s, [
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R10
        ['https://www.tesla.com/support/vehicle-warranty'], %R9
        ['https://www.tesla.com/support/software-updates'], %R8
        ['https://www.tesla.com/support/vehicle-warranty'], %R7
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R6
        ['https://www.tesla.com/support/roadside-assistance'], %R5
        ['https://www.tesla.com/support/vehicle-warranty'], %R4
        ['https://www.tesla.com/support/roadside-assistance'], %R3
        ['https://www.tesla.com/support/collision-support'], %R2
        ['https://www.tesla.com/support/roadside-assistance'] %R1
        ]).

referencias(model_3, [
         ['https://www.tesla.com/support/vehicle-safety-security-features'], %R10
        ['https://www.tesla.com/support/vehicle-warranty'], %R9
        ['https://www.tesla.com/support/software-updates'], %R8
        ['https://www.tesla.com/support/vehicle-warranty'], %R7
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R6
        ['https://www.tesla.com/support/roadside-assistance'], %R5
        ['https://www.tesla.com/support/vehicle-warranty'], %R4
        ['https://www.tesla.com/support/roadside-assistance'], %R3
        ['https://www.tesla.com/support/collision-support'], %R2
        ['https://www.tesla.com/support/roadside-assistance'] %R1
        ]).



referencias(model_x, [
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R10
        ['https://www.tesla.com/support/vehicle-warranty'], %R9
        ['https://www.tesla.com/support/software-updates'], %R8
        ['https://www.tesla.com/support/vehicle-warranty'], %R7
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R6
        ['https://www.tesla.com/support/roadside-assistance'], %R5
        ['https://www.tesla.com/support/vehicle-warranty'], %R4
        ['https://www.tesla.com/support/roadside-assistance'], %R3
        ['https://www.tesla.com/support/collision-support'], %R2
        ['https://www.tesla.com/support/roadside-assistance'] %R1
        ]).


referencias(model_y, [
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R10
        ['https://www.tesla.com/support/vehicle-warranty'], %R9
        ['https://www.tesla.com/support/software-updates'], %R8
        ['https://www.tesla.com/support/vehicle-warranty'], %R7
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R6
        ['https://www.tesla.com/support/roadside-assistance'], %R5
        ['https://www.tesla.com/support/vehicle-warranty'], %R4
        ['https://www.tesla.com/support/roadside-assistance'], %R3
        ['https://www.tesla.com/support/collision-support'], %R2
        ['https://www.tesla.com/support/roadside-assistance'] %R1
        ]).


referencias(cyber_truck,[
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R10
        ['https://www.tesla.com/support/vehicle-warranty'], %R9
        ['https://www.tesla.com/support/software-updates'], %R8
        ['https://www.tesla.com/support/vehicle-warranty'], %R7
        ['https://www.tesla.com/support/vehicle-safety-security-features'], %R6
        ['https://www.tesla.com/support/roadside-assistance'], %R5
        ['https://www.tesla.com/support/vehicle-warranty'], %R4
        ['https://www.tesla.com/support/roadside-assistance'], %R3
        ['https://www.tesla.com/support/collision-support'], %R2
        ['https://www.tesla.com/support/roadside-assistance'] %R1
        ]).




referencias(techo_solar,[
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/billing'], %R10
        ['https://www.tesla.com/support/energy/solar-roof/install/solar-roof-installations
'], %R9
        ['https://www.tesla.com/support/how-make-payments-tesla-app'], %R8
        ['https://www.tesla.com/support/energy/solar-roof/install/solar-roof-installations
'], %R7
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/turning-on-your-system'], %R6
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/what-to-expect-after-installation'], %R5
        ['https://www.tesla.com/support/energy/solar-inverter/connecting-to-tesla-solar-inverter'], %R4
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/billing'], %R3
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/what-to-expect-after-installation'], %R2
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/turning-on-your-system'] %R1
        ]).


referencias(panel_solar,[
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/turning-on-your-system'], %R10
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/billing'], %R9
        ['https://www.tesla.com/support/energy/solar-inverter/connecting-to-tesla-solar-inverter'], %R8
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/what-to-expect-after-installation'], %R7
        [ 'https://www.tesla.com/support/energy/solar-roof/install/solar-roof-installations'], %R6
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/billing'], %R5
        ['https://www.tesla.com/support/how-make-payments-tesla-app'], %R4
        ['https://www.tesla.com/support/energy/solar-roof/install/solar-roof-installations'], %R3
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/turning-on-your-system'], %R2
        ['https://www.tesla.com/support/energy/solar-panels/after-installation/what-to-expect-after-installation'] %R1
        ]).


% DEFINICION DE ENTRADAS

saludos([
        hola,
        hi,
        hey,
        saludos
        ]).

gracias([
        gracias,
        muchas_gracias,
        gracia,
        mucha_gracia,
        muchasgracias
        ]).

dispositivos([
        model_s,
        model_3,
        model_x,
        model_y,
        cyber_truck,
        panel_solar,
        techo_solar
        ]).

% patronConsulta
% Busca patrones que indican que el usuario estï¿½ realizando
% una consulta.

% Consulta
patronConsulta([tengo, una, consulta, X|_],X):-!.
patronConsulta([necesito, consultar, X|_],X):-!.
patronConsulta([realizar, una, consulta, X|_],X):-!.
patronConsulta([hacer, una, consulta, X|_],X):-!.
patronConsulta([necesito, conocer, X|_],X):-!.
patronConsulta([consulta, X|_],X):-!.
patronConsulta([consultar, X|_],X):-!.

% Causas
patronConsulta([cuales, son, las, causas, X|_],X):-!.
patronConsulta([quiero, saber, las, causas, X|_],X):-!.
patronConsulta([cual, es, la, causa, X|_],X):-!.
patronConsulta([causas, X|_],X):-!.
patronConsulta([causa, X|_],X):-!.
patronConsulta([que, puede, causar, X|_],X):-!.

% Por que?
patronConsulta([por, que, X|_],X):-!.

patronConsulta([_|T],X):-
  patronConsulta(T,X).

% patronReferencia/2
% Busca patrones que indican que el usuario estï¿½ solicitando
% una Referencia.

% Referencia
patronReferencia([tienes, una, referencia, X|_],X):-!.
patronReferencia([tendras, referencias, X|_],X):-!.
patronReferencia([puedo, conseguir, informacion, X|_],X):-!.
patronReferencia([tienes, informacion, acerca, de, X|_],X):-!.
patronReferencia([necesito, conocer, X|_],X):-!.
patronReferencia([necesito, informacion, X|_],X):-!.
patronReferencia([tienes, alguna, referencia, X|_],X):-!.
patronReferencia([referencia, X|_],X):-!.
patronReferencia([referencias, X|_],X):-!.

patronReferencia([_|T],X):-
  patronReferencia(T,X).

% patronProblema/2
% Busca patrones que indican un problema del usuario.

%~ problema
patronProblema([tengo, un, problema, X |_], X):- !.
patronProblema([presentan, un, problema, X |_], X):-!.
patronProblema([presenta, un, problema, X |_], X):-!.
patronProblema([tiene, un, problema, X |_], X):-!.
patronProblema([tienen, un, problema, X |_], X):-!.
patronProblema([problema, X |_], X):-!.

%~ funciona
patronProblema([no, funciona, X |_], X):-!.
patronProblema([no, funcionan, X |_], X):-!.
patronProblema([no, esta, funcionando, X |_], X):- !.
patronProblema([no, estan, funcionando, X |_], X):- !.
patronProblema([mal, funcionamiento, X |_], X):-!.
patronProblema([funciona, mal, X |_], X):- !.
patronProblema([funcionan, mal, X |_], X):- !.
patronProblema([funcionar, X |_], X):- !.

%~ daï¿½os
patronProblema([esta, danado, X|_], X):- !.
patronProblema([estan, danados, X|_], X):- !.
patronProblema([esta, danada, X|_], X):- !.
patronProblema([se,dano, X|_], X):-!.
patronProblema([se,danaron, X|_], X):-!.
patronProblema([un,dano, X|_], X):-!.

% Expresiones varias
patronProblema([no, corre, X |_], X):-!.
patronProblema([algo, anda, mal, X |_], X):-!.
patronProblema([presenta, un, error, X |_], X):-!.
patronProblema([esta, malo, X |_], X):-!.
patronProblema([estan, malos, X |_], X):-!.
patronProblema([no, sirve, X |_], X):-!.
patronProblema([tengo, un, inconveniente, X |_], X):-!.
patronProblema([tengo, inconvenientes, X |_], X):-!.
patronProblema([presento, un, inconveniente, X |_], X):-!.
patronProblema([presenta, un, inconveniente, X |_], X):-!.
patronProblema([se, me, presenta, un, inconveniente, X |_], X):-!.
patronProblema([tengo, dificultades, X |_], X):-!.
patronProblema([tengo, una, dificultad, X |_], X):-!.
patronProblema([dificultades, X |_], X):-!.
patronProblema([dificultad, X |_], X):-!.

patronProblema([_|T], X):-
  patronProblema(T, X).

% patronProbRef/4

% Problema-Referencia de model_s
patronProbRef(model_s,[no, arranca, X|_],X, [9,5,4]):- !.
patronProbRef(model_s,[no, enciende, X|_],X, [10,9]):- !.
patronProbRef(model_s,[no, conecta, X|_],X, [5]):- !.

% Problema-Referencia de computadora
patronProbRef(model_3,[no, enciende, X|_],X, [10,9,4]):- !.


% Problema-Referencia del model_x
patronProbRef(model_x,[no, enciende, X|_],X, [10,9,8,7]):- !.

% Problema-Referencia de model_y
patronProbRef(model_y,[no, enciende, X|_],X, [9,4,3]):- !.


% Problema-Referencia del panel_solar
patronProbRef(panel_solar, [quiero, terminarla, X|_],X,[10,7,5]):- !.
patronProbRef(panel_solar, [quiero, terminarlo, X|_],X,[10,7,5]):- !.
patronProbRef(panel_solar, [no, lo, soporto, X|_],X,[4,9]):- !.
patronProbRef(panel_solar, [no, la, soporto, X|_],X,[4,9]):- !.
patronProbRef(panel_solar, [me, es, infiel, X|_],X,[9]):- !.

patronProbRef(D,[_|T],X,N):-
  patronProbRef(D,T,X,N).

% patronCausa/4
% para que estos patrones funcionen, se necesita un punto al final
% Busca patrones en las causas de un problemas

% Causas model_s
patronCausa(model_s,[esta, descargado, X |_], X, NS):- !, NS is 10.
patronCausa(model_s,[esta, cerrado, X |_], X, NS):- !, NS is 9.
patronCausa(model_s,[no, enciende, X |_], X, NS):- !, NS is 8.
patronCausa(model_s,[no,tengo,acceso, X |_], X, NS):- !, NS is 7.
patronCausa(model_s,[no, esta, actualizado, X |_], X, NS):- !, NS is 6.
patronCausa(model_s,[no, he, pagado, X |_], X, NS):- !, NS is 5.
patronCausa(model_s,[no, sale, nada, en, la, pantalla, X |_], X, NS):- !, NS is 4.
patronCausa(model_s,[parte, superior, sucia, X|_], X, NS):- !, NS is 3.
patronCausa(model_s,[entrada, sucia, X |_], X, NS):- !, NS is 2.
patronCausa(model_s,[ocupo, un, tecnico, X |_], X, NS):- !, NS is 1.

% Causas model_3
patronCausa(model_3, [no, es, el, modelo_3, X |_], X, NS):-! ,NS is 10.
patronCausa(model_3, [no, enciende, X |_], X, NS):- !, NS is 9.
patronCausa(model_3, [tiene, el, puerto, obstruido, X |_], X, NS):-!, NS is 9.
patronCausa(model_3, [no, maneja, automaticamente, X |_], X, NS):- !, NS is 8.
patronCausa(model_3, [no, deja, ingresar, X |_], X, NS):-!, NS is 7.
patronCausa(model_3, [echa, fuego, X |_], X, NS):-!, NS is 6.
patronCausa(model_3, [esta, desactualizado, X |_], X, NS):-!, NS is 5.
patronCausa(model_3, [no, esta, pago, X |_], X, NS):-!, NS is 4.
patronCausa(model_3, [esta, desconectado, X |_], X, NS):-!, NS is 3.
patronCausa(model_3, [tiene, un, error, X |_], X, NS):- !, NS is 2.
patronCausa(model_3, [ocupo, un, tecnico, X |_], X, NS):- !, NS is 1.

% Causas model_x
patronCausa(model_x, [no, es, el, modelo_x, X |_], X, NS):- !, NS is 10.
patronCausa(model_x, [no, deja, manejar, X |_], X, NS):-!, NS is 9.
patronCausa(model_x, [no, enciende, X |_], X, NS):-!, NS is 8.
patronCausa(model_x, [no, maneja, automaticamente, X |_], X, NS):-!, NS is 7.
patronCausa(model_x, [no, deja, ingresar, X |_], X, NS):-!, NS is 6.
patronCausa(model_x, [echa, fuego, X |_], X, NS):-!, NS is 5.
patronCausa(model_x, [esta, desactualizado, X |_], X, NS):- !, NS is 4.
patronCausa(model_x, [no, esta, pago, X |_], X, NS):- !, NS is 3.
patronCausa(model_x, [esta, desconectado, X |_], X, NS):- !, NS is 2.
patronCausa(model_x, [tiene, un, error, X |_], X, NS):- !, NS is 1.

% Causas model_y
patronCausa(model_y, [no, es, el, modelo_x, X |_], X, NS):- !, NS is 10.
patronCausa(model_y, [no, enciende, X |_], X, NS):- !, NS is 9.
patronCausa(model_y, [no, maneja, automaticamente, X |_], X, NS):- !, NS is 8.
patronCausa(model_y, [no, deja, ingresar, X |_], X, NS):- !, NS is 7.
patronCausa(model_y, [echa, fuego, X |_], X, NS):- !, NS is 6.
patronCausa(model_y, [no, esta, pago, X |_], X, NS):- !, NS is 5.
patronCausa(model_y, [no, estoy, suscrito, X |_], X, NS):-!, NS is 4.
patronCausa(model_y, [esta, desconectado, X |_], X, NS):- !, NS is 3.
patronCausa(model_y, [tiene, un, error, X |_], X, NS):- !, NS is 2.
patronCausa(model_y, [ocupo, ayuda, X |_], X, NS):- !, NS is 1.

% Causas panel_solar
patronCausa(panel_solar, [esta, desconectado, X |_], X, NS):- !, NS is 10.
patronCausa(panel_solar, [bateria, desconectada, X |_], X, NS):- !, NS is 9.
patronCausa(panel_solar, [mal, instalados, X |_], X, NS):- !, NS is 8.
patronCausa(panel_solar, [mala, conexion, a, internet, X |_], X, NS):- !, NS is 7.
patronCausa(panel_solar, [sin, tension, de, entrada, X |_], X, NS):- !, NS is 6.
patronCausa(panel_solar, [no, recibe, X |_], X, NS):- !, NS is 5.
patronCausa(panel_solar, [tiene, un, dano, X |_], X, NS):-!, NS is 4.
patronCausa(panel_solar, [no, se, ha, reiniciado, X |_], X, NS):- !, NS is 3.
patronCausa(panel_solar, [no, esta, pago, X |_], X, NS):- !, NS is 2.
patronCausa(panel_solar, [poco, eficientes, X |_], X, NS):- !, NS is 1.

% Causas celular
% patronCausa(celular, [no, hace,llamada, X|_], X, N) :- !.

% patronCausa( Dispositivo, Lista, Comparador, Nï¿½mero de Soluciï¿½n).
patronCausa(D, [_|T], X, NS):-
  patronCausa(D, T, X, NS).
