//
//  InsideView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 28/11/2023.
//

import SwiftUI

struct InsideView: View {
    @State private var selectedRankType: String?
    @State private var selectedQuizLevel: String?

    var body: some View {
        NavigationView {
            VStack {
                // Your existing content

                NavigationLink(
                    destination: Y3QuizQuestionsView(rankType: selectedRankType ?? "", quizLevel: selectedQuizLevel ?? ""),
                    label: {
                        EmptyView()
                    }
                )
                .navigationBarTitle("Your App Title", displayMode: .inline)
            }
        }
        .onAppear {
            // Additional setup if needed
            // Set the initial values for selectedRankType and selectedQuizLevel
            selectedRankType = "y3lights"
            selectedQuizLevel = "level2"
        }
    }
}

#Preview {
    InsideView()
}
