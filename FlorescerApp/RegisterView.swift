//
//  RegisterView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//
import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            // Fundo
            LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowTertiary")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Ícone/Ilustração no topo
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("orangeSecondary"))
                    .padding(.top, 40)

                // Título
                Text("Crie sua conta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("greenPrimary"))
                    .padding(.bottom, 20)

                // Campos de entrada
                VStack(spacing: 16) {
                    TextField("Nome completo", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                    TextField("E-mail", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Senha", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                    SecureField("Confirme sua senha", text: $confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 20)

                // Botão de Cadastro
                Button(action: {
                    // Ação de cadastro
                }) {
                    Text("Cadastrar")
                        .font(.headline)
                        .textCase(.lowercase)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("greenPrimary"))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

                // Redirecionar para login
                HStack {
                    Text("Já tem uma conta?")
                        .foregroundColor(Color("orangeSecondary"))
                        .multilineTextAlignment(.center)
                    Button(action: {
                        // Navegar para tela de login
                    }) {
                        Text("Faça login")
                            .foregroundColor(Color("orangeSecondary"))
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
