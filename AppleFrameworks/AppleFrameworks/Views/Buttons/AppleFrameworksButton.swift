//
//  AppleFrameworksButton.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 22..
//

import SwiftUI

struct AppleFrameworksButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 280, height: 80)
            .background(Color(.red).gradient)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    AppleFrameworksButton(title: "Hello")
        .preferredColorScheme(.dark)
}



