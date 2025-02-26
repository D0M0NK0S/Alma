//
//  FrameworkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 22..
//

import SwiftUI


// Create a class
//Observable Object needed to broadcast its changes
final class FrameworkGridViewModel: ObservableObject {
    
    //This contains the selected framewrok infromations
    var selectedFramework: Framework?{
        
        //This happens when we selec a framework
        didSet{
            isShowingDetailedView = true
        }
    }
    
    
    //This is the stuff that the class publishes
    //Need a @Published infront od the variable that is needed to be published
    @Published var isShowingDetailedView = false
}


