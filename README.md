# TheComposableArchitectureNavigation
Demo The Composable Architecture Navigation

Uno de los temas que siempre me ha interesado el la arquitectura de las aplicaciones en iOS, en mis años de experiencia, he de decir que no había encontrado hasta ahora una arquitectura que me pareciese interesante y realmente efectiva, por desgracias Apple parece que no acaba de dar con la clave para proporcionarnos una arquitectura realmente eficaz, y la cosa parece que no ha mejorado con SwiftUI, casi por casualidad me tope con esta arquitectura que a tiene tanto gente a favor y que les encanta como a mi, y gente que la odia, yo mismo fui uno de ellos cuando cayo en mis manos un proyecto hecho íntegramente con esta arquitectura no sabia por donde meterle mano, hasta que fui aprendiendo como funcionaba y realmente cada vez me gustaba más, he de reconocer que tiene una curva de aprendizaje importante pero una vez te haces con ella es una delicia, uno de sus grandes puntos fuertes, y creerme tiene un montón, es que sabes perfectamente donde tiene que ir cada cosa, no ocurre como en otras arquitectura donde no sabes muy bien donde tiene que poner cierto código, se procura que no exista ninguna lógica de negocio en la vista y dispone de todos los medios para hacerlo posible, además como su nombre indica está orientada a la composición ir partiendo problemas complejos en muchos simples, tanto es así que incluso podríamos poner cada vista en un módulo independiente y seguiríamos teniendo una comunicación perfecta entre padre e hijo sin que exista ningún tipo de acoplamiento, otro de sus puntos fuertes es la capacidad para hacer UITest casi sin esfuerzo y permitir que un alto porcentaje de tu código sea testable, para ello dispone muchas ayudas al respecto, algo que con SwiftUI básico es prácticamente imposible, ni siquiera Apple cuando publica tutoriales incluye los tests.

Que mejor tema para hablar que de arquitectura, algo apasionante y que puede hacer que tu aplicación sea algo bello desde el punto de vista del código y fácil de mantener, o un verdadero desastre que va creciendo y haciéndose cada vez menos mantenible, esta arquitectura está pensada tanto para proyectos pequeños como para proyectos muy grandes, y creo que merece la pena estudiarla concienzudamente. 

Yo llevo unos meses estudiándola incluso estoy pagando una membresía para poder acceder a todos los artículos que los creadores han publicado, son muchísimos y no solo hablan de la arquitectura.

El proyecto que os paso por ahora no es gran cosa, se pretende demostrar como fortalecer uno de los puntos débiles de SwiftUI, la navegación. Por ahora no hay mucho pero ire incluyendo más código conforme vaya pudiendo.

Espero haber despertado vuestra curiosidad y que como indicáis en el pdf de la prueba técnica, que esto sea algo para iniciar una discusión. 


Saludos
Daniel Jiménez

Editado: 
    - Se añade alert y su test en la vista inventoryView y su gestión en el reducer así como su test
    - Se añade confirmationDialog (ActionSheet) en la vista inventoryView y su gestión en el reducer así como su test
    

