//
//  DailyMotivationView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct DailyMotivationView: View {
    @State private var quote: String = "Lembre-se: você é capaz de alcançar tudo o que sonha."
    @State private var author: String = "Desconhecido"
    
    let quotes = [
        ("A vida é como andar de bicicleta. Para manter o equilíbrio, você deve continuar se movendo.", "Albert Einstein"),
        ("Acredite que você pode, e você já está no meio do caminho.", "Theodore Roosevelt"),
        ("Você é mais forte do que imagina. Nunca subestime sua capacidade de crescer.", "Desconhecido"),
        ("Floresça onde você está plantado.", "Desconhecido"),
        ("Um pequeno passo hoje pode mudar todo o seu futuro.", "Desconhecido")
    ]
    
    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color("greenPrimary"), Color("yellowwTertiary")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Título da tela
                Text("Motivação do Dia")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.top, 20)
                
                Spacer()
                
                // Cartão com frase do dia
                VStack(spacing: 16) {
                    Text("“\(quote)”")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color("greenPrimary"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Text("- \(author)")
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(Color("orangeSecondary"))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Botão para gerar nova frase
                Button(action: {
                    generateNewQuote()
                }) {
                    Text("Nova Motivação")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("orangeSecondary"))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
    }
    
    // Função para gerar uma nova frase aleatória
    private func generateNewQuote() {
        let randomQuote = quotes.randomElement() ?? quotes.first!
        quote = randomQuote.0
        author = randomQuote.1
    }
}


#Preview {
    DailyMotivationView()
}
