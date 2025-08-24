//
//  LoginView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {                // ganti NavigationView (opsional, lebih modern)
            ZStack {
                GeometryReader { geo in
                    Image("bg_login")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                        .ignoresSafeArea()
                }

                VStack(spacing: 0) {
                    HeaderView(title: "Manage Time, Not Let It Manage You", caption: "")
                    Spacer()
                    LoginFormView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    LoginView()
}
