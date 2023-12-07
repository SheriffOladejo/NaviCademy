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
    @Published var title: String = ""
    @Published var rules: [String] = []
    
    var rankType: String = "y3lights"
    var quizLevel: String = "level2"
    
    init(quizLevel: String) {
        self.quizLevel = quizLevel
        fetchData()
    }
    
    func fetchData() {
        let db = Firestore.firestore()

        let questionCollectionReference = db.collection("i18n").document("dk").collection("question")
        let rank = rankType.prefix(2)
        let type = String(rankType.suffix(rankType.count - 2))
        print("questionCollectionReference: \(questionCollectionReference)")
        print("Rank: \(rank)")
        print("Type: \(type)")

        let query = questionCollectionReference
            .whereField("rank", arrayContains: rank)

        print("Query: \(query)")

        query.getDocuments { [unowned self] (querySnapshot, error) in
            if let error = error {
                print("Error fetching questions: \(error)")
                return
            }
            
            guard let querySnapshot = querySnapshot else {
                print("No questions found")
                return
            }
            
            for document in querySnapshot.documents {
                // Access the document data
                if let theType = document.data()["type"] as? [String], let theLevel = document.data()["level"] as? [String] {
                    // Check if both the "type" and "level" match the desired values
                    if theType.contains(type), theLevel.contains(quizLevel) {
                        // Both the "type" and "level" match, process the document
                        print("Document ID: \(document.documentID), The-Type: \(theType), The-Level: \(theLevel)")
                        print("Document: \(document.data())")
                    }
                }
            }
        }
        
        // Fetch number of people attended
        let quizDocumentReference = db.collection("i18n").document("dk").collection("quiz").document("y3lights").collection(quizLevel).document("info")
        
        quizDocumentReference.getDocument { [weak self] document, error in
            if let error = error {
                print("Error fetching quiz information: \(error)")
                return
            }
            
            guard let document = document, document.exists else {
                print("Quiz document does not exist")
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
        
        // Fetch rules using DynamicContentViewModel
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
