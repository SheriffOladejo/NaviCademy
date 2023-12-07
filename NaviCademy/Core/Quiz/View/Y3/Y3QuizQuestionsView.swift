//
//  Y3QuizQuestionsView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 28/11/2023.
//

import SwiftUI

struct Y3QuizQuestionsView: View {
    @StateObject var viewModel: QuizOptionViewModel
    @Environment(\.dismiss) var dismiss
    var rankType: String
    var quizLevel: String

    init(rankType: String, quizLevel: String) {
        self.rankType = rankType
        self.quizLevel = quizLevel
        self._viewModel = StateObject(wrappedValue: QuizOptionViewModel(rankType: rankType, quizLevel: quizLevel))
    }

    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient and NaviCademy logo image
                
                VStack {
                    if let title = document["title"] as? String {
                        self?.title = title
                        print("Quiz title: \(title)")
                        Text(title)
                            .font(.largeTitle)
                    }
                    if let imageName = document["image"] as? String {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)  // Adjust the frame size as needed
                    }
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.questions.indices, id: \.self) { index in
                                QuizOptionComponent(rankType: rankType, quizLevel: quizLevel, viewModel: viewModel)
                            }
                        }
                        .padding()
                    }
                    
                    Button(action: submitAnswers) {
                        Text("Submit Answers")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Yachtskipper 3 Quiz")
        }
    }
    
    func submitAnswers() {
        // Logic to submit answers
        // ...
    }
}


#Preview {
    Y3QuizQuestionsView(rankType: "y3lights", quizLevel: "level1") // Example rankType and quizLevel values
}
