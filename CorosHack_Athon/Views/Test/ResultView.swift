import SwiftUI

struct ResultView: View {
    let viewModel: TestViewModel
    let onRestart: () -> Void

    var body: some View {
        let career = viewModel.calculateCareerResult()
        print("📌 Carrera seleccionada: \(career)")

        let userValues = viewModel.extractUserValues()
        print("📌 Valores del usuario: \(userValues)")

        let matchingEngineer = viewModel.findMatchingEngineer(from: viewModel.engineers, forCareer: career)

        if matchingEngineer == nil {
            print("⚠️ No se encontró ingeniera alineada con la carrera \(career)")
        } else {
            print("✅ Ingeniera encontrada: \(matchingEngineer!.name)")
        }

        return ScrollView {
            VStack(spacing: 24) {
                Text("¡Tu carrera ideal es:")
                    .font(.title)

                Text(career)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if let engineer = matchingEngineer {
                    Divider()

                    VStack(spacing: 16) {
                        Text("Tu inspiración:")
                            .font(.headline)

                        Text(engineer.name)
                            .font(.title2)
                            .fontWeight(.semibold)

                        if let desc = engineer.description {
                            Text(desc)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }

                        Text("Valores en común: \(Set(engineer.values).intersection(Set(userValues)).joined(separator: ", "))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                }

                Button("Reiniciar test") {
                    onRestart()
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
