//
//  QuizHomeView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import SwiftUI

struct QuizHomeView: View {
    @StateObject var viewModel = QuizHomeViewModel()

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
                
                VStack(spacing: 10) {
                    Text("Quizcenter")
                        .font(.title)
                        .fontWeight(.semibold)
                        .hAlign(.leading)
                    
                    /// - Custom Label
                    CustomLabel("list.bullet.rectangle.portrait", "\(viewModel.quizDocumentCount)", "Forskellige quizzer")
                        .padding(.top, 20)
                        .onAppear {
                            viewModel.countQuizDocuments()
                        }

                    CustomLabel("list.bullet.rectangle.portrait", "\(viewModel.questionDocumentCount)", "Spørgsmål i prøvebanken")
                        .padding(.top, 5)
                        .onAppear {
                            viewModel.countQuestionDocuments()
                        }
                    
                    CustomLabel("person", "56", "Har gennemført en quiz")
                        .padding(.top, 5)
                    
                    Divider()
                        .padding(.horizontal, -15)
                        .padding(.top, 15)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 14) {
                            
                            HStack {
                                Image(systemName: "lightbulb.max")
                                Text("Quizkategorier")
                            }
                            
                            VStack {
                                NavigationLink(destination: Y3QuizHomeView()
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
                                            Text("Vandscooter")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                        }
                                    }
                                }
                                NavigationLink(destination: Y3QuizHomeView()
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
                                            Text("Speedbåd")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)

                                        }
                                    }
                                }
                                NavigationLink(destination: Y3QuizHomeView()
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
                                            Text("Yachtskipper 3")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)

                                        }
                                    }
                                }
                                NavigationLink(destination: Y3QuizHomeView()
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
                                            Text("Yachtskipper 1")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)

                                        }
                                    }
                                }
                                NavigationLink(destination: Y3QuizHomeView()
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
                                            Text("Admiral")
                                                .font(.title3)
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
                .padding(15)
            }
        }
    }
}

#Preview {
    HomeView()
}
