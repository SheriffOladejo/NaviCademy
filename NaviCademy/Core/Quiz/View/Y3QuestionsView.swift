//
//  Y3QuestionsView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import SwiftUI
import FirebaseFirestore

struct Y3QuestionsView: View {
    var y3quizinfo: QuizInfoModel
    @State var y3questions: [Y3QuestionModel]
    var onFinish: ()->()
    /// - View Properties
    @Environment(\.dismiss) private var dismiss
    @State private var progress: CGFloat = 0
    @State private var currentIndex: Int = 0
    @State private var score: CGFloat = 0
    @State private var showScoreCard: Bool = false

    var body: some View {
        VStack(spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("DarkGreen"))
            }
            .hAlign(.trailing)
            
            /// - Quiztitel
//            Text(y3quizinfo.title)
//                .font(.title)
//                .fontWeight(.semibold)
//                .hAlign(.leading)
            
            GeometryReader {
                let size = $0.size
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color("LightGreen"))
                    
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: progress * size.width, alignment: .leading)
                }
                .clipShape(Capsule())
            }
            .frame(height: 20)
            .padding(.top, 5)
            
            /// - Questions
            GeometryReader {_ in
                ForEach(y3questions.indices, id: \.self) { index in
                    if currentIndex == index {
                        QuestionView(y3questions[currentIndex])
                        /// - Transition between questions
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    }
                }
            }
            /// - Remove Padding
            .padding(.horizontal, -15)
            .padding(.vertical, 15)
            
            CustomButton(title: currentIndex == (y3questions.count - 1) ? "Afslut quiz" : "Næste spørgsmål") {
                if currentIndex == (y3questions.count - 1) {
                    /// - Present ScoreCard
                    showScoreCard.toggle()
                } else {
                    withAnimation(.easeInOut){
                        currentIndex += 1
                        progress = CGFloat(currentIndex) / CGFloat(y3questions.count - 1)
                    }

                }
                
            }

        }
        .padding(15)
        .hAlign(.center).vAlign(.top)
        .background {
            LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("NaviCademy-Logo")
                .resizable()
                .scaledToFit()
                .opacity(0.03)
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $showScoreCard) {
            ScoreCardView(score: score / CGFloat(y3questions.count) * 100) {
                dismiss()
                onFinish()
            }
        }
    }
    
    /// - Question View
    @ViewBuilder
    func QuestionView(_ y3question: Y3QuestionModel)->some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Spørgsmål \(currentIndex + 1)/\(y3questions.count)")
                    .font(.callout)
                    .foregroundColor(Color("DarkGreen"))
                    .hAlign(.leading)
                
                Image("\(y3question.image)")
                    .resizable()
                    .scaledToFill()
                    .padding(5)
                    .hAlign(.center)
                
                Text("Skibet er:")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(y3question.answers[0])
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(spacing: 12) {
                    ForEach(y3question.options, id: \.self) { option in
                        /// - For test purposes: Displaying Correct and Wrong Answers after the user has Tapped any one of the options
                        ZStack {
                            OptionView(option, .gray)
                                .opacity(y3question.answers[0] == option && y3question.tappedAnswer != "" ? 0 : 1)
                            OptionView(option, .green)
                                .opacity(y3question.answers[0] == option && y3question.tappedAnswer != "" ? 1 : 0)
                            OptionView(option, .red)
                                .opacity(y3question.tappedAnswer == option && y3question.tappedAnswer != y3question.answers[0] ? 1 : 0)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            /// - Disable after tapped
//                            guard y3questions[currentIndex].tappedAnswer == "" else { return }
                            withAnimation(.easeInOut) {
                                y3questions[currentIndex].tappedAnswer = option
                                /// - Update score
                                if y3question.answers[0] == option {
                                    score += 1.0
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                
            }
            .padding(15)
            .hAlign(.center)
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.white)
            }
            .padding(.horizontal, 15)
        }
    }
    
    /// - Option View
    @ViewBuilder
    func OptionView(_ option: String,_ tint: Color)->some View {
        Text(option)
            .foregroundColor(tint)
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
            .hAlign(.leading)
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(tint.opacity(0.15))
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(tint.opacity(tint == .gray ? 0.15 : 1), lineWidth: 2)
                    }
            }
    }
}

#Preview {
    Y3QuizView()
}

// MARK: Score Card View
