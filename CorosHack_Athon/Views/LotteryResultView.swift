import SwiftUI
import MessageUI

struct LotteryResultView: View {
    @StateObject private var viewModel = LotteryResultViewModel()
    
    @State private var showConfetti = false
    @State private var showFinalResult = false
    @State private var backgroundColor: Color = .red
    @State private var showNotification = false
    @State private var showTermsSheet = false
    @State private var showMailCompose = false
    @State private var mailResult: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        ZStack {
            if showConfetti {
                ConfettiView()
                    .transition(.opacity)
            }
            
            VStack(spacing: 20) {
                if showFinalResult {
                    if viewModel.isWinner {
                        WinnerView(showMailCompose: $showMailCompose, mailResult: $mailResult, showTermsSheet: $showTermsSheet, showNotification: $showNotification, winnerCode: viewModel.winnerCode)
                    } else {
                        LoserView()
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                        .scaleEffect(3)
                        .onAppear {
                            startLoadingAnimation()
                        }
                }
            }
            
            if showNotification {
                VStack {
                    Text("Código copiado al portapapeles")
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 30)
                    Spacer()
                }
                .transition(.move(edge: .top))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showNotification = false
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.generateWinner()
        }
    }
    
    func startLoadingAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            showFinalResult = true
            showConfetti = viewModel.isWinner
            backgroundColor = .white
        }
    }
    
    func copyTextToClipboard(_ text: String) {
        UIPasteboard.general.string = text
        withAnimation {
            showNotification = true
        }
    }
}

struct WinnerView: View {
    @Binding var showMailCompose: Bool
    @Binding var mailResult: Result<MFMailComposeResult, Error>?
    @Binding var showTermsSheet: Bool
    @Binding var showNotification: Bool
    var winnerCode: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Felicidades")
                .font(.title)
                .fontWeight(.bold)
            
            
            
            Text("Eres ganador del sorteo, por favor contactanos usando tu codigo, este es unico para ti y valido una unica vez!")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            
            Button(action: {
                            UIPasteboard.general.string = winnerCode
                            withAnimation {
                                showNotification = true
                            }
                        }) {
                Text(winnerCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            
            
            Button(action: {
                showMailCompose.toggle()
            }) {
                Text("Enviar correo")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .sheet(isPresented: $showMailCompose) {
                MailComposeView(result: $mailResult, recipient: "Impulsa@edu.mx", subject: "Ganador del Sorteo", body: "Soy el ganador del sorteo con el código " + winnerCode)
            }
            
            Spacer()
            
            Button(action: {
                showTermsSheet.toggle()
            }) {
                Text("términos y condiciones")
                    .underline()
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $showTermsSheet) {
                TermsSheetView()
            }
        }
    }
}

struct LoserView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "brain.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.teal)
            
            Text("Este no es el final")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Esta vez no fue tu turno, ¡pero no te desanimes! Puedes regresar al menú y seguir participando mientras aprendes. Completa cursos y obtén nuevas oportunidades para ganar.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            
            Spacer()
        }
    }
}

struct ConfettiView: View {
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<100, id: \.self) { _ in
                ConfettiPiece()
                    .position(x: CGFloat.random(in: 0...geometry.size.width),
                              y: CGFloat.random(in: 0...geometry.size.height))
            }
        }
    }
}

struct ConfettiPiece: View {
    @State private var offset = CGSize.zero
    @State private var rotation = Angle.zero
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Rectangle()
            .fill(randomColor())
            .frame(width: 10, height: 10)
            .rotationEffect(rotation)
            .scaleEffect(scale)
            .offset(offset)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: Double.random(in: 2...4)).repeatForever()) {
                    offset = CGSize(width: CGFloat.random(in: -200...200), height: CGFloat.random(in: 200...400))
                    rotation = Angle(degrees: Double.random(in: 0...360))
                    scale = CGFloat.random(in: 0.5...1.5)
                }
            }
    }
    
    private func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .pink]
        return colors.randomElement()!
    }
}
