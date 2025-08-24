//
//  RegisterView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @StateObject private var kb = KeyboardObserver()
    @FocusState private var focused: Bool    // fokus global; atau pakai enum per field di form


    var body: some View {
        NavigationStack{
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
                    .focused($focused) // di form, ikat TextField/SecureField ke $focused
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, kb.height)
                    .animation(.easeOut(duration: 0.25), value: kb.height)
                }
            }
            .disabled(viewModel.isLoading)
            .overlay {
                if viewModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.2).ignoresSafeArea()
                        ProgressView()
                            .controlSize(.large)
                            .padding(24)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 8)
                    }
                }
            }
            .toolbar {                // tombol Done untuk nutup keyboard
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { focused = false }
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
