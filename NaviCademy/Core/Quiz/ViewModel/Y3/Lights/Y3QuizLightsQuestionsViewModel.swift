//
//  Y3QuizLightsQuestionsViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 08/12/2023.
//

import Foundation

class Y3QuizLightsQuestionsViewModel: ObservableObject {
    @Published var questions: [Y3QuizLightsModel] = []  // Marked as @Published to bind to the view
    @Published var currentQuestionIndex: Int = 0  // Published to enable updates
    @Published var selectedAnswers: [Bool] = []  // Store the selected answers
    
    private let quizManager: Y3QuizLightsManager
    private let quizLevel: String
    
    init(quizLevel: String) {
        self.quizLevel = quizLevel
        quizManager = Y3QuizLightsManager(quizLevel: quizLevel)  // Initialize the manager
        fetchSelectedQuestions()  // Fetch the questions
    }
    
    public func fetchSelectedQuestions() {
        quizManager.loadQuestions { selectedQuestions in
            //            print(selectedQuestions)
            DispatchQueue.main.async {
                self.questions = selectedQuestions ?? []
            }
        }
    }
    // Reset the selected answers
    func resetSelectedAnswers() {
        selectedAnswers = Array(repeating: false, count: questions.count)
    }
    
    func updateSelectedAnswer(questionID: UUID, selected: Bool) {
        // Find and update the selected answer based on the questionID
        if let index = questions.firstIndex(where: { $0.id == questionID }) {
            selectedAnswers[index] = selected
        }
    }
}
