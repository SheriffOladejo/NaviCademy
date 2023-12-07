//
//  Y3QuizOptionView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 25/11/2023.
//

import Foundation
import SwiftUI


struct Y3OptionsGridView: View {
    var y3quizManagerViewModel: Y3QuizManagerViewModel
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(y3quizManagerViewModel.model.y3quizModel.optionsList) { y3quizOption in
                Y3OptionCardView(y3quizOption: y3quizOption)
                    .onTapGesture {
                        y3quizManagerViewModel.verifyAnswer(selectedOption: y3quizOption)
                    }
            }
        }
        
    }
    

}

struct Y3OptionCardView : View {
    var y3quizOption: Y3QuizOption
    var body: some View {
        VStack {
            if (y3quizOption.isMatched) && (y3quizOption.isSelected) {
                Y3OptionStatusImageView(imageName: "checkmark")
            } else if (!(y3quizOption.isMatched) && (y3quizOption.isSelected)) {
                Y3OptionStatusImageView(imageName: "xmark")
            } else {
                Y3OptionView(y3quizOption: y3quizOption)
            }
        }.frame(width: 150, height: 150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (y3quizOption.isMatched) && (y3quizOption.isSelected) {
            return Color.green
        } else if (!(y3quizOption.isMatched) && (y3quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct Y3OptionView: View {
    var y3quizOption: y3QuizOption
    var body: some View {
        VStack{
            Text(y3quizOption.y3optionId)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .frame(width: 50, height: 50)
                .background(y3quizOption.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(25)
            
            Text(y3quizOption.option)
                .frame(width: 150, height: 38)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

struct Y3OptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}
