//
//  ToDoListView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var vm = ToDoListViewViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Welcome to Kerjain APP")
                    .font(.title3)

                Button {
                    vm.signOut()
                } label: {
                    Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        vm.signOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    .accessibilityLabel("Sign Out")
                }
            }
        }
        // indikator proses (opsional)
        .overlay {
            if vm.isSigningOut {
                ProgressView()
                    .controlSize(.large)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        // alert error (opsional)
        .alert("Sign out failed",
               isPresented: Binding(
                    get: { vm.errorMessage != nil },
                    set: { if !$0 { vm.errorMessage = nil } }
               ),
               actions: { Button("OK", role: .cancel) { } },
               message: { Text(vm.errorMessage ?? "") })
    }
}
#Preview {
    ToDoListView()
}
