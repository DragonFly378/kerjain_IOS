//
//  RegisterView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("bg_register")
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
                        
                        VStack(spacing: 4){
                            Text("Register Now,")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .bold()
                            Text("We’ll Worry About Deadlines Later")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.offset(y: 80)

                    Spacer()

                    // Register form
                    RegisterFormView()
                    
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
