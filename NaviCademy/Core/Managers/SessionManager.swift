//
//  SessionManager.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 01/12/2023.
//

import Foundation

class SessionManager: ObservableObject {
    // Singleton instance for managing the session
    static let shared = SessionManager()

    // Dictionary to store the tapped options for each question
    private (set) var tappedOptions: [String: String] = [:]

    // Array to store selected answers
    @Published var selectedAnswers: [String] = []

    // Private initializer to enforce singleton pattern
    public init() {}

    // Method to store the tapped option for a specific question
    func storeTappedOption(questionId: String, optionKey: String) {
        tappedOptions[questionId] = optionKey
    }

    // Method to retrieve the tapped option for a specific question
    func getTappedOptions() -> [String: String] {
        return tappedOptions
    }

    // Method to clear the session data (if needed)
    func clearSession() {
        tappedOptions.removeAll()
        selectedAnswers.removeAll()
    }
}
