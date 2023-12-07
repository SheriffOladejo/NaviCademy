//
//  Y3QuizView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Y3QuizView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var quizInfo: QuizInfoModel?
    @State private var y3quizConstants: Y3QuizConstantsModel?
    @State private var y3questions: [Y3QuestionModel] = []
    @State private var startQuiz: Bool = false
    /// - User Anonymous Log Status
    @AppStorage("log_status") private var logStatus: Bool = false
    var body: some View {
//        if let user = viewModel.currentUser {
            ZStack {
                LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                Image("NaviCademy-Logo")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.03)
                    .ignoresSafeArea()
                
                
                if let info = quizInfo {
                    VStack(spacing: 10) {
                        Text(info.title)
                            .font(.title)
                            .fontWeight(.semibold)
                            .hAlign(.leading)
                        
                        /// - Custom Label
                        CustomLabel("list.bullet.rectangle.portrait", "\(y3questions.count)", "Spørgsmål i quizbanken")
                            .padding(.top, 20)
                        
                        CustomLabel("person", "\(info.peopleAttended)", "Har taget denne quiz")
                            .padding(.top, 5)
                        
                        Divider()
                            .padding(.horizontal, -15)
                            .padding(.top, 15)
                        
                        if !info.rules.isEmpty {
                            RulesView(info.rules)
                        }


                        CustomButton(title: "Start quizzen", onClick: {
                            startQuiz.toggle()
                        })
                        
                        Spacer()
                        
                    }
                    .padding(15)
                    .fullScreenCover(isPresented: $startQuiz) {
                        Y3QuestionsView(y3quizinfo: info, y3questions: y3questions) {
                            /// - User has finised the quiz -> Update the UI
//                            let info?.peopleAttended += 1
                        }
                    }
                    
                } else {
                    // Presenting Progress View
                    VStack(spacing: 4) {
                        ProgressView()
                        Text("Vent venligst...")
                            .font(.caption2)
                            .foregroundColor(.black)
                        
                    }
                    .task {
                        do {
                            try await fetchData()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
//        } else {
//            LoginView()
//        }
    }
    
   
    /// - Fetch Quiz Info and Questions
    func fetchData()async throws{
        try await loginUserAnonymous()
        let info = try await Firestore.firestore().collection("y3-quiz").document("Info").getDocument().data(as: QuizInfoModel.self)
//        let constants = try await Firestore.firestore().collection("y3-quiz").document("Options").getDocument().data(as: Y3QuizConstantsModel.self)
        let questions = try await Firestore.firestore().collection("y3-quiz").document("Info").collection("Questions").getDocuments()
            .documents.compactMap {
                try $0.data(as: Y3QuestionModel.self)
            }
        
        /// - UI Must be Updated on Main Thread
        await MainActor.run(body: {
            self.quizInfo = info
//            self.y3quizConstants = constants
//            print(constants)
            self.y3questions = questions
        })
        
    }
    
    /// - Login User as Anonymous For Firebase Access
    func loginUserAnonymous()async throws{
        if !logStatus {
            try await Auth.auth().signInAnonymously()
        }
        
    }
}

#Preview {
    Y3QuizView()
}

// MARK: View Extension
extension View {
    func hAlign(_ alignment: Alignment)->some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment)->some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
