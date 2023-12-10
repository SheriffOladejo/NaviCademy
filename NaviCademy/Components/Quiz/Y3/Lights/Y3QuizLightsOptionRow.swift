//
//  Y3QuizLightsOptionRow.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI
import Firebase
import Combine

struct Y3QuizLightsOptionRow: View {
    @ObservedObject var option: Y3QuizLightsOption

    var body: some View {
        HStack {
            Button {
                option.isSelected.toggle()
            } label: {
                Image(systemName: option.isSelected ? "checkmark.square" : "square")
                    .font(.system(size: 35))
                    .foregroundColor(Color("DarkGreen"))
                    .accessibility(label: option.isSelected ? Text("Option selected") : Text("Option not selected"))
                    .accessibility(hint: option.isSelected ? Text("Uncheck to remove selection") : Text("Check to select option"))
            }

            Text(option.value)
        }
        .hAlign(.leading)
    }
}
// NOTE: Can add a preview for the `Y3QuizLightsOptionRow` directly here
#if DEBUG
struct Y3QuizLightsOptionRow_Previews: PreviewProvider {
    static var previews: some View {
        let option = Y3QuizLightsOption(id: "someId", value: "Some Value") // Replace the values as needed
        return Y3QuizLightsOptionRow(option: option)
    }
}
#endif
