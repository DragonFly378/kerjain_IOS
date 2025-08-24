//
//  RegisterView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        NavigationView{
            ZStack {
                Image("bg_register")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    HeaderView(
                        title: "Register Now,",
                        caption: "We’ll Worry About Deadlines Later"
                    )
                    Spacer()
                    RegisterFormView(
                        viewModel: viewModel
                    )
                }
            }
            // Kunci seluruh UI saat loading
            .disabled(viewModel.isLoading)
            // Overlay loader di TENGAH layar
            .overlay {
                if viewModel.isLoading {
                    ZStack {
                        // semi gelap agar fokus ke loader
                        ProgressView()
                            .controlSize(.large)
                            .padding(24)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 10)
                    }
                    .transition(.opacity)
                    .animation(.easeInOut, value: viewModel.isLoading)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
