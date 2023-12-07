//
//  DynamicContentViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 28/11/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DynamicContentViewModel: ObservableObject {
    @Published var rules: [String] = []
    
    func fetchRules(forCollection collection: String, completion: @escaping (Result<[String], Error>) -> Void) {
        // Your logic to fetch rules here
        let documentRef = Firestore.firestore()
            .collection("i18n")
            .document("dk")
            .collection("quiz")
            .document("y3lights")
            .collection(collection) // Use the provided collection parameter
            .document("info")

        // Fetch data from the document
        documentRef.getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let document = document, document.exists else {
                completion(.failure(FirestoreError.documentNotFound))
                return
            }

            // Extract data from the document
            if let rulesArray = document["rules"] as? [String] {
                completion(.success(rulesArray))
            } else {
                completion(.failure(FirestoreError.invalidData))
            }
        }
    }

    // Define custom errors for better error handling
    enum FirestoreError: Error {
        case documentNotFound
        case invalidData
    }
}
