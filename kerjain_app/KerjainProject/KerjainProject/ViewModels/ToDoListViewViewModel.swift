//
//  ToDoListViewViewModel.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import Foundation
import FirebaseAuth

class ToDoListViewViewModel: ObservableObject {
    @Published var isSigningOut = false
    @Published var errorMessage: String?

    func signOut() {
        isSigningOut = true
        defer { isSigningOut = false }
        do {
            try Auth.auth().signOut()
            // Listener di MainViewViewModel akan menangkap sign-out dan
            // mengosongkan currentUserId -> MainView kembali ke LoginView
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
