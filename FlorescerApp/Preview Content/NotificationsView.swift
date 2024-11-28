//
//  NotificationsView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct NotificationsView: View {
    @State private var isDailyReminderEnabled: Bool = true
    @State private var reminderTime: Date = Date()
    @State private var hydrationReminder: Bool = false
    @State private var meditationReminder: Bool = false
    @State private var customReminderText: String = ""
    @State private var customReminderTime: Date = Date()
    
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
                Text("Notificações e Lembretes")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Configuração de lembrete diário
                        Toggle("Lembrete Diário", isOn: $isDailyReminderEnabled)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.9))
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            )
                            .padding(.horizontal, 20)
                        
                        if isDailyReminderEnabled {
                            HStack {
                                Text("Horário do Lembrete:")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color("greenPrimary"))
                                
                                Spacer()
                                
                                DatePicker("", selection: $reminderTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.9))
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            )
                            .padding(.horizontal, 20)
                        }
                        
                        // Lembretes específicos
                        Toggle("Lembrete para Hidratação", isOn: $hydrationReminder)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.9))
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            )
                            .padding(.horizontal, 20)
                        
                        Toggle("Lembrete para Meditação", isOn: $meditationReminder)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.9))
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            )
                            .padding(.horizontal, 20)
                        
                        // Lembrete personalizado
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Lembrete Personalizado")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(Color("greenPrimary"))
                            
                            TextField("Digite a mensagem", text: $customReminderText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            HStack {
                                Text("Horário:")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color("greenPrimary"))
                                
                                Spacer()
                                
                                DatePicker("", selection: $customReminderTime, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                            }
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
                
                Spacer()
                
                // Botão para salvar alterações
                Button(action: {
                    // Salvar configurações de notificações
                    saveNotificationSettings()
                }) {
                    Text("Salvar Configurações")
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
    
    private func saveNotificationSettings() {
        // Implementar a lógica de salvar configurações de notificações
        print("Configurações salvas!")
    }
}


#Preview {
    NotificationsView()
}
