//
//  OnboardingView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    private let onboardingData = [
        OnboardingPage(imageName: "sun.max.fill", title: "Cuide de Você", description: "Acompanhe sua saúde física e mental de forma acolhedora.", color: Color("SoftYellow")),
        OnboardingPage(imageName: "leaf.fill", title: "Cultive Hábitos", description: "Estabeleça rotinas saudáveis para florescer diariamente.", color: Color("SoftGreen")),
        OnboardingPage(imageName: "heart.circle.fill", title: "Conecte-se", description: "Encontre apoio e inspiração em nossa comunidade.", color: Color("AccentYellow"))
    ]

    var body: some View {
        ZStack {
            // Fundo
            LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                // Slider para Onboarding
                TabView(selection: $currentPage) {
                    ForEach(0..<onboardingData.count, id: \.self) { index in
                        OnboardingCard(page: onboardingData[index])
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentPage)

                // Indicador de páginas
                HStack(spacing: 8) {
                    ForEach(0..<onboardingData.count, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? Color("greenPrimary") : Color.gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top, 20)

                // Botão "Começar"
                if currentPage == onboardingData.count - 1 {
                    Button(action: {
                        // Ação para avançar para a próxima tela (ex: Login)
                    }) {
                        Text("Começar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("greenPrimary"))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
}

struct OnboardingCard: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 20) {
            // Ícone
            Image(systemName: page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(page.color)
                .padding(.top, 50)

            // Título
            Text(page.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("greenPrimary"))

            // Descrição
            Text(page.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("orangeSecondary"))
                .padding(.horizontal, 40)
        }
    }
}

struct OnboardingPage {
    let imageName: String
    let title: String
    let description: String
    let color: Color
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
