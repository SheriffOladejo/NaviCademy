//
//  QuizQuestion.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 30/11/2023.
//

import SwiftUI
import Foundation

struct QuizQuestion: Equatable {
    var id: String
    var question: String
    var correctAnswers: [String]
    var rankType: String
    var image: String
    // Add other properties as needed
}

// Now you can use firstIndex(of:) without an error
// Text("Quiz Question #\(viewModel.quizManager.questions.firstIndex(of: currentQuestion)! + 1) out of \(viewModel.quizManager.questions.count)")
