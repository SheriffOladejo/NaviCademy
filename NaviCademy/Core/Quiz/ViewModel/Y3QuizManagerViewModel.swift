//
//  Y3QuizManagerViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import Foundation
import SwiftUI

class Y3QuizManagerViewModel : ObservableObject {

    static var currentIndex = 0
    
    static func createY3QuizModel(i:Int) -> Y3Quiz {
        return Y3Quiz(currentQuestionIndex: i, y3quizModel: y3quizData[i])
    }
    
    @Published var model = Y3QuizManagerViewModel.createY3QuizModel(i: Y3QuizManagerViewModel.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 150
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: Y3QuizOption) {
        for index in model,y3QuizModel.optionsList.indices {
            model.y3quizModel.optionsList[index].isMatched = false
            model.y3quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.y3quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.y3quizModel.answer {
                model.y3quizModel.optionsList[index].isMatched = true
                model.y3quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (Y3QuizManagerViewModel.currentIndex < 2) {
                        Y3QuizManagerViewModel.currentIndex = QuizManagerViewModel.currentIndex + 1
                        self.model = Y3QuizManagerViewModel.createY3QuizModel(i: Y3QuizManagerViewModel.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.y3quizModel.optionsList[index].isMatched = false
                model.y3quizModel.optionsList[index].isSelected = true
            }

        }
    }
    
    func restartY3Quiz() {
        Y3QuizManagerViewModel.currentIndex = 0
        model = Y3QuizManagerViewModel.createY3QuizModel(i: Y3QuizManagerViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
    
                                     
                                     
                                     
                                

}

extension Y3QuizManagerViewModel
{
    static var y3quizData: [Y3QuizModel] {
        [
            Y3QuizModel(question: "Marker for figuren, hvilke oplysninger de viste lys og figurer viser",
                      answer: "B",
                      optionsList: [Y3QuizOption(id: 11, optionId: "A", option: "Maskindrevet", color: Color.yellow),
                                    Y3QuizOption(id: 12,optionId: "B", option: "Slæbebåd", color: Color.red),
                                    Y3QuizOption(id: 13,optionId: "C", option: "Rabbit", color: Color.green),
                                    Y3QuizOption(id: 14,optionId: "D", option: "Leoprd", color: Color.purple)]),
            
            Y3QuizModel(question: "Which of these animals swims in upright position?",
                      answer: "C",
                      optionsList: [Y3QuizOption(id: 21,optionId: "A", option: "Sea Lion", color: Color.yellow),
                                    Y3QuizOption(id: 22,optionId: "B", option: "Sea Urchin", color: Color.red),
                                    Y3QuizOption(id: 23,optionId: "C", option: "Seahorse", color: Color.green),
                                    Y3QuizOption(id: 24,optionId: "D", option: "Sea slug", color: Color.purple)]),
            
            Y3QuizModel(question: "Which is the world largest living fish?",
                      answer: "B",
                      optionsList: [Y3QuizOption(id: 31,optionId: "A", option: "Manta Ray", color: Color.yellow),
                                    Y3QuizOption(id: 32,optionId: "B", option: "Whale Shark", color: Color.red),
                                    Y3QuizOption(id: 33,optionId: "C", option: "Marlin", color: Color.green),
                                    Y3QuizOption(id: 34,optionId: "D", option: "Sailfish", color: Color.purple)])
        ]
    }
}
