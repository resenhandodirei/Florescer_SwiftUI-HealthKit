//
//  WeeklyReportsView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI
import Charts

struct WeeklyReportsView: View {
    // Dados de exemplo para os relatórios
    @State private var hydrationData: [DailyData] = [
        DailyData(day: "Seg", value: 2),
        DailyData(day: "Ter", value: 1.5),
        DailyData(day: "Qua", value: 1.8),
        DailyData(day: "Qui", value: 2.2),
        DailyData(day: "Sex", value: 1.7),
        DailyData(day: "Sáb", value: 2.5),
        DailyData(day: "Dom", value: 2)
    ]
    @State private var stepsData: [DailyData] = [
        DailyData(day: "Seg", value: 7000),
        DailyData(day: "Ter", value: 8000),
        DailyData(day: "Qua", value: 7500),
        DailyData(day: "Qui", value: 6000),
        DailyData(day: "Sex", value: 8500),
        DailyData(day: "Sáb", value: 9000),
        DailyData(day: "Dom", value: 4000)
    ]
    
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
                Text("Relatórios Semanais")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.top, 20)

                // Subtítulo
                Text("Veja seu progresso na semana")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("yellowwTertiary"))
                    .multilineTextAlignment(.center)

                // Gráfico de hidratação
                VStack {
                    Text("Consumo de Água (Litros)")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("greenPrimary"))
                        .padding(.bottom, 10)

                    Chart(hydrationData) { data in
                        BarMark(
                            x: .value("Dia", data.day),
                            y: .value("Litros", data.value)
                        )
                        .foregroundStyle(Color("yellowwTertiary").gradient)
                    }
                    .frame(height: 200)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)

                // Gráfico de passos
                VStack {
                    Text("Passos Dados")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("greenPrimary"))
                        .padding(.bottom, 10)

                    Chart(stepsData) { data in
                        LineMark(
                            x: .value("Dia", data.day),
                            y: .value("Passos", data.value)
                        )
                        .foregroundStyle(Color("greenPrimary").gradient)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                    }
                    .frame(height: 200)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}

// Modelo de dados diários
struct DailyData: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
}


#Preview {
    WeeklyReportsView()
}
