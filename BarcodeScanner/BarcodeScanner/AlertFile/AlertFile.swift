//
//  AlertFile.swift
//  BarcodeScanner
//
//  Created by Domonkos Kenesi on 2025. 02. 25..
//

import Foundation
import SwiftUI


struct AlertItem: Identifiable{
    
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}




//Creating the alert actions
struct AlertContext{
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera",
                                              dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type",
                                              message: "Couldnt scan the barcode",
                                              dismissButton: .default(Text("OK")))
    
}
