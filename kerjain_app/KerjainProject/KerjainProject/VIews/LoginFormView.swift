//
//  LoginFormView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 3/8/25.
//

import SwiftUI

struct LoginFormView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 20){
                VStack(spacing:16){
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                            .font(.headline)
                        TextField("Input your email address", text: $email)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color("WhiteColor"))
                            .autocapitalization(.none)
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
                Button("Login") {
                    // login action
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            

            HStack {
                Text("Don’t have an account?")
                NavigationLink("register here", destination: RegisterView())
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

// MARK: - Corner Radius Extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = 10.0
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    LoginFormView()
}
