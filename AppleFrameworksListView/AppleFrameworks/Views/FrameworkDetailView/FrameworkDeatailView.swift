//
//  FrameworkDeatailView.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 22..
//

import SwiftUI

struct FrameworkDeatailView: View {
    
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView: Bool = false
    var framework: Framework
    
    var body: some View {
        ZStack{
            
            
            
            VStack{

                //This is needed to push the middle stuff down from the top because the bottom spacer pushes these up
                Spacer()
                FrameworkView(framework: framework)
                Spacer()
                Text(framework.description)
                    .font(.body)
                    .padding()
                
                //This is needed to separate the button from the text
                //BUT THIS BUTTON ALSO PUSHES ELEMENT TO THE TOP THAT IS WHY I NEED A SPACER AT THE TOP TOO
                
                Spacer()
                
                Button{
                    isShowingSafariView = true
                }label: {
                    
                    //Generally this is what the button look like what is in the label not what is in the button segment
                    //The button segment is only needed to tell the script what happens whent the button is pushed
                    AppleFrameworksButton(title: "Learn More")
                }
            }
            //Takes the user to a full screen safari view created in SafariView file
            .fullScreenCover(isPresented: $isShowingSafariView, content: {SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
            })
        }
        
    }
}

#Preview {
    //this is needed to provide a sample data for the privew to work with
    FrameworkDeatailView(isShowingDetailView: .constant(false), framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}
