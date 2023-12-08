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
    @Published var questionTitle: String = ""  // Property to store the retrieved title
    @Published var title: String = ""  // Property to store the retrieved title
    @Published var imageName: String = ""  // Property to store the retrieved image name
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

        // Refactor the query to fetch the full document
        questionCollectionReference
            .whereField("rank", arrayContains: rank)
            .getDocuments { [unowned self] (querySnapshot, error) in
                // Handle the query results
                if let error = error {
                    print("Error fetching questions: \(error)")
                    return
                }
                
                guard let querySnapshot = querySnapshot else {
                    print("No questions found")
                    return
                }

                for document in querySnapshot.documents {
                    // Access the document data including title and image
                    if let questionTitle = document.data()["title"] as? String {
                        // Store the retrieved title in the ViewModel
                        self.questionTitle = questionTitle
                        print("Quiz title: \(title)")
                    }
                    if let imageName = document.data()["image"] as? String {
                        // Store the retrieved image name in the ViewModel
                        self.imageName = imageName
                        print("Image name: \(imageName)")
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
