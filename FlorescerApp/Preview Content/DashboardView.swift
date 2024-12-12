//
//  DashboardView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var waterConsumed = 1.5 // em litros
    @State private var stepsToday = 6200
    @State private var sleepHours = 7.5
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Olá, Larissa!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("greenPrimary"))
                        
                        Text("Que tal cuidar de você hoje?")
                            .font(.subheadline)
                            .foregroundColor(Color("orangeSecondary"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    
                    HStack(spacing: 20) {
                        SummaryCardView(iconName: "drop.fill",
                                        title: "Água",
                                        value: "\(String(format: "%.1f", waterConsumed))L",
                                        color: Color("orangeSecondary"))
                        
                        SummaryCardView(iconName: "figure.walk",
                                        title: "Passos",
                                        value: "\(stepsToday)",
                                        color: Color("yellowwTertiary"))
                        
                        SummaryCardView(iconName: "bed.double.fill",
                                        title: "Sono",
                                        value: "\(String(format: "%.1f", sleepHours))h",
                                        color: Color("greenPrimary"))
                    }
                    .padding(.horizontal, 20)
                    
                    // Gráfico ou Relatório
                    VStack(spacing: 10) {
                        Text("Seu progresso")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                        
                        Rectangle() // Placeholder para gráfico
                            .fill(Color.white)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Text("Registrar Consumo de Água")
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
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(Color("orangeSecondary"))
                        Text("Florescer")
                            .font(.headline)
                            .foregroundColor(Color("greenPrimary"))
                    }
                }
            }
        }
    }
}

struct SummaryCardView: View {
    let iconName: String
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .cornerRadius(10)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color("orangeSecondary"))
            
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color("greenPrimary"))
        }
        .frame(width: 100, height: 140)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
