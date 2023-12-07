//
//  CustomLabel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import SwiftUI

func CustomLabel(_ image: String,_ title: String,_ subTitle: String)->some View {
    HStack(spacing: 12) {
        Image(systemName: image)
            .font(.title3)
            .frame(width: 45, height: 45)
            .background {
                Circle()
                    .fill(Color("LightGreen").opacity(0.1))
                    .padding(-1)
                    .background {
                        Circle()
                            .stroke(Color("DarkGreen"), lineWidth: 1)
                    }
            }
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(Color("DarkGreen"))
            Text(subTitle)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        .hAlign(.leading)
    }
}

#Preview {
    CustomLabel("gear", "Title", "Sub Title")
}
