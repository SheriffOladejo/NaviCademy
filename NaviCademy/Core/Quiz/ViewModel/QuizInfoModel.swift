//
//  QuizInfoModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import Foundation

// MARK: Generic Quiz Info Codable Model
struct QuizInfoModel: Codable {
    var title: String
    var peopleAttended: Int
    var rules: [String]
    
    enum CodingKeys: CodingKey {
        case title
        case peopleAttended
        case rules
    }
}
