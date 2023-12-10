//
//  Y3QuizLightsQuestionsView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 08/12/2023.
//

import SwiftUI

struct Y3QuizLightsQuestionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var questionsViewModel: Y3QuizLightsQuestionsViewModel
    @ObservedObject var optionsViewModel: Y3QuizLightsOptionsViewModel
    
    init(quizLevel: String) {
        self.questionsViewModel = Y3QuizLightsQuestionsViewModel(quizLevel: quizLevel)
        self.optionsViewModel = Y3QuizLightsOptionsViewModel()
        self.optionsViewModel.fetchOptions()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                Image("NaviCademy-Logo")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.03)
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            if questionsViewModel.questions.isEmpty {
                                VStack {
                                    ProgressView()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white)
                            } else {
                                VStack(spacing: 10) {
                                    Text(questionsViewModel.questions[questionsViewModel.currentQuestionIndex].questionText)
                                        .font(.title)
                                    Image(questionsViewModel.questions[questionsViewModel.currentQuestionIndex].imageText)
                                    
                                    if optionsViewModel.options != nil {
                                        Y3QuizLightsOptionComponent(title: "Skibet er:", options: optionsViewModel.options!)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    .navigationTitle("Yachtskipper 3 Quiz")
                    HStack {
                        Button("Tilbage") {
                            if questionsViewModel.currentQuestionIndex > 0 {
                                questionsViewModel.currentQuestionIndex -= 1
                            } else {
                                // Handle when the first question is already being displayed
                            }
                        }
                        .padding()
                        .disabled(questionsViewModel.currentQuestionIndex == 0)
                        
                        Button("Frem") {
                            if questionsViewModel.currentQuestionIndex < questionsViewModel.questions.count - 1 {
                                questionsViewModel.currentQuestionIndex += 1
                            } else {
                                // Handle when all questions have been shown
                            }
                        }
                        .padding()
                        .disabled(questionsViewModel.currentQuestionIndex == questionsViewModel.questions.count - 1)
                    }
                    .zIndex(1)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
            }
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundStyle(Color("DarkGreen"))
                .padding(.trailing, 40)

            )
        }
    }
}

#Preview {
    Y3QuizLightsQuestionsView(quizLevel: "level2") // Example rankType and quizLevel values
}
