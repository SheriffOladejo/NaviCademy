//
//  ContentView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 21/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showAlert: Bool = false

    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
//                LoginView()
                HomeView()
            } else {
                LoginView()
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(viewModel.errorDescription ?? "Error trying to log in, please try again"),
                            dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .onReceive(viewModel.$showAlert) { newShowAlertValue in
            showAlert = newShowAlertValue
        }
    }
}

#Preview {
    ContentView()
}
