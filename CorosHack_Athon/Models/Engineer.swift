//
//  Engineer.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//

import Foundation

struct Engineer: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let birthDate: String
    let deathDate: String?
    let story: String
}

let engineers: [Engineer] = [
    Engineer(
        name: "Margaret Hamilton",
        imageName: "margaret",
        birthDate: "17 de agosto de 1936",
        deathDate: nil,
        story: """
Margaret no creció con el sueño de ser ingeniera, porque ser ingeniera de software ni siquiera existía. Pero mientras trabajaba en el MIT en los años 60, se encontró liderando un equipo que escribiría la primera línea de código para enviar seres humanos a la Luna. Como madre joven, llevaba a su hija al trabajo y programaba durante la noche.

Su logro más grande fue desarrollar el sistema de guía del Apolo 11, que controlaba la navegación de la nave espacial. En pleno alunizaje, el sistema alertó una sobrecarga crítica: gracias al código de Margaret, el software ignoró procesos no esenciales y priorizó el aterrizaje, salvando la misión.

Sin ella, Neil Armstrong jamás habría dado su pequeño paso en la Luna. Su impacto revolucionó cómo se desarrolla software crítico para la vida humana, desde aviones hasta medicina. En 2016, Barack Obama la premió con la Medalla Presidencial de la Libertad.

¿Estás list@ para dejar tu huella en la historia como ella?
"""
    ),
    Engineer(name: "Edith Clarke", imageName: "edith", birthDate: "10 de febrero de 1883", deathDate: "29 de octubre de 1959", story: "Huérfana desde niña, Edith trabajó sin descanso para estudiar en una época donde las mujeres no podían ni soñar con ser ingenieras. Fue la primera mujer en graduarse del MIT con una maestría en Ingeniería Eléctrica. Fue rechazada una y otra vez por su género, hasta que fue contratada por General Electric como “calculadora”, un trabajo que subestimaba su capacidad. Pero Edith fue mucho más allá: inventó el Clarke Calculator, una herramienta gráfica que aceleraba los cálculos eléctricos en redes de transmisión. Esto revolucionó la distribución de electricidad y redujo fallas a gran escala. Después, se convirtió en la primera profesora de ingeniería eléctrica en Estados Unidos, formando generaciones de ingenieros. Su legado aún vive en los sistemas que llevan electricidad a cada rincón del mundo. Tú puedes ser la siguiente persona que transforme la energía del mundo como ella."
    ),
    Engineer(name: "Ayanna Howard", imageName: "ayanna", birthDate: "24 de enero de 1972", deathDate: nil, story:" Desde niña, Ayanna soñaba con construir robots como los de sus caricaturas favoritas. A pesar de enfrentar discriminación racial y de género, su pasión fue más fuerte. Estudió ingeniería eléctrica y obtuvo un doctorado en robótica. En la NASA, diseñó un sistema de inteligencia artificial para rovers marcianos, que les permitió tomar decisiones autónomas en terrenos desconocidos. Gracias a su trabajo, las misiones espaciales fueron más seguras, precisas y eficientes. Pero no se detuvo ahí. Fundó una startup de robótica médica que hoy ayuda a niños con discapacidad motriz en su rehabilitación. Además, se convirtió en decana de ingeniería en una universidad, liderando desde la educación hasta la industria. Su impacto cruza la frontera del espacio y la salud: ha usado la robótica para sanar, explorar y educar. Ayanna demuestra que la tecnología, en las manos correctas, puede cambiar vidas enteras. ¿Estás list@ para construir el futuro y tocar el cielo como ella? "
    ),
    Engineer(name: "Yajaira Sierra-Sastre", imageName: "yajaira", birthDate: "1981", deathDate: nil, story: "Desde un pequeño barrio en Puerto Rico, Yajaira soñaba con el espacio. A pesar de las limitaciones económicas y sociales, estudió ingeniería de materiales y trabajó en investigaciones científicas desde joven. Fue seleccionada por la NASA para una simulación de misión a Marte, donde vivió durante meses en condiciones extremas. Allí, desarrolló tecnologías para mantener la salud de astronautas y estudió materiales para impresión 3D en ambientes extraterrestres, lo cual será crucial para futuras colonias en el espacio. Actualmente, lidera proyectos en nanotecnología, medicina y exploración espacial, rompiendo fronteras entre ciencia, tecnología y humanidad. Además, es una activista que lucha por que más jóvenes hispanos, especialmente mujeres, tengan acceso a la ciencia.  ¿Estás list@ para romper barreras y conquistar nuevos mundos como ella?"
    ),
    Engineer(name: "Radia Perlman", imageName: "radia", birthDate: "1951", deathDate: nil, story: "Tímida y brillante, Radia creció sin imaginar que sus ideas se volverían la columna vertebral de Internet. Como estudiante del MIT, desarrolló una forma de pensar lógica, elegante y simple que luego aplicaría a uno de los desafíos tecnológicos más complejos de la historia: conectar millones de computadoras sin que se colapsaran. En los años 80, inventó el Spanning Tree Protocol (STP), un algoritmo que permite que las redes de computadoras se organicen, eviten fallos y puedan crecer infinitamente. Gracias a STP, hoy podemos enviar mensajes, subir videos, usar redes sociales y acceder a información desde cualquier parte del mundo. Aunque por años fue ignorada en la historia de la computación, hoy Radia es reconocida como la Madre del Internet moderno. Ha escrito libros clave y se ha dedicado a impulsar la participación de mujeres en la tecnología. ¿Estás list@ para construir la próxima gran idea que conecte al mundo como ella?")
]
