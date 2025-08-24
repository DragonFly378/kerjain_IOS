//
//  MainViewViewModel.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published private(set) var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
