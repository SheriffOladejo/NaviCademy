//
//  Y3QuizLightsOptionsViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 08/12/2023.
//

import Foundation
import Firebase

class Y3QuizLightsOptionsViewModel: ObservableObject {
    @Published var options: [Y3QuizLightsOption]?
    @Published var selectedOptions: [UUID: Int] = [:]

    func fetchOptions() {
        let db = Firestore.firestore()
        let optionsDocumentReference = db.collection("i18n").document("dk").collection("quiz").document("y3lights").collection("level2").document("info")

        optionsDocumentReference.getDocument { document, error in
            if let error = error {
                print("Error fetching options: \(error)")
                return
            }
            let data = document?.data()
            if let optionsData = data?["options"] as? [String] {
                self.options = optionsData.map { Y3QuizLightsOption(id: UUID().uuidString, value: $0, isSelected: false) }
            } else {
                print("Options data not found")
            }
        }
    }
    
    func select(_ option: Y3QuizLightsOption) {
        options?.forEach { $0.isSelected = $0.id == option.id }
        printSelections()  // Call method to print selections
    }

    private func printSelections() {
        if let optionsWithSelection = options?.filter({ $0.isSelected }) {
            print("Selected options: ")
            for option in optionsWithSelection {
                print(option.value)
            }
        } else {
            print("No options are selected")
        }
    }
    
    func updateSelectedAnswer(questionID: UUID, selectedIndex: Int) {
        selectedOptions[questionID] = selectedIndex
    }
}
