//
//  QuizOptionComponent.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI
import Firebase

struct QuizOptionComponent: View {
    let rankType: String?
    let quizLevel: String?
    @ObservedObject var viewModel: QuizOptionViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(Array(viewModel.options.enumerated()), id: \.element) { index, optionText in
                QuizOptionRow(option: optionText, id: index, question: viewModel.question, viewModel: self.viewModel)
                    .onTapGesture {
                        viewModel.handleOptionToggle(id: index)
                    }
            }
        }
    }
}
