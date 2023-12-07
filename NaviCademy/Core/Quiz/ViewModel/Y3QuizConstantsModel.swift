//
//  Y3QuizConstantsModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import Foundation

// MARK: Y3 Quiz Constants Codable Model
struct Y3QuizConstantsModel: Codable {
    var question: String
    var list: [String]
    
    enum CodingKeys: CodingKey {
        case question
        case list
    }
}
