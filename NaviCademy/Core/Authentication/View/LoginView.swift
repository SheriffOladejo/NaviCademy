//
//  LoginView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 21/11/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack {
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
                        
                        InputView(text: $password,
                                  title: "Kodeord",
                                  placeholder: "Indtast dit kodeord",
                                  isSecureField: true)
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                    
                    
                    // Sign in button
                    
                    Button {
                        Task {
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        HStack {
                            Text("Log ind")
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
                    
                    // Sign in with FaceID
                    
                    switch viewModel.biometryType {
                        case .faceID:
                        Button {
                            Task {
                                print("log in with faceID")
                            }
                        } label: {
                            HStack {
                                Text("Log ind med FaceID")
                                    .fontWeight(.semibold)
                                Image(systemName: "faceid")
                            }
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                    case .none:
                        Button {
                            Task {
                                print("log in with faceID")
                            }
                        } label: {
                            HStack {
                                Text("Log ind med FaceID")
                                    .fontWeight(.semibold)
                                Image(systemName: "faceid")
                            }
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                    case .touchID:
                        Button {
                            Task {
                                print("log in with touchID")
                            }
                        } label: {
                            HStack {
                                Text("Log ind med TouchID")
                                    .fontWeight(.semibold)
                                Image(systemName: "touchid")
                            }
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                    case .opticID:
                        Button {
                            Task {
                                print("log in with opticID")
                            }
                        } label: {
                            HStack {
                                Text("Log ind med opticID")
                                    .fontWeight(.semibold)
                                Image(systemName: "opticid")
                            }
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                    @unknown default:
                        Button {
                            Task {
                                print("log in with email")
                            }
                        } label: {
                            HStack {
                                Text("Log ind med email")
                                    .fontWeight(.semibold)
                                Image(systemName: "email")
                            }
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                    }
//                    .padding(.top, 24)
                    
                    Spacer()
                    
                    // Forgot password up button
                    NavigationLink {
                        ForgotPasswordView()
                            .navigationBarBackButtonHidden(true)
                    } label:{
                        HStack {
                            Text("Glemt kodeord?")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.bottom, 12.0)
                        }
                        .font(.system(size: 16))
                        .foregroundStyle(Color("DarkGreen"))
                    }
                    
                    // Sign up button
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label:{
                        HStack {
                            Text("Registrer en ny konto")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .font(.system(size: 16))
                        .foregroundStyle(Color("DarkGreen"))
                    }
                }
            }
        }
    }
}


// MARK - Formvalidater

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
