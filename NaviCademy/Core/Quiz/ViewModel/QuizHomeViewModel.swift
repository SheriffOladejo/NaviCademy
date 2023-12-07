//
//  QuizHomeViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 28/11/2023.
//

import Foundation
import Firebase

class QuizHomeViewModel: ObservableObject {
    @Published var quizDocumentCount: Int = 0
    @Published var questionDocumentCount: Int = 0
    
    func countQuizDocuments() {
        let db = Firestore.firestore()
        let collectionReference = db.collection("i18n").document("dk").collection("quiz")
        
        collectionReference.getDocuments { snapshot, error in
            if let error = error {
                print("Error getting quiz documents: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                self.quizDocumentCount = snapshot.documents.count
            }
        }
    }
    
    func countQuestionDocuments() {
        let db = Firestore.firestore()
        let collectionReference = db.collection("i18n").document("dk").collection("question")
        
        collectionReference.getDocuments { snapshot, error in
            if let error = error {
                print("Error getting question documents: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                self.questionDocumentCount = snapshot.documents.count
            }
        }
    }
    
    func countAllDocuments() {
        countQuizDocuments()
        countQuestionDocuments()
    }
}
