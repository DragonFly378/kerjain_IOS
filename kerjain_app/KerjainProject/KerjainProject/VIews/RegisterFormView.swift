//
//  RegisterFormView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 3/8/25.
//

import SwiftUI

struct RegisterFormView: View {
    @State private var fullname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 20){
                VStack(spacing:16){
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Fullname")
                            .font(.headline)
                        TextField("Your name here", text: $fullname)
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
                        TextField("Input your email address", text: $email)
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
                        SecureField("Input password", text: $password)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color("WhiteColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
                Button("Register") {
                    // login action
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            

            HStack {
                Text("Already have an account?")
                NavigationLink("login here", destination: LoginView())
            }
            .font(.subheadline)
        }
        .frame(maxWidth: .infinity) // ⬅️ ini wajib agar isi meluas
        .padding(.horizontal)
        .padding(.bottom, 100)
        .padding(.top, 40)
        .background(Color("WhiteColor"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}



#Preview {
    RegisterFormView()
}
