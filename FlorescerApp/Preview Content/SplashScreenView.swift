//
//  SplashScreenView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimating = false
    @State private var navigateToNextScreen = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("yellowwTertiary"), Color("offWhite")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(Color("orangeSecondary"))
                        .frame(width: 150, height: 150)
                        .shadow(color: Color("greenPrimary").opacity(0.5), radius: 10, x: 0, y: 10)

                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("yellowwTertiary"))
                        .scaleEffect(isAnimating ? 1.0 : 0.8)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)
                }

                Text("Florescer")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("greenPrimary"))

                Text("Cultive seu bem-estar, floresça no seu tempo.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.horizontal, 40)
            }
            .opacity(isAnimating ? 1 : 0.8)
            .animation(.easeInOut(duration: 1.5), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                navigateToNextScreen = true
            }
        }
        .background(
            NavigationLink(
                destination: OnboardingView(),
                isActive: $navigateToNextScreen,
                label: { EmptyView() }
            )
        )
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
