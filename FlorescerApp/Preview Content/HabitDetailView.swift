//
//  HabitDetailView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct HabitDetailView: View {
    @State private var habit = HabitDetail(
        name: "Beber água",
        description: "Mantenha-se hidratado ao longo do dia. A meta é beber 2 litros de água diariamente.",
        progress: 0.6,
        frequency: ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    )
    @State private var remindersEnabled = false
    
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Título e Descrição
                    VStack(alignment: .leading, spacing: 8) {
                        Text(habit.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("greenPrimary"))
                        
                        Text(habit.description)
                            .font(.body)
                            .foregroundColor(Color("orangeSecondary"))
                    }
                    .padding(.horizontal, 20)
                    
                    // Estatísticas de Progresso
                    VStack(spacing: 15) {
                        Text("Progresso Semanal")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                        
                        ProgressView(value: habit.progress)
                            .progressViewStyle(LinearProgressViewStyle(tint: Color("orangeSecondary")))
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal, 20)
                        
                        Text("\(Int(habit.progress * 100))% concluído")
                            .font(.subheadline)
                            .foregroundColor(Color("orangeSecondary"))
                    }
                    
                    // Frequência Semanal
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Frequência Semanal")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                        
                        HStack(spacing: 10) {
                            ForEach(habit.frequency, id: \.self) { day in
                                Text(day)
                                    .font(.subheadline)
                                    .foregroundColor(Color("orangeSecondary"))
                                    .frame(width: 40, height: 40)
                                    .background(
                                        Circle()
                                            .fill(Color("yellowwTertiary"))
                                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Configurações
                    VStack(alignment: .leading, spacing: 15) {
                        Toggle(isOn: $remindersEnabled) {
                            Text("Ativar lembretes")
                                .font(.subheadline)
                                .foregroundColor(Color("orangeSecondary"))
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color("greenPrimary")))
                        
                        Button(action: {
                            // Ação para editar hábito
                        }) {
                            Text("Editar Hábito")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenPrimary"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Histórico
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Histórico")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1...7, id: \.self) { day in
                                    VStack {
                                        Text("Dia \(day)")
                                            .font(.subheadline)
                                            .foregroundColor(Color("orangeSecondary"))
                                        
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(Color("greenPrimary"))
                                    }
                                    .padding()
                                    .background(Color("yellowwTertiary"))
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    // Botão de Conclusão
                    Button(action: {
                        // Ação para concluir hábito
                    }) {
                        Text("Marcar como Concluído")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("orangeSecondary"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct HabitDetail {
    var name: String
    var description: String
    var progress: Double
    var frequency: [String]
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView()
    }
}
