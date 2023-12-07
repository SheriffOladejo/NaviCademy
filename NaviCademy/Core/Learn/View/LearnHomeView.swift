//
//  LearnHomeView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 26/11/2023.
//

import SwiftUI

struct LearnHomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("NaviCademy-Logo")
                .resizable()
                .scaledToFit()
                .opacity(0.03)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text("Læringscenter")
                    .font(.title)
                    .fontWeight(.semibold)
                    .hAlign(.leading)
                
                /// - Custom Label
                CustomLabel("list.bullet.rectangle.portrait", "14", "Forskellige læringsforløb")
                    .padding(.top, 20)
                
                CustomLabel("person", "12", "Har gennemført et læringsforløb")
                    .padding(.top, 5)
                
                Divider()
                    .padding(.horizontal, -15)
                    .padding(.top, 15)
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Inden for hver hovedkategori, kan du vælge et specifikt emne at arbejde med:")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, 12)
                            .padding(.top, 12)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                                .offset(y: 8)
                            Text("Vandscooter")
                                .font(.callout)
                                .lineLimit(3)
                            Text("Dette er grundlæggen viden, som du skulle kunne, for at erhverve et certifikat til at føre vandscooter.")
                                .font(.footnote)
                        }
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                                .offset(y: 8)
                            Text("Speedbåd")
                                .font(.callout)
                                .lineLimit(3)
                            Text("Dette er grundlæggen viden, som du skulle kunne, for at erhverve et certifikat til at føre speedbød.")
                                .font(.footnote)
                        }
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                                .offset(y: 8)
                            Text("Duelighed")
                                .font(.callout)
                                .lineLimit(3)
                            Text("Her finder du små forløb, der tager dig igennem: Skibslys og -figurer, tågesignaler, signalflag, vigeregler og sømærker. De der præsenteres, forventes du at kende ved den teoretiske prøve i duelighed.")
                                .font(.footnote)
                        }
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                                .offset(y: 8)
                            Text("Yachtskipper 3")
                                .font(.callout)
                                .lineLimit(3)
                            Text("Her finder du små forløb, der tager dig igennem: Skibslys og -figurer, tågesignaler, signalflag, vigeregler, sømærker og fyrkarakterer. De der præsenteres, vil du blive prøvet i, ved den skriftlige færdighedsprøve ved yachtskipper 3 eksamenen.")
                                .font(.footnote)
                        }
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                                .offset(y: 8)
                            Text("Admiralen")
                                .font(.callout)
                                .lineLimit(3)
                            Text("Admiralen ved alt, ned i detaljen. Du kan ikke teste om du har admiralniveau, men du kan nørde lidt sammen med hende om viden om havet.")
                                .font(.footnote)
                        }
                    }
                    
                    Spacer()
                }

            }
            .padding(15)
        }
    }
}

#Preview {
    HomeView()
}
