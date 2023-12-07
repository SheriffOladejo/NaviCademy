//
//  QuizOptionViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI
import Firebase

struct Question: Decodable {
    let id: Int
    let question: String
    let options: [String]
}

class QuizOptionViewModel: ObservableObject {
    @Published var question: String = ""
    @Published var questions: [Question] = []
    @Published var options: [String] = []
    @Published var selectedOption: String = ""
    @Published var questionId: String? = nil
    
    init(rankType: String, quizLevel: String) {
        fetchQuizOptions(rankType: rankType, quizLevel: quizLevel)
    }
    
    private func fetchQuizOptions(rankType: String, quizLevel: String) {
        let db = Firestore.firestore()
        let optionsDocument = db.collection("i18n")
                                  .document("dk")
                                  .collection("quiz")
                                  .document("y3lights")
                                  .collection("level2")
                                  .document("info")
        
        optionsDocument.getDocument { (snapshot, error) in
            if let error = error {
                print("Error fetching quiz options: \(error.localizedDescription)")
                return
            }
            
            guard let data = snapshot?.data() else {
                print("No data found for quiz options")
                return
            }
            
            if let question = data["question"] as? String,
               let options = data["options"] as? [String] {
                self.question = question
                self.options = options
            } else {
                print("Invalid data format for quiz options")
            }
        }
    }
    
    func handleOptionToggle(id: Int) {
        selectedOption = selectedOption == options[id] ? "" : options[id]
    }
}
