//
//  QuizManager.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 30/11/2023.
//

import Firebase

class QuizManager: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var infos: [QuizInfo] = []
    @Published var questions: [QuizQuestion] = []

    func loadQuizInfo(rankType: String, quizLevel: String, completion: @escaping () -> Void) {
        let db = Firestore.firestore()
        let quizRef = db.collection("i18n").document("dk").collection("quiz").document(rankType).collection(quizLevel).document("info")

        quizRef.getDocument { (document, error) in
            if let error = error {
                print("Error getting quiz info: \(error)")
            } else {
                // Clear existing questions
                self.infos = []
                
                if let data = document?.data() {
                    // Extract quiz information
                    let options = data["options"] as? [String] ?? []
                    let title = data["title"] as? String ?? ""

                    // Create a question using the extracted information
                    let info = QuizInfo(id: UUID(), question: title, options: options)

                    // Add the question to the questions array
                    self.infos.append(info)

                    // Call completion handler when infos are loaded
                    completion()
                }
            }
        }
    }

    func loadQuestions(rankType: String, quizLevel: String, completion: (() -> Void)? = nil) {
        let db = Firestore.firestore()
        let questionRef = db.collection("i18n").document("dk").collection("question")
        let rank = String(rankType.prefix(2))
        let type = String(rankType.dropFirst(2))
        let questionId = db.collection("i18n").document("dk").collection("question")
        
        print("Rank: \(rank)")
        print("Type: \(type)")
        print("Level: \(quizLevel)")

        // Create a query to filter by rank
        let query = questionRef.whereField("rank", arrayContains: rank)

        let group = DispatchGroup()

        query.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting question info: \(error)")
                completion?()
            } else {
                print("Snapshot documents count: \(snapshot?.documents.count ?? 0)")

                // Filter the result by type
                let filteredByType = snapshot!.documents.filter { document in
                    guard let types = document["type"] as? [String] else { return false }
                    return types.contains(type)
                }

                // Filter the result by level
                let filteredByLevel = filteredByType.filter { document in
                    guard let levels = document["level"] as? [String] else { return false }
                    return levels.contains(quizLevel)
                }

                print("Filtered documents count: \(filteredByLevel.count)")

                let shuffledQuestions = filteredByLevel.shuffled()  // Shuffle the filtered questions
                let selectedQuestions = Array(shuffledQuestions.prefix(3))  // Select the first 3 questions

                for document in selectedQuestions {
                    group.enter()
                    let data = document.data()
                    
                    // Extract question information
                    let correctAnswers = data["answers"] as? [String] ?? []
                    let rankType = "\(data["rank"] as? String ?? "")\(data["type"] as? String ?? "")"
                    let questionText = data["question"] as? String ?? ""
                    let imageText = data["image"] as? String ?? ""

                    // Create a question using the extracted information
                    let question = QuizQuestion(id: document.documentID, question: questionText, correctAnswers: correctAnswers, rankType: rankType, image: imageText)

                    // Add the question to the questions array
                    self.questions.append(question)
                    
                    group.leave()
                }

                group.notify(queue: .main) {
                    // Call completion handler when all questions are loaded
                    completion?()
                    self.objectWillChange.send()
                }
            }
        }
    }
}
