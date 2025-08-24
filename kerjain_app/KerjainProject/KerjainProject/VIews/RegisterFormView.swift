//
//  RegisterFormView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 3/8/25.
//

import SwiftUI

struct RegisterFormView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 20){
                VStack(spacing:16){
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Fullname")
                            .font(.headline)
                        TextField("Your name here", text: $viewModel.fullname)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .autocorrectionDisabled()
                            .background(Color("WhiteColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                            .font(.headline)
                        TextField("Input your email address", text: $viewModel.email)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color("WhiteColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Password")
                            .font(.headline)
                        SecureField("Input password", text: $viewModel.password)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color("WhiteColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
                VStack(spacing: 8) {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                    }
                    TLButton(
                        title: "Register",
                        background: Color("PrimaryColor"))
                    {
                        guard !viewModel.isLoading else { return }
                        viewModel.register()
                    }
                    .disabled(viewModel.isLoading)
                    .opacity(viewModel.isLoading ? 0.7 : 1)
                    
                }
                
            }
            
        }
        .frame(maxWidth: .infinity) // ⬅️ ini wajib agar isi meluas
        .padding(.horizontal)
        .padding(.bottom, 80)
        .padding(.top, 30)
        .background(Color("WhiteColor"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}



#Preview {
    RegisterFormView(viewModel: RegisterViewViewModel())
}
