//
//  QuizViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import Foundation
import SwiftUI

struct Y3Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var quizWinningStatus: Bool = false
}

struct Y3QuizModel {
    var question: String
    var image: Image
    var answers: [String]
    var optionsList: [QuizOption]
}

struct Y3QuizOption : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected : Bool = false
    var isMatched : Bool = false
}
