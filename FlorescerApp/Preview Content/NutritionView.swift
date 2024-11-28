//
//  NutritionView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct NutritionView: View {
    @State private var totalCalories: Double = 0.0 // Total de calorias consumidas no dia
    @State private var meals: [Meal] = [] // Lista de refeições registradas
    @State private var showAddMealSheet = false

    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color("greenPrimary"), Color("yellowwTertiary")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                // Título
                Text("Alimentação")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.top, 20)

                // Subtítulo
                Text("Acompanhe suas refeições e calorias diárias")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("orangeSecondary"))
                    .multilineTextAlignment(.center)

                // Total de calorias
                VStack {
                    Text("\(Int(totalCalories)) kcal")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color("yellowTertiary"))
                    Text("Calorias consumidas hoje")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("greenPrimary"))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)

                // Lista de refeições
                List {
                    ForEach(meals) { meal in
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(meal.name)
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color("greenPrimary"))
                                Text("\(meal.calories, specifier: "%.0f") kcal")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                            Text(meal.time, style: .time)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color("yellowwTertiary"))
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete(perform: deleteMeal)
                }
                .listStyle(PlainListStyle())

                Spacer()

                // Botão para adicionar refeições
                Button(action: { showAddMealSheet.toggle() }) {
                    Text("Adicionar Refeição")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("orangeSecondary"))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .sheet(isPresented: $showAddMealSheet) {
            AddMealView { newMeal in
                meals.append(newMeal)
                totalCalories += newMeal.calories
            }
        }
    }

    // Função para deletar uma refeição
    func deleteMeal(at offsets: IndexSet) {
        for index in offsets {
            totalCalories -= meals[index].calories
        }
        meals.remove(atOffsets: offsets)
    }
}

// Modelo de Refeição
struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let calories: Double
    let time: Date
}

// Subview: Tela para adicionar refeições
struct AddMealView: View {
    @Environment(\.dismiss) var dismiss
    @State private var mealName: String = ""
    @State private var mealCalories: String = ""
    @State private var mealTime: Date = Date()

    var onSave: (Meal) -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Adicionar Refeição")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("greenPrimary"))

                TextField("Nome da refeição", text: $mealName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Calorias (kcal)", text: $mealCalories)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                DatePicker("Horário da refeição", selection: $mealTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding()

                Spacer()

                Button(action: {
                    if let calories = Double(mealCalories) {
                        let newMeal = Meal(name: mealName, calories: calories, time: mealTime)
                        onSave(newMeal)
                        dismiss()
                    }
                }) {
                    Text("Salvar Refeição")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("orangeSecondary"))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationBarTitle("Nova Refeição", displayMode: .inline)
        }
    }
}

#Preview {
    NutritionView()
}
