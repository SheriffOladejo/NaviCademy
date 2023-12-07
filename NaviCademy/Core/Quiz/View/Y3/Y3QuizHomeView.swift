//
//  Y3QuizHomeView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 27/11/2023.
//

import SwiftUI

struct Y3QuizHomeView: View {
    @Environment(\.dismiss) var dismiss

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
                            Text("Quizkategorier")
                        }
                        .padding(.top, 15)

                        VStack {
                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Skibslys og Dagsignaler")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Test din viden på fire forskellige niveauer")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)

                                    }
                                }
                            }

                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Vigeregler")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Test din viden om vigeregler")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)

                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Tågesignaler")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Hvor ofte og hvilke signaler bruges")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Manøvre- og advarselssignaler")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Hvilke signaler bruges")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Fyrkarakteristika")
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
                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Observationsopgaver")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Hvordan reagerrer du i situationen")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                    }
                                }
                            }
                            NavigationLink(destination: Y3QuizLightsHomeView(rankType: "y3lights")
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
                                        Text("Prøveopgaver")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("Samlet quiz, med et udvalg af alle typer opgaver")
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
    Y3QuizHomeView()
}
