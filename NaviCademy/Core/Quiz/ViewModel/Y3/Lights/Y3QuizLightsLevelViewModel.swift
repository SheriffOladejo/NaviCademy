//
//  Y3QuizLightsLevelViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 28/11/2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class Y3QuizLightsLevelViewModel: ObservableObject {
    @Published var dynamicContentViewModel = DynamicContentViewModel()
    @Published var numberOfQuestions: String = ""
    @Published var peopleAttended: String = ""
    @Published var title: String = ""  // Property to store the retrieved title
    @Published var rules: [String] = []
    
    var rankType: String = "y3lights"
    var quizLevel: String
    
    init(quizLevel: String) {
        self.quizLevel = quizLevel
        fetchQuizData()
    }
    
    func fetchQuizData() {
        fetchQuestionsCount()
        fetchPeopleAttendedAndTitle()
        fetchRules()
    }
    
    private func fetchQuestionsCount() {
        let db = Firestore.firestore()
        let questionCollectionReference = db.collection("i18n").document("dk").collection("question")
        let rank = rankType.prefix(2)
        let questionType = String(rankType.dropFirst(2))  // Convert to String

        questionCollectionReference
            .whereField("rank", arrayContains: rank)
            .getDocuments { [weak self] (querySnapshot, error) in
                guard let snapshot = querySnapshot, error == nil else {
                    print("Error fetching questions: \(error?.localizedDescription ?? "Unknown Error")")
                    return
                }

                // Filter documents by "level"
                let filteredDocuments = snapshot.documents.filter { document in
                    if let levels = document.get("level") as? [String] {
                        return levels.contains(self?.quizLevel ?? "")
                    }
                    return false
                }

                // Further filter filteredDocuments by "type"
                let filteredDocumentsByType = filteredDocuments.filter { document in
                    if let types = document.get("type") as? [String] {
                        return types.contains(questionType)
                    }
                    return false
                }

                // Count the final number of questions
                self?.numberOfQuestions = String(filteredDocumentsByType.count)
            }
    }

    private func fetchPeopleAttendedAndTitle() {
        let db = Firestore.firestore()
        let quizDocumentReference = db.collection("i18n").document("dk")
            .collection("quiz").document(rankType)
            .collection(quizLevel).document("info")

        quizDocumentReference.getDocument { [weak self] document, error in
            guard let document = document, document.exists else {
                print("Error fetching quiz information: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            if let attended = document["peopleAttended"] as? String {
                self?.peopleAttended = attended
                print("People attended: \(attended)")
            }
            if let title = document["title"] as? String {
                self?.title = title
                print("Quiz title: \(title)")
            }
        }
    }
    
    private func fetchRules() {
        dynamicContentViewModel.fetchRules(forCollection: quizLevel) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let rules):
                        self?.rules = rules
                        print("Fetched rules: \(rules)")
                    case .failure(let error):
                        print("Error fetching rules: \(error.localizedDescription)")
                }
            }
        }
    }
}
