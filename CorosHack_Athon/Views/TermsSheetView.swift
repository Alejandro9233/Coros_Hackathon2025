//
//  TermsSheetView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct TermsSheetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Términos y Condiciones")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Text("""
                1. Introducción
                
                Estos términos y condiciones regulan la participación en los sorteos organizados por Impulsa. Al participar, aceptas cumplir con estos términos.
                
                2. Elegibilidad
                
                Los participantes deben ser mayores de edad y residentes legales de México.
                No pueden participar empleados de Impulsa, sus familiares directos, ni cualquier persona involucrada en la organización del sorteo.
                
                3. Descripción del Sorteo
                
                El sorteo incluye premios como boletos de conciertos o mercancías (por ejemplo, iPads).
                La participación es gratuita y no requiere compra.
                
                4. Mecánica del Sorteo
                
                Cada participante que complete un curso o test vocacional sera acredor a un boleto electrónico que le acredita el derecho a participar.
                Los boletos se asignan de manera aleatoria.
                
                5. Premios
                
                Los premios son intransferibles y no canjeables por dinero.
                Los ganadores serán notificados a través de la aplicación al momento de participar y deberán reclamar su premio dentro de 3 días contactandose con Impulsa.
                
                6. Autorización y Supervisión
                
                El sorteo está autorizado por la Secretaría de Gobernación y cumple con la Ley Federal de Juegos y Sorteos.
                La Dirección General Adjunta de Juegos y Sorteos supervisa el cumplimiento de los términos y condiciones del sorteo.
                
                7. Protección de Datos
                
                La información personal de los participantes será utilizada únicamente para la administración del sorteo y conforme a nuestra política de privacidad.
                
                8. Modificaciones y Cancelaciones
                
                Impulsa se reserva el derecho de modificar o cancelar el sorteo en caso de circunstancias imprevistas, notificando a los participantes con antelación.
                
                9. Responsabilidades
                
                Impulsa no se hace responsable por cualquier daño o pérdida derivada de la participación en el sorteo o del uso de los premios.
                
                10. Aceptación de Términos
                
                Al participar en el sorteo, aceptas todos los términos y condiciones aquí establecidos.
                
                11. Contacto
                
                Para cualquier pregunta o aclaración, por favor contacta a Impulsa@edu.mx
                """)
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}
