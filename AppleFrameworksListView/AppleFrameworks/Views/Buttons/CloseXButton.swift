//
//  CloseXButton.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 24..
//

import SwiftUI


#Preview {
    //This is needed to spescifie a value for the boolean isSowingDetalView
    CloseXButton(isShowingDetailView: .constant(false))
}


struct CloseXButton: View{
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View{
        HStack{
            Spacer()
            Button{
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.gray))
                    //ImageScale makes the image larger without ditorting the image
                    .imageScale(.large)
                    //This is needed so hitting the X button counts at the frame so it is easier
                    .frame(width:40, height: 40)
            }
            .padding()
        }
    }
}
