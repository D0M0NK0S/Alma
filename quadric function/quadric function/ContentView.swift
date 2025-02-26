//
//  ContentView.swift
//  quadric function
//
//  Created by Domonkos Kenesi on 2023. 04. 29..
//

import SwiftUI



struct ContentView: View {
    @State private var a: Float = 0
    @State private var b: Float = 0
    @State private var c: Float = 0
    @State private var resultx: String = ""
    @State private var resultx2: String = ""
    @State public var b2: Float = 0
    func calculation(){
        if b*b - 4*a*c < 0{
            resultx = "There are no results"
            resultx2 = ""
        }
        else{
            
            resultx = String((-b + (pow(b,2) - 4*a*c).squareRoot())/(2*a))
            
            resultx2 = String((-b - (pow(b,2) - 4*a*c).squareRoot())/(2*a))
        }
    }	
    
    
    
    struct OvalTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [Color("textboxColor"), Color("textboxColorTo")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
        }
    }
    var body: some View {
        
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack {

                Text("Quadratic function solver")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("TextColor"))
                HStack{
                    Text("aX2")
                        .font(.title3)
                        .padding(20)
                        .foregroundColor(Color("TextColor"))
                    TextField("Enter a number here", value: $a, format:.number)
                        .textFieldStyle(OvalTextFieldStyle())
                }
                HStack{
                    Text("bX")
                        .font(.title3)
                        .padding(24)
                        .foregroundColor(Color("TextColor"))
                    TextField("Enter a number here", value: $b, format:.number)
                        .textFieldStyle(OvalTextFieldStyle())
                }
                HStack{
                    Text("c")
                        .font(.title3)
                        .padding(31)
                        .foregroundColor(Color("TextColor"))
                    TextField("Enter a number here", value: $c, format:.number) 
                        .textFieldStyle(OvalTextFieldStyle())
                }
                HStack{
                    Text("The results are:")
                        .font(.title)
                        .padding(10)
                        .foregroundColor(Color("TextColor"))
                    Text( resultx)
                        .foregroundColor(Color("TextColor"))
                    Text(resultx2)
                        .foregroundColor(Color("TextColor"))
                }
                Button(action: {calculation()}){
                    Text("Calc")
                        .font(.title2)
                        
                        .padding(14.0)
                        .padding(.horizontal, 18.0)
                        .foregroundColor(Color("TextColor"))
                        
                        
                }
                
                .background(Color("textboxColor"))
                .cornerRadius(25)
                
                
                    
                
                
            }
        }
        

    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
