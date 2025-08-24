//
//  RegisterViewViewModel.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

@MainActor
final class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var errorMessage = ""
    @Published var isLoading = false
    
    private let db = Firestore.firestore()
    
    func register() {
        guard validate() else { return }
        isLoading = true
        
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                self.isLoading = false
                self.errorMessage = error.localizedDescription
                return
            }
            guard let uid = result?.user.uid else {
                self.isLoading = false
                self.errorMessage = "No UID returned."
                return
            }
            self.insertUserRecord(id: uid, fullname: fullname, email: email)
        }
    }
    
    private func insertUserRecord(id: String, fullname: String, email: String) {
        let newUser = User(
                        id: id,
                        fullname: fullname,
                        email: email,
                        joined: Date().timeIntervalSince1970
            )
        
        let data = newUser.asDictionary()
        
        db.collection("users").document(id).setData(data) { [weak self] err in
            guard let self = self else { return }
            self.isLoading = false
            if let err = err { self.errorMessage = err.localizedDescription }
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        let name = fullname.trimmingCharacters(in: .whitespacesAndNewlines)
        let mail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !name.isEmpty, !mail.isEmpty, !pass.isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        guard mail.contains("@"), mail.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        guard pass.count >= 6 else {
            errorMessage = "Password must more than 6 characters"
            return false
        }
        return true
    }
}
