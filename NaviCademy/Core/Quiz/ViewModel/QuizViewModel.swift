//
//  QuizViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 30/11/2023.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var quizManager = QuizManager()
    @Published var currentQuestionIndex = 0
    @Published var isLoading: Bool = false
    @Published var currentQuestion: QuizQuestion? {
        didSet {
            // Perform actions when currentQuestion is set
        }
    }
    
    func optionTapped(optionKey: String) {
            // Store the tapped option for the current question
            if let currentQuestion = currentQuestion {
                SessionManager.shared.storeTappedOption(questionId: currentQuestion.id, optionKey: optionKey)
            }
        }

    func loadQuestions(rankType: String, quizLevel: String) {
        isLoading = true
        quizManager.loadQuestions(rankType: rankType, quizLevel: quizLevel) {
            DispatchQueue.main.async {
                self.isLoading = false
                if self.quizManager.questions.isEmpty {
                    self.currentQuestion = nil
                } else {
                    self.currentQuestionIndex = 0
                    self.currentQuestion = self.quizManager.questions[self.currentQuestionIndex]
                }
            }
        }
    }

    func goToNextQuestion() {
        if currentQuestionIndex < quizManager.questions.count - 1 {
            currentQuestionIndex += 1
            updateCurrentQuestion()
        }
    }

    func goToPreviousQuestion() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
            updateCurrentQuestion()
        }
    }

    private func updateCurrentQuestion() {
        guard quizManager.questions.indices.contains(currentQuestionIndex) else {
            currentQuestion = nil
            return
        }
        currentQuestion = quizManager.questions[currentQuestionIndex]
    }
}
