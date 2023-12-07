//
//  Y3QuizLightsLevel2View.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 30/11/2023.
//

import SwiftUI

struct Y3QuizLightsLevel2View: View {
    @StateObject private var viewModel: Y3QuizLightsLevel1ViewModel
    
    init(quizLevel: String) {
        self._viewModel = StateObject(wrappedValue: Y3QuizLightsLevel1ViewModel(quizLevel: quizLevel))
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
            
            VStack(spacing: 10) {
                Text("Y3 - Skibslys og Dagsfigurer - Niveau 1")
                    .font(.title)
                    .fontWeight(.semibold)
                    .hAlign(.leading)
                
                /// - Custom Label
                
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
                
                NavigationLink(
                    destination: Y3QuizQuestionsView(),
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
    Y3QuizLightsLevel1View(quizLevel: "level2")
}
