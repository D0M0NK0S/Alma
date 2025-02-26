//
//  weatherButton.swift
//  weather_app
//
//  Created by Domonkos Kenesi on 2025. 02. 21..
//

import Foundation
import SwiftUI

//Construct the button text at the bottom
struct weatherButton: View{
    
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View{
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
