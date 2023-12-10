//
//  Y3QuizLightsManager.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 08/12/2023.
//

import Foundation
import Firebase

class Y3QuizLightsManager {
    let quizLevel: String
    let rankType: String = "y3lights"
    
    @Published var selectedQuestions: [Y3QuizLightsModel] = []

    init(quizLevel: String) {
        self.quizLevel = quizLevel
    }
    
    func loadQuestions(completion: @escaping ([Y3QuizLightsModel]?) -> Void) {
        let db = Firestore.firestore()
        let questionRef = db.collection("i18n").document("dk").collection("question")
        let rank = String(rankType.prefix(2))
        let questionType = String(rankType.dropFirst(2))
        
        // Create a query to filter by rank
        let query = questionRef.whereField("rank", arrayContains: rank)
        
        query.getDocuments { [weak self] (snapshot, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error getting question info: \(error)")
            } else {
                guard let documents = snapshot?.documents else {
                    print("No documents found")
                    return
                }
                
                var chosenQuestions = [Y3QuizLightsModel]()
                for document in documents {
                    if let levels = document.get("level") as? [String], let type = document.get("type") as? [String] {
                        if levels.contains(self.quizLevel) && type.contains(questionType) {
                            let data = document.data()
                            let correctAnswers = data["answers"] as? [String] ?? []
                            let questionText = data["title"] as? String ?? ""
                            let imageText = data["image"] as? String ?? ""
                            let question = Y3QuizLightsModel(questionText: questionText, correctAnswers: correctAnswers, imageText: imageText)
                            chosenQuestions.append(question)
                        }
                    }
                }
                
                // Shuffle and select 3 questions (if available)
                chosenQuestions.shuffle()
                DispatchQueue.main.async {
                    self.selectedQuestions = Array(chosenQuestions.prefix(3))
                    completion(self.selectedQuestions)
                }
            }
        }
    }
}
