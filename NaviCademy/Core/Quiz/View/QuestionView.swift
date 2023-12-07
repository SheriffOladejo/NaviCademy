//
//  QuestionView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 24/11/2023.
//

import SwiftUI

struct Question {
    let id = UUID()
    let title: String
    let answer: [String]
    let choises: [String]
    var selections: [String]?
}

struct QuestionView: View {
    @State var question = Question
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.title)
                .padding([.leading, .trailing, .top], 24)

            Image("PDV Back Day - Begrænset Slæb")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(14)
            
            ForEach(question.choises, id: \.self) { choise in
                HStack {
                    Button {
                        print(choise)
                    } label: {
                        if question.selection == choise {
                            RoundedRectangle(cornerRadius: 2)
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        } else {
                            RoundedRectangle(cornerRadius: 2)
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                    }
                    Text(choise)
// question.choises.contains(choise)

                }
            }
            .padding(.leading, 24)
        }
        Spacer()
    }
}

#Preview {
    QuestionView()
}
