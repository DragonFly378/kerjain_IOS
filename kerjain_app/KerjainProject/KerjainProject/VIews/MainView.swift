//
//  ContentView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 25/7/25.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        Group {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                // signed in
                ToDoListView()
            }else{
                LoginView()
            }
//            Text("hello world")
        }
        // Badge kecil di bawah buat ngecek UID
        .overlay(alignment: .bottom) {
            Text(viewModel.currentUserId.isEmpty ? "UID: (none)" : "UID: \(viewModel.currentUserId)")
                .font(.footnote).padding(6)
                .background(.black.opacity(0.6))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(.bottom, 28)
        }
    }
}
 
#Preview {
    MainView()
}
