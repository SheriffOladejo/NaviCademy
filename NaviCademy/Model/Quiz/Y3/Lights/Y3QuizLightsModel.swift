//
//  Y3QuizLightsModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 08/12/2023.
//

import Foundation

struct Y3QuizLightsModel: Identifiable, Equatable {
    var id = UUID()
    let questionText: String
    let correctAnswers: [String]
    let imageText: String
}
