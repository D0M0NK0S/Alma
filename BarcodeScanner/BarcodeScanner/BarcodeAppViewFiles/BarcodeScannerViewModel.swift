//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Domonkos Kenesi on 2025. 02. 25..
//
import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    //Create an empty string scannedCode state variable so it wont be rerendered and destoyed with the other view elements
    //Published var becuse we want other stuff to read these variables and broadcast them
    @Published  var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    //This will be a single text or the scanned barcode stored in a variable statusText
    var statusText: String{
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color{
        return scannedCode.isEmpty ? .red : .green
    }
}
