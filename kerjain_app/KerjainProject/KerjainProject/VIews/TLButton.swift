//
//  TLButton.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 3/8/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button(title) {
            // btn action
            action()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(background)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

#Preview {
    TLButton(title:"", background: .blue){
        
    }
}
