//
//  HeaderView.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 3/8/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let caption: String
    
    
    var body: some View {
        // Logo + tagline
        VStack(spacing: 8) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            
            VStack(spacing: 4){
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                Text(caption)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    
            }
        }.offset(y: 80)
    }
}

#Preview {
    HeaderView(title:"", caption:"")
}
