//
//  ExerciseView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//
import SwiftUI

struct ExerciseView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String? = nil
    @State private var exercises = [
        Exercise(name: "Yoga para Relaxamento", duration: "15 minutos", icon: "figure.yoga"),
        Exercise(name: "Treino Cardio", duration: "20 minutos", icon: "figure.run"),
        Exercise(name: "Alongamento Matinal", duration: "10 minutos", icon: "figure.stand"),
        Exercise(name: "Fortalecimento de Core", duration: "30 minutos", icon: "figure.strengthtraining.traditional")
    ]
    
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                // Título e Introdução
                VStack(alignment: .leading, spacing: 8) {
                    Text("Exercícios Físicos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("greenPrimary"))
                    
                    Text("Cuide do seu corpo e mente com rotinas adaptadas para você.")
                        .font(.body)
                        .foregroundColor(Color("orangeSecondary"))
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)
                
                // Barra de Busca
                HStack {
                    TextField("Buscar exercícios...", text: $searchText)
                        .padding(10)
                        .background(Color("offWhite"))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color("orangeSecondary"))
                                    .padding(.trailing, 10)
                            }
                        )
                }
                .padding(.horizontal, 20)
                
                // Categorias de Exercício
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(["Relaxamento", "Cardio", "Força", "Alongamento"], id: \.self) { category in
                            Text(category)
                                .font(.headline)
                                .foregroundColor(selectedCategory == category ? .white : Color("greenPrimary"))
                                .padding()
                                .background(selectedCategory == category ? Color("greenPrimary") : Color("offWhite"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .onTapGesture {
                                    selectedCategory = selectedCategory == category ? nil : category
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                // Lista de Exercícios
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredExercises, id: \.id) { exercise in
                            HStack {
                                Image(systemName: exercise.icon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color("orangeSecondary"))
                                    .padding()
                                    .background(Color("offWhite"))
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                
                                VStack(alignment: .leading) {
                                    Text(exercise.name)
                                        .font(.headline)
                                        .foregroundColor(Color("greenPrimary"))
                                    Text(exercise.duration)
                                        .font(.subheadline)
                                        .foregroundColor(Color("orangeSecondary"))
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    // Ação para iniciar o exercício
                                }) {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color("greenPrimary"))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                                }
                            }
                            .padding()
                            .background(Color("offWhite"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private var filteredExercises: [Exercise] {
        exercises.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }
}

struct Exercise {
    let id = UUID()
    let name: String
    let duration: String
    let icon: String
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
