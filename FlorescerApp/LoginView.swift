//
//  LoginView.swift
//  FlorescerApp
//
//  Created by Larissa Martins Correa on 27/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // Fundo
            LinearGradient(gradient: Gradient(colors: [Color("offWhite"), Color("yellowwTertiary")]),
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
                Text("Bem-vindo de volta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("greenPrimary"))
                    .padding(.bottom, 20)
                
                // Campos de entrada
                VStack(spacing: 16) {
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
                }
                .padding(.horizontal, 20)

                // Botão de Login
                Button(action: {
                    // Ação de login
                }) {
                    Text("Entrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("greenPrimary"))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

                // Recuperação de Senha
                Button(action: {
                    // Navegar para recuperação de senha
                }) {
                    Text("Esqueceu sua senha?")
                        .foregroundColor(Color("orangeSecondary"))
                        .font(.subheadline)
                        .padding(.top, 10)
                }
                
                // Redirecionar para cadastro
                HStack {
                    Text("Ainda não tem uma conta?")
                        .foregroundColor(Color("orangeSecondary"))
                        .fontWeight(.semibold)

                    Button(action: {
                        // Navegar para tela de cadastro
                    }) {
                        Text("Cadastre-se")
                            .foregroundColor(Color("orangeSecondary"))
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
