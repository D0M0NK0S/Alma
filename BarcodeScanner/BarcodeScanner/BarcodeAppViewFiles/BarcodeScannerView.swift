//
//  BarcodeScannerView.swift
//  BarcodeScanner
//
//  Created by Domonkos Kenesi on 2025. 02. 24..
//

import SwiftUI

struct BarcodeScannerView: View {
    
    //This is a variable conatining the stuff from the BarcodScannerViewModel file
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                ScannerView(scannedCode : $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    //. infinity at width sets the width the maximum possible value
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                //Create a spacer with custom height/width
                Spacer()
                    .frame(height: 80)
                
                //Similar to text but it contains a string and an image(GOOD FOR IMAGE AND STRING H STACK DISPLAYS)
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                //Check if the scannedCode variable is empty if it is print Not yet Scannes and if it is not empty print our the scannedCode
                Text(viewModel.statusText)
                    .foregroundColor(viewModel.statusTextColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            
            //Createing an error alert
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
