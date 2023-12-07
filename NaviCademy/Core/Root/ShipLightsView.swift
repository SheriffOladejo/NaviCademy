//
//  ContentView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 21/11/2023.
//

import SwiftUI

struct ShipLightsView: View {
    @EnvironmentObject var question: ShipLightsViewModel

    var body: some View {
        TabView {
            ForEach(Question.muckQuestions, id: \.self) { question in
                ShipLightsViewModel(muckQuestion: question)
            }
        }
    }
}

#Preview {
    ContentView()
}
