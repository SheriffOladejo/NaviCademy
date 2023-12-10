//
//  Y3QuizLightsOption.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 08/12/2023.
//

import Foundation
import Firebase

class Y3QuizLightsOption: ObservableObject {
    var id: String
    @Published var value: String
    @Published var isSelected: Bool

    init(id: String, value: String, isSelected: Bool = false) {
        self.id = id
        self.value  = value
        self.isSelected = isSelected
    }
}
