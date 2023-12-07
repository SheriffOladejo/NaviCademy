//
//  QuizInfo.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 01/12/2023.
//

import SwiftUI
import Foundation

struct QuizInfo: Equatable {
    var id: UUID
    var question: String
    var options: [String]
    // Add other properties as needed
}
