//
//  LoginView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("bg_login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    // Logo + tagline
                    VStack(spacing: 8) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)

                        Text("Manage Time, Not Let It Manage You")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                    }.offset(y: 80)

                    Spacer()

                    // Login form
                    LoginFormView()
                    
                }
            }
        }
        
    }
}


#Preview {
    LoginView()
}
