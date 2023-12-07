//
//  Y3QuizLightsHomeView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI

struct Y3QuizLightsHomeView: View {
    @Environment(\.dismiss) var dismiss
    var rankType: String // Add this property to accept the rankType

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

                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Yachtskipper 3 Quiz")
                            .font(.title)
                            .foregroundColor(Color("DarkGreen"))


                        HStack {
                            Image(systemName: "lightbulb.max")
                            Text("Skibslys og signalfigurer")
                        }
                        .padding(.top, 15)

                        VStack {
                            NavigationLink(destination: Y3QuizLightsLevelView(rankType: rankType, quizLevel: "level1")
                                .navigationBarBackButtonHidden(true)
                            ) {

                                ZStack {
                                    Color("DarkGreen").frame(width: 320, height: 120)
                                        .cornerRadius(25)
                                        .opacity(0.8)
                                    Image("NaviCademy-Logo")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(0.3)
                                        .ignoresSafeArea()
                                        .frame(width: 300, height: 120)
                                    VStack{
                                        Text("Niveau 1")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Skibslys om natten\nmed omrids af skibet")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)

                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsLevelView(rankType: rankType, quizLevel: "level2")
                                .navigationBarBackButtonHidden(true)
                            ) {

                                ZStack {
                                    Color("DarkGreen").frame(width: 320, height: 120)
                                        .cornerRadius(25)
                                        .opacity(0.8)
                                    Image("NaviCademy-Logo")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(0.3)
                                        .ignoresSafeArea()
                                        .frame(width: 300, height: 120)
                                    VStack{
                                        Text("Niveau 2")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Skibslys og dagsfigurer\nmed omrids af skibet")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)

                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsLevelView(rankType: rankType, quizLevel: "level3")
                                .navigationBarBackButtonHidden(true)
                            ) {

                                ZStack {
                                    Color("DarkGreen").frame(width: 320, height: 120)
                                        .cornerRadius(25)
                                        .opacity(0.8)
                                    Image("NaviCademy-Logo")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(0.3)
                                        .ignoresSafeArea()
                                        .frame(width: 300, height: 120)
                                    VStack{
                                        Text("Niveau 3")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("De mest almindelige\ndagsfigurer og nattelys")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)

                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsLevelView(rankType: rankType, quizLevel: "level4")
                                .navigationBarBackButtonHidden(true)
                            ) {

                                ZStack {
                                    Color("DarkGreen").frame(width: 320, height: 120)
                                        .cornerRadius(25)
                                        .opacity(0.8)
                                    Image("NaviCademy-Logo")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(0.3)
                                        .ignoresSafeArea()
                                        .frame(width: 300, height: 120)
                                    VStack{
                                        Text("Niveau 4")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Alle skibslys og dagssignaler\nfor Yachtskippere af 3. grad")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)

                                    }
                                }
                            }
                        }
                    }
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    Y3QuizLightsHomeView(rankType: "y3lights") // Example rankType value
}
