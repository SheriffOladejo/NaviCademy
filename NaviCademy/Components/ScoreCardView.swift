//
//  ScoreCardView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import SwiftUI
import FirebaseFirestore

struct ScoreCardView: View {
    var score: CGFloat
    var onDismiss: ()->()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Text("Resultatet af din quiz")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    Text("Tillykke!\n Du svarede rigtigt på")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Text(String(format: "%.0f", score) + "%")
                        .font(.title.bold())
                        .padding(.bottom, 10)
                    
                    Image("gyldent-anker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 220)
                }
                .foregroundColor(Color("DarkGreen"))
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
                .hAlign(.center)
                .background {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.white)
                }
            }
            .vAlign(.center)
            
            CustomButton(title: "Tilbage til forsiden") {
                /// - Update Database before quitting
                Firestore.firestore().collection("y3-quiz").document("Info").updateData(["peopleAttended": FieldValue.increment(1.0)])
                onDismiss()
                dismiss()
            }
        }
        .padding(15)
        .background(Color("DarkGreen"))
        .ignoresSafeArea()
    }
}


// #Preview {
//    ScoreCardView(score: 5 / 20 * 100)
// }
