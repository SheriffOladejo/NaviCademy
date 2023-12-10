//
//  ContentView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 21/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showAlert: Bool = false

    var body: some View {
        Group {
            if authViewModel.userSession != nil {
                // If a user is signed in
                HomeView()
            } else {
                LoginView()
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(authViewModel.errorDescription ?? "Error trying to log in, please try again"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
            }
        }
        .onReceive(authViewModel.$showAlert) { newShowAlertValue in
            showAlert = newShowAlertValue
        }
    }
}

#Preview {
    ContentView()
}
