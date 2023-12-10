//
//  Y3QuizLightsOptionComponent.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI

struct Y3QuizLightsOptionComponent: View {
    var title: String
    var options: [Y3QuizLightsOption]
    
    var body: some View {
        VStack {
            Text("Question: \(title)")
                .font(.title)
                .fontWeight(.bold)
            ForEach(options, id: \.id) { option in
                Y3QuizLightsOptionRow(option: option)
            }
        }
    }
}

