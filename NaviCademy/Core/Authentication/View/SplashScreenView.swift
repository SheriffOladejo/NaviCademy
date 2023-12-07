//
//  SplashScreenView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 23/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Image("background")
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            // Image
            Image("NaviCademy-Logo-Title")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .padding(.vertical, 32)
                .padding(.top, 24)

        }
    }
}

#Preview {
    SplashScreenView()
}
