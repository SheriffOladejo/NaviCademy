//
//  Y3QuizLightsLevelView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI

struct Y3QuizLightsLevelView: View {
    @StateObject private var viewModel: Y3QuizLightsLevelViewModel
    @Environment(\.dismiss) var dismiss
    
    // Declare rankType and quizLevel
    let rankType: String
    let quizLevel: String

    init(rankType: String, quizLevel: String) {
        self._viewModel = StateObject(wrappedValue: Y3QuizLightsLevelViewModel(quizLevel: quizLevel))
        self.rankType = rankType
        self.quizLevel = quizLevel
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("NaviCademy-Logo")
                .resizable()
                .scaledToFit()
                .opacity(0.03)
                .ignoresSafeArea()
            
            // Go back
            Button {
                dismiss()
            } label:{
                HStack {
                    Image(systemName: "xmark")
                }
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundStyle(Color("DarkGreen"))
            }
            .padding(.top, 20)
            .padding(.trailing, 40)
            .hAlign(.trailing)
            .vAlign(.top)
            
            VStack(spacing: 10) {
                Text(viewModel.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .hAlign(.leading)
                
                // This needs working on - the questions have not been filtered enough
                CustomLabel("list.bullet.rectangle.portrait", viewModel.numberOfQuestions, "Spørgsmål til quizzen i prøvebanken")
                    .padding(.top, 5)
                
                CustomLabel("person", viewModel.peopleAttended, "Har gennemført en denne quiz")
                    .padding(.top, 5)
                
                Divider()
                    .padding(.horizontal, -15)
                    .padding(.top, 15)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Inden du begynder quizzen, bør du være opmærksom på følgende:")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, 12)
                            .padding(.top, 12)
                        
                        ForEach(viewModel.rules, id: \.self) { rule in
                            HStack(alignment: .top, spacing: 10) {
                                Circle()
                                    .fill(.black)
                                    .frame(width: 8, height: 8)
                                    .offset(y: 8)
                                Text(rule)
                                    .font(.callout)
                                    .lineLimit(3)
                            }
                        }
                    }
                    .id(UUID())
                    .onAppear {
                        viewModel.dynamicContentViewModel.fetchRules(forCollection: viewModel.quizLevel) { result in
                            DispatchQueue.main.async {
                                switch result {
                                case .success(let rules):
                                    viewModel.rules = rules
                                case .failure(let error):
                                    print("Error fetching rules: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                
                // Pass rankType and quizLevel to Y3QuizQuestionsView
                NavigationLink(
//                 destination: HomeView()
                    destination: Y3QuizLightsQuestionsView(quizLevel: quizLevel)
                        .navigationBarHidden(true) // Hide the navigation bar
                        .toolbar(.hidden, for: .tabBar)
                        .navigationBarBackButtonHidden(true), // Hide the back button
                    label: {
                        HStack {
                            Text("START QUIZ")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        .background(Color("DarkGreen"))
                        .cornerRadius(10)
                    }
                )
            }
            .padding(15)
        }
    }
}

#Preview {
    Y3QuizLightsLevelView(rankType: "y3lights", quizLevel: "level2")
}
