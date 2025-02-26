//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 22..
//

import SwiftUI

struct FrameworkGridView: View {
    
    //StateObject similar to state(remains consistant while the Views keep getting destroyed and renewed)
    @StateObject var viewModel = FrameworkGridViewModel()
    
    //Makes a coulmn variable GidItem.flexible() flexible to stretch along the whole screen
    //Number of GridItems will determine the number of columns (This case there are three grid items => there will be three columns)
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        
        //Navigation controller: Holds an array of viewcontrollers
        NavigationView{
            
            
            //Creates a List view which has already an implemented scroll view,
            //built in tap gesture
            List {
                
                //To iterate through a list or a hashable item ForEach() is needed
                ForEach(MockData.frameworks){ framework in // <--This is the name of the variable iterating through
                    
                    //This is need for the list view as a destination for the on click event
                    NavigationLink(destination: FrameworkDeatailView(isShowingDetailView: $viewModel.isShowingDetailedView, framework: framework)){
                        FrameworkView(framework: framework)
                    }
                }
            }
            
            //Top level view title in the NavigationView
            .navigationTitle("Apple Frameworks")
        }
        //.label Color will adjust the color to the dark/light mode the user has on the phone
        .accentColor(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
    
}



struct backgroundView: View{
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [.black, Color("darkPurple")]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            .ignoresSafeArea()
    }
}
