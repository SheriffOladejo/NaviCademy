//
//  QuizOptionRow.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI

struct QuizOptionRow: View {
    let option: String
    let id: Int
    let question: String
    @ObservedObject var viewModel: QuizOptionViewModel

    @State private var isChecked = false

    init(option: String, id: Int, question: String, viewModel: QuizOptionViewModel) {
        self.option = option
        self.id = id
        self.question = question
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            Button {
                isChecked.toggle()
            } label: {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .font(.system(size: 35))
                    .foregroundColor(Color("DarkGreen"))
            }

            Text(option)

            Text("\(id)")
        }
        .onTapGesture {
            viewModel.handleOptionToggle(id: id)
        }
    }
}
