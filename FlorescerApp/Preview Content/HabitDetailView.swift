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
    @State private var showCompletionAlert = false
    @State private var showEditAlert = false
    @State private var editedName = ""
    @State private var editedDescription = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        TextField("Nome do Hábito", text: $editedName)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("greenPrimary"))
                            .padding(.horizontal, 20)
                            .onAppear {
                                editedName = habit.name
                            }

                        TextField("Descrição do Hábito", text: $editedDescription)
                            .font(.body)
                            .foregroundColor(Color("orangeSecondary"))
                            .padding(.horizontal, 20)
                            .onAppear {
                                editedDescription = habit.description
                            }
                    }

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
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Toggle(isOn: $remindersEnabled) {
                            Text("Ativar lembretes")
                                .font(.subheadline)
                                .foregroundColor(Color("orangeSecondary"))
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color("greenPrimary")))
                        
                        Button(action: {
                            showEditAlert.toggle()
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
                    
                    Button(action: {
                        showCompletionAlert.toggle()
                    }) {
                        Text("Concluído")
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
                    .alert(isPresented: $showCompletionAlert) {
                        Alert(
                            title: Text("Confirmar Conclusão"),
                            message: Text("Tem certeza de que deseja marcar este hábito como concluído?"),
                            primaryButton: .destructive(Text("Sim")) {
                                print("Hábito concluído!")
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    .alert(isPresented: $showEditAlert) {
                        Alert(
                            title: Text("Editar Hábito"),
                            message: Text("Você deseja salvar as alterações?"),
                            primaryButton: .default(Text("Salvar")) {
                                habit.name = editedName
                                habit.description = editedDescription
                                print("Hábito editado: \(habit.name) - \(habit.description)")
                            },
                            secondaryButton: .cancel()
                        )
                    }
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
