//
//  ForgotPasswordView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 22/11/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
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
                    
                }
                .padding(.horizontal)
                .padding(.top, 24)
                .padding(.bottom, 24)
                
                
                // Send Password in button
                
                Button {
                    Task {
                        try await viewModel.forgotPassword(withEmail: email)
                    }
                } label: {
                    HStack {
                        Text("Send Kodeord")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color("DarkGreen"))
                .cornerRadius(10)
                
                Spacer()
                
                // Knows password button
                Button {
                    dismiss()
                } label:{
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Gå tilbage")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 16))
                    .foregroundStyle(Color("DarkGreen"))
                }
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
