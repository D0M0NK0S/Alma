//
//  ContentView.swift
//  weather_app
//
//  Created by Domonkos Kenesi on 2025. 02. 21..
//

import SwiftUI

struct ContentView: View {
    
    //Stuff in struct is constantly changeing and getting destroyed that is why @State is need to prevent destruction and have a constant variable
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            

            backgroundView(isNight: isNight)
            
            VStack{
                
                cityTextView(CityName: "Cupertino, CA")
                
                mainWeatherStatus(weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: "38 C")
                
                
                HStack(spacing: 20){
                    //Using the defined WatherDayView structer from the bottom of the file
                    WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temp: 37)
                    WeatherDayView(day: "WED", imageName: isNight ? "moon.fill" : "sun.max.fill", temp: 37)
                    WeatherDayView(day: "THU", imageName: "wind.snow", temp: 37)
                    WeatherDayView(day: "FRI", imageName: "sunset.fill", temp: 37)
                    WeatherDayView(day: "SAT", imageName: "cloud.rain.fill", temp: 37)
                    
                    
                }
                 
                Spacer()
                
                //When button is clicked it toggles(changes) to the opposite(true/false)
                Button{
                    isNight.toggle()
                } label:{
                    weatherButton(buttonText: "Change day time", backgroundColor: isNight ? .white : .mint, textColor: isNight ? .blue : .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}



struct WeatherDayView: View {
    
    //Create variables for easier, customizable usage
    var day: String
    var imageName: String
    var temp: Int
    
    //Construct the general view
    var body: some View {
        VStack{
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 23, weight: . medium, design: .default))
            Image(systemName: imageName)
                //Makeing the rendering mode customizable with .palette
                .symbolRenderingMode(.palette)
                //Add resizeable BEFORE modifing the color os a symbol
                .resizable()
                //Setting the base colors of the symbol
                .foregroundStyle(.mint, .orange, .teal)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp) C") // string interpletation for the in to be displayed
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}


//Code the custom linear gradient
struct backgroundView: View {
    

    var isNight: Bool
    
    var body: some View {
        //isNight ? .black : .blue means if isNight True it uses black and if it is false it uses blue
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightpurple")]), startPoint:.topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


// Constructing the City name at the top of the screen
struct cityTextView: View{
    
    var CityName: String
    
    var body: some View{
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

//Main weather view construct
struct mainWeatherStatus: View{
    
    var weatherImage: String
    var temperature: String
    
    var body: some View{
        VStack(spacing: 8){
            
            //Improting and displaying an SF Symbol
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height: 180)
        
            Text(temperature)
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 80)
    }
}


