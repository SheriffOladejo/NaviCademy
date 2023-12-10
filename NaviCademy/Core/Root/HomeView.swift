//
//  HomeView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = "Home"

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("NaviCademy-Logo")
                .resizable()
                .scaledToFit()
                .opacity(0.03)
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $selectedTab) {
                    
                    MainView()
                        .tabItem {
                            Label("Hjem", systemImage: "house.circle")
                        }
                        .tag("Home")
                    
                    LearnHomeView()
                        .tabItem {
                            Label("Læring", systemImage: "graduationcap.circle")
                        }
                        .tag("Learn")
                    
                    QuizHomeView()
                        .tabItem {
                            Label("Quiz", systemImage: "trophy.circle")
                        }
                        .tag("Quiz")
                    
                    //                    ProfileView()
                    //                        .tabItem {
                    //                            Label("Konto", systemImage: "person.circle")
                    //                        }
                    //                        .tag("Konto")
                    
                    Y3QuizLightsHomeView(rankType: "y3lights")
                        .tabItem {
                            Label("Mere", systemImage: "line.3.horizontal.circle")
                        }
                        .tag("Mere")
                    
                }
                .onAppear() {
                    let standardAppearance = UITabBarAppearance()
                    standardAppearance.shadowColor = UIColor(Color.black)
                    //                standardAppearance.backgroundImage = UIImage(named: "custom_bg")
                    
                    let itemAppearance = UITabBarItemAppearance()
                    itemAppearance.selected.iconColor = UIColor(Color("DarkGreen"))
                    itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color("DarkGreen"))]
                    standardAppearance.inlineLayoutAppearance = itemAppearance
                    standardAppearance.stackedLayoutAppearance = itemAppearance
                    standardAppearance.compactInlineLayoutAppearance = itemAppearance
                    UITabBar.appearance().standardAppearance = standardAppearance
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    HomeView()
}
