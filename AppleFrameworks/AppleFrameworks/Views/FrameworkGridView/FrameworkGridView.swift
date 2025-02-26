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
                
                //Scroll View displays items in a scrollable list format
                ScrollView{
                    
                    //Lazy girf only renders items that appear on the screen
                    //columns: argument specifies the number of columns in the VStack
                    LazyVGrid(columns: columns){
                        
                        //To iterate through a list or a hashable item ForEach() is needed
                        ForEach(MockData.frameworks){ framework in // <--This is the name of the variable iterating through
                            FrameworkView(framework: framework)
                                
                                //In this segment I can tell the code ehat ot do when a Framework Item is being clicked
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                }
                //Top level view title in the NavigationView
                .navigationTitle("Apple Frameworks")
                
                
                //Sheet mode is presented when the isPresented: is listening to the changes to the isShowingViewMidel,,  is true which we decied based on viewModelisShowingDetailedView
                //inside the sheet section is the detaild view which we created in a separate file
                .sheet(isPresented: $viewModel.isShowingDetailedView){
                    //Here we pass the selected Framework information into the FrameworkDetailView sheet
                    FrameworkDeatailView(
                        //This happens when the above text is a null value
                        isShowingDetailView: $viewModel.isShowingDetailedView, framework: viewModel.selectedFramework!)
                }
            }
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
