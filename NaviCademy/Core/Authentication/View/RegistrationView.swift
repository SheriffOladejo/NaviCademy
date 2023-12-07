//
//  RegistrationView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 22/11/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("NaviCademy-Logo")
                .resizable()
                .scaledToFit()
                .opacity(0.03)
                .ignoresSafeArea()
            
            VStack {
                // Image
                Image("NaviCademy-Logo-Title")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 32)
                    .padding(.top, 24)
                
                
                // Sign in form
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Emailadresse",
                              placeholder: "email@adresse.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $fullname,
                              title: "Fulde Navn",
                              placeholder: "Skriv dit fulde navn")
                    
                    InputView(text: $password,
                              title: "Kodeord",
                              placeholder: "Indtast dit kodeord",
                              isSecureField: true)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $confirmPassword,
                                  title: "Bekræft Kodeord",
                                  placeholder: "Indtast dit kodeord igen",
                                  isSecureField: true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 24)
                .padding(.bottom, 24)
                
                
                // Registration button
                
                Button {
                    Task {
                        try await viewModel.createUser(withEmail: email,
                                                       password: password,
                                                       fullname: fullname)
                    }
                } label: {
                    HStack {
                        Text("Opret Bruger")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color("DarkGreen"))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                
                Spacer()
                
                // Already a user button
                Button {
                    dismiss()
                } label:{
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Jeg har allerede en konto")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 16))
                    .foregroundStyle(Color("DarkGreen"))
                }
            }
        }
    }
}

// MARK - Formvalidater

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !fullname.isEmpty
        && !password.isEmpty
        && password.count > 5
        && password == confirmPassword
    }
}

#Preview {
    RegistrationView()
}
