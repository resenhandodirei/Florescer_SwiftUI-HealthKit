//
//  SleepTrackingView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//
import SwiftUI
import HealthKit

struct SleepTrackingView: View {
    @State private var sleepHours: [Double] = [7.0, 6.5, 8.0, 5.5, 7.2]
    @State private var averageSleep: Double = 0.0
    @State private var insights: String = "Durma mais cedo para melhorar sua qualidade de sono."

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("greenPrimary"), Color("yellowwTertiary")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                // Título da tela
                Text("Acompanhamento do Sono")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.top, 20)

                // Subtítulo
                Text("Confira seu histórico e melhore sua qualidade de sono")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("offWhite"))
                    .multilineTextAlignment(.center)

                SleepBarChartView(sleepHours: sleepHours)
                    .frame(height: 200)
                    .padding(.vertical, 20)

                VStack(spacing: 10) {
                    HStack {
                        Text("Média de horas dormidas:")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color("offWhite"))
                        Spacer()
                        Text("\(averageSleep, specifier: "%.1f") h")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("yellowwTertiary"))
                    }

                    HStack {
                        Text("Insights:")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color("orangeSecondary"))
                        Spacer()
                        Text(insights)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("orangeSecondary"))
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("greenPrimary").opacity(0.78))
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .onAppear {
            calculateAverageSleep()
        }
    }

    // Função para calcular a média de sono
    private func calculateAverageSleep() {
        if !sleepHours.isEmpty {
            averageSleep = sleepHours.reduce(0, +) / Double(sleepHours.count)
        }
    }
}

// Subview: Gráfico de barras para histórico de sono
struct SleepBarChartView: View {
    let sleepHours: [Double]
    var body: some View {
        HStack(alignment: .bottom, spacing: 12) {
            ForEach(0..<sleepHours.count, id: \.self) { index in
                VStack {
                    Text("\(sleepHours[index], specifier: "%.1f")h")
                        .font(.system(size: 12))
                        .foregroundColor(Color("orangeSecondary"))
                        .fontWeight(.bold)
                        .padding(.bottom, 4)
                    Rectangle()
                        .fill(Color("yellowwTertiary"))
                        .frame(width: 20, height: CGFloat(sleepHours[index]) * 20)
                    Text("Dia \(index + 1)")
                        .font(.system(size: 12))
                        .foregroundColor(Color("greenPrimary"))
                }
            }
        }
    }
}


#Preview {
    SleepTrackingView()
}
