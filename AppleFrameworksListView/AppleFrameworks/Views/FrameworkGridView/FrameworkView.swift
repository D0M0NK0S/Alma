//
//  FrameworkView.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 24..
//

import SwiftUI

struct FrameworkView: View{
    
    //One variable is enough becuse we defined imageName and name in the Framework file
    let framework: Framework
    
    var body: some View{
        HStack{
            Image(framework.imageName)
                //Always put resizable first and then the rest of the image modifiers
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                //Makes the text dynamic to the size of the display
                .scaledToFit()
                //Makes a minimum boundry for the text so it can not shrink to infinity
                .minimumScaleFactor(0.6)
                .padding()
        }
    }
}
#Preview {
    FrameworkView(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}
