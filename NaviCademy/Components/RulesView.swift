//
//  RulesView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//
// Quiz Rules View
//

import SwiftUI

func RulesView(_ rules: [String])->some View {
    VStack(alignment: .leading, spacing: 15) {
        Text("Inden du begynder:")
            .font(.title3)
            .fontWeight(.bold)
            .padding(.bottom, 12)
            .padding(.top, 12)

        ForEach(rules, id: \.self) { rule in
            HStack(alignment: .top, spacing: 10) {
                Circle()
                    .fill(.black)
                    .frame(width: 8, height: 8)
                    .offset(y: 8)
                Text(rule)
                    .font(.callout)
                    .lineLimit(3)
            }
        }
    }
}

#Preview {
    RulesView(["Rule 1", "Rule 2"])
}
