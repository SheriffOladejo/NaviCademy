//
//  ImputView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 21/11/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color("DarkGreen"))
                .fontWeight(.semibold)
                .font(.system(size: 20))
                
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email adresse", placeholder: "email@adresse.com")
}
