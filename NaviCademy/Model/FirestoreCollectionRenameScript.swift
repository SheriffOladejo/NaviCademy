//
//  FirestoreCollectionRenameScript.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import Foundation
import Firebase

class FirestoreCollectionRenamer {
    let oldCollectionName = "y3-quiz"
    let newCollectionName = "y3-quiz-skibslys"

    init() {
        FirebaseApp.configure()

        // Call the function to rename the collection
        renameCollection()
    }

    func renameCollection() {
        let db = Firestore.firestore()
        let oldCollectionRef = db.collection(oldCollectionName)
        let newCollectionRef = db.collection(newCollectionName)

        // Read documents from the old collection
        oldCollectionRef.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error ?? NSError())")
                return
            }

            // Copy documents to the new collection
            for document in documents {
                let data = document.data()
                newCollectionRef.document(document.documentID).setData(data)
            }

            // Delete the old collection
            /*
            oldCollectionRef.getDocuments { (snapshot, error) in
                for document in snapshot!.documents {
                    document.reference.delete()
                }
            }
            */

            print("Collection renamed successfully.")
        }
    }
}

// Instantiate the class to run the collection renaming process
let collectionRenamer = FirestoreCollectionRenamer()
