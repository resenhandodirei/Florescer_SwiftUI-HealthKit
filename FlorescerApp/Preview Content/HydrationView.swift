//
//  HydrationView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//
import SwiftUI

struct HydrationView: View {
    @State private var waterConsumed: Double = 0.0 // Em litros
    @State private var waterGoal: Double = 2.5 // Meta diária em litros
    @State private var showReminderSheet = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("yellowwTertiary"), Color("greenPrimary")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Hidratação")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("greenPrimary"))
                    .padding(.top, 20)

                Text("Acompanhe seu consumo diário de água")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("orangeSecondary"))
                    .multilineTextAlignment(.center)

                HydrationProgressView(waterConsumed: waterConsumed, waterGoal: waterGoal)
                    .frame(height: 200)
                    .padding(.vertical, 20)

                VStack(spacing: 10) {
                    HStack {
                        Text("Água consumida:")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color("orangeSecondary"))
                        Spacer()
                        Text("\(waterConsumed, specifier: "%.1f") L")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("yellowwTertiary"))
                    }

                    HStack {
                        Text("Meta diária:")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color("orangeSecondary"))
                        Spacer()
                        Text("\(waterGoal, specifier: "%.1f") L")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("yellowwTertiary"))
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("greenPrimary").opacity(0.78))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)

                HStack(spacing: 20) {
                    Button(action: { waterConsumed += 0.25 }) {
                        Text("+ 250 ml")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("yellowwTertiary"))
                            .cornerRadius(12)
                    }

                    Button(action: { showReminderSheet.toggle() }) {
                        Text("Lembretes")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("orangeSecondary"))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showReminderSheet) {
            ReminderSetupView()
        }
    }
}

struct HydrationProgressView: View {
    var waterConsumed: Double
    var waterGoal: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .foregroundColor(Color("yellowwTertiary"))

            Circle()
                .trim(from: 0.0, to: CGFloat(waterConsumed / waterGoal))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .foregroundColor(Color("orangeSecondary"))
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut, value: waterConsumed)

            VStack {
                Text("\(Int((waterConsumed / waterGoal) * 100))%")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color("greenPrimary"))
                Text("Meta atingida")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("greenPrimary"))
            }
        }
    }
}

struct ReminderSetupView: View {
    @State private var selectedTime = Date()

    var body: some View {
        NavigationView {
            VStack {
                Text("Configure lembretes de hidratação")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("greenPrimary"))
                    .padding(.top, 20)

                DatePicker("Horário do lembrete:", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding()

                Spacer()

                Button(action: {
                }) {
                    Text("Salvar Lembrete")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("orangeSecondary"))
                        .cornerRadius(12)
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("Lembretes", displayMode: .inline)
        }
    }
}

#Preview {
    HydrationView()
}
