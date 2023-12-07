//
//  CustomButtonView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var onClick: ()->()
    
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                Text(title)
                    .fontWeight(.bold)
//                                Image(systemName: "arrow.right.circle")
//                                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color("DarkGreen"))
        .cornerRadius(10)
        .padding(.top, 24)

    }
}
