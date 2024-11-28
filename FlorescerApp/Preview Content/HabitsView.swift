//
//  HabitsView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//
import SwiftUI

struct HabitsView: View {
    @State private var habits = [
        Habit(name: "Beber água", isCompleted: false),
        Habit(name: "Meditar 10 minutos", isCompleted: false),
        Habit(name: "Dormir 8 horas", isCompleted: true),
        Habit(name: "Ler 20 páginas", isCompleted: false)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fundo com gradiente
                LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Título e descrição
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Monitoramento de Hábitos")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("greenPrimary"))
                        
                        Text("Acompanhe seus hábitos diários e alcance suas metas!")
                            .font(.subheadline)
                            .foregroundColor(Color("orangeSecondary"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    
                    // Lista de hábitos
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(habits.indices, id: \.self) { index in
                                HabitCardView(habit: $habits[index])
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    // Indicador de progresso
                    VStack(spacing: 10) {
                        Text("Seu progresso diário")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                        
                        ProgressView(value: progressValue())
                            .progressViewStyle(LinearProgressViewStyle(tint: Color("orangeSecondary")))
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal, 20)
                        
                        Text("\(Int(progressValue() * 100))% concluído")
                            .font(.subheadline)
                            .foregroundColor(Color("orangeSecondary"))
                    }
                    
                    Spacer()
                    
                    // Botão para adicionar hábitos
                    Button(action: {
                        // Ação para adicionar novo hábito
                    }) {
                        Text("Adicionar Novo Hábito")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("greenPrimary"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(Color("orangeSecondary"))
                        Text("Florescer")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                    }
                }
            }
        }
    }
    
    private func progressValue() -> Double {
        let totalHabits = Double(habits.count)
        let completedHabits = Double(habits.filter { $0.isCompleted }.count)
        return totalHabits > 0 ? completedHabits / totalHabits : 0.0
    }
}

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool
}

struct HabitCardView: View {
    @Binding var habit: Habit
    
    var body: some View {
        HStack {
            Text(habit.name)
                .font(.subheadline)
                .foregroundColor(Color("orangeSecondary"))
            
            Spacer()
            
            Button(action: {
                habit.isCompleted.toggle()
            }) {
                Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(habit.isCompleted ? Color("greenPrimary") : Color("orangeSecondary"))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
