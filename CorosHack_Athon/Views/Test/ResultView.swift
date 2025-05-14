import SwiftUI

struct ResultView: View {
    let viewModel: TestViewModel
    let onRestart: () -> Void

    struct RoleModel {
        let name: String
        let description: String
    }

    let roleModels: [RoleModel] = [
        RoleModel(name: "Ada Lovelace", description: "Considerada la primera programadora de la historia, sentó las bases de la informática moderna."),
        RoleModel(name: "Nikola Tesla", description: "Revolucionó la ingeniería eléctrica con sus aportes a la corriente alterna y la transmisión inalámbrica de energía."),
        RoleModel(name: "Hedy Lamarr", description: "Inventora del espectro ensanchado, tecnología base del Wi-Fi y Bluetooth actual."),
        RoleModel(name: "Elon Musk", description: "Ha impulsado avances en vehículos eléctricos, energía solar y exploración espacial a través de Tesla y SpaceX."),
        RoleModel(name: "Grace Hopper", description: "Pionera del lenguaje de programación COBOL y una de las primeras mujeres almirante en la Marina de EE.UU."),
        RoleModel(name: "Isambard Kingdom Brunel", description: "Transformó la ingeniería civil con sus diseños de puentes, túneles y locomotoras en el siglo XIX.")
    ]

    var body: some View {
        let career = viewModel.calculateCareerResult()
        let selectedModel = roleModels.randomElement()!

        ScrollView {
            VStack(spacing: 24) {
                Text("¡Tu carrera ideal es:")
                    .font(.title)

                Text(career)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Divider()

                VStack(spacing: 16) {
                    Text("🎉 Felicidades!")
                        .font(.headline)

                    Text("Tus pensamientos ingenieriles se alinean con:")
                        .font(.title3)

                    Text(selectedModel.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    Text("Esta persona hizo esto en la ingeniería:")
                        .font(.subheadline)

                    Text("“\(selectedModel.description)”")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text("Y generó un increíble cambio en la sociedad ✨")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }

                Button("Reiniciar test") {
                    onRestart()
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)

                NavigationLink(destination: LotteryResultView()) {
                    HStack {
                        Text("Participar en Sorteo")
                            .foregroundColor(Color(hex: "#F2BC57"))
                            .underline()
                        Image(systemName: "arrowshape.forward.circle.fill")
                            .foregroundColor(Color(hex: "#F2BC57"))
                    }
                }
            }
            .padding()
        }
    }
}
