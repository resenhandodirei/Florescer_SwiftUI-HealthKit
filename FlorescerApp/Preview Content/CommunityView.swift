//
//  CommunityView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct CommunityView: View {
    @State private var userMessage: String = ""
    @State private var messages: [String] = [
        "Lembre-se: você é mais forte do que imagina!",
        "Compartilhe sua vitória de hoje com a gente!",
        "Cuidar de si é o primeiro passo para florescer."
    ]
    
    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color("yellowwTertiary"), Color("greenPrimary")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Título
                Text("Comunidade")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("greenPrimary"))
                    .padding(.top, 20)
                
                // Subtítulo
                Text("Conecte-se com outras pessoas e compartilhe sua jornada de autocuidado.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color("orangeSecondary"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                // Lista de mensagens da comunidade
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(messages, id: \.self) { message in
                            HStack(alignment: .top) {
                                // Avatar do usuário
                                Circle()
                                    .fill(Color("yellowwTertiary"))
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Text("A")
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.white)
                                    )
                                
                                // Mensagem do usuário
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Usuário Anônimo")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Color("greenPrimary"))
                                    
                                    Text(message)
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundColor(Color("greenPrimary"))
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.9))
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            )
                            .padding(.horizontal, 20)
                        }
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                // Campo de texto para nova mensagem
                VStack(spacing: 10) {
                    HStack {
                        TextField("Compartilhe algo inspirador...", text: $userMessage)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            )
                        
                        // Botão de enviar
                        Button(action: {
                            sendMessage()
                        }) {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("orangeSecondary"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 30)
            }
        }
    }
    
    private func sendMessage() {
        guard !userMessage.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        messages.append(userMessage)
        userMessage = ""
    }
}



#Preview {
    CommunityView()
}
