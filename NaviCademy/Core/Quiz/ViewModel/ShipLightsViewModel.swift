//
//  AuthViewModel.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 22/11/2023.
//

import Foundation

@MainActor
class ShipLightsViewModel: ObservableObject {
    
    var muckQuestions = [
        Question(title: "Marker hvilke oplysninger de viste lys eller figurer viser:", answer: ["A", "C"], choises: ["A", "B", "C", "D"]),
        Question(title: "Marker hvilke oplysninger de viste lys eller figurer viser:", answer: ["A", "C"], choises: ["A", "B", "C", "D"]),
        Question(title: "Marker hvilke oplysninger de viste lys eller figurer viser:", answer: ["A", "C"], choises: ["A", "B", "C", "D"]),
        Question(title: "Marker hvilke oplysninger de viste lys eller figurer viser:", answer: ["A", "C"], choises: ["A", "B", "C", "D"])

    ]
//    @Published var userSession: FirebaseAuth.User?
//    @Published var currentUser: User?
    
//    init() {
//        self.userSession = ShipLights.auth().currentUser
        
//        Task {
//            await fetchUser()
//        }
//    }
    
}
