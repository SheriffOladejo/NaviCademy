//
//  Y3QuestionModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import Foundation

// MARK: Quiz Qusetion Codable Model
struct Y3QuestionModel: Codable {
    var id: UUID = .init()
//    var question: String
    var image: String
    var options: [String]
    var answers: [String]

    // For UI State Updates
    var tappedAnswer: String = ""

    enum CodingKeys: CodingKey {
//        case question
        case image
        case options
        case answers
    }
}
