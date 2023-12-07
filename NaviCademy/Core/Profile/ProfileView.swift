//
//  ProfileView.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 22/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            ZStack {
                LinearGradient(colors: [Color(hue: 0.55, saturation: 0.76, brightness: 0.42).opacity(0.2), Color(hue: 0.48, saturation: 0.57, brightness: 0.69).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                Image("NaviCademy-Logo")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.03)
                    .ignoresSafeArea()
                
                List {
                    Section {
                        HStack {
//                            Text(user.initials)
//                                .font(.title)
//                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
//                                .frame(width: 72, height: 72)
//                                .background {
                                    Image("dk-marineelev-striber")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 72, height: 72)
//                                }
                                .background(.black)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Rang: Marineelev\n" + user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(Color("DarkGreen"))
                            }
                        }
                    }
                    
                    Section("Generelt") {
                        HStack {
                            SettingsRowView(imageName: "gear",
                                            title: "Version",
                                            tintColor: Color("LightGreen"))
                            
                            Spacer()
                            
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section("Konto") {
                        Button {
                            print("Ny kode")
                        } label: {
                            HStack{
                                SettingsRowView(imageName: "pencil.circle.fill",
                                                title: "Nyt kodeord",
                                                tintColor: Color("LightGreen"))
                                
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill",
                                            title: "Log ud",
                                            tintColor: .red)
                        }
                        Button {
                            print("Slet konto")
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill",
                                            title: "Slet konto",
                                            tintColor: .red)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .opacity(0.7)
            }
        }
    }
}


#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
