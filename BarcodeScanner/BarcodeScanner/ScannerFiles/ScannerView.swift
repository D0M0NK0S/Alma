//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Domonkos Kenesi on 2025. 02. 24..
//

import SwiftUI



//Creating the reciver of the ScannerVC broadcast
struct ScannerView: UIViewControllerRepresentable {
    
    //Make a binding variable for the BarcodeScannerView code
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    //We create here the coordinator that listens to the ScannerVCDelegate
    func makeCoordinator() -> Coordinator {
        //This is the coordantor create bleow the three functions
        Coordinator(scannerView: self)
    }
    
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
    }
    
    
    //This is the part that listens to the delegate from ScannerVC
    final class Coordinator: NSObject, ScannerVCDelegate{
        
        private let scannerView: ScannerView
        
        //We initialse a scannerView and pass the ScannerView property inside it
        init(scannerView: ScannerView){
            self.scannerView = scannerView
        }
        
        //These are the functions set up in the ScannerVC.ScannerVCDelegate
        func didFind(barcode: String) {
            //Make the scannedCode Binded variable equal to the barcode we scan
            scannerView.scannedCode = barcode
        }
        
        //This will update the erroe type in BarcodeScannerView
        func didSurface(error: CameraError) {
            
            //This section checks the different defined error types in CameraError
            switch error{
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invaildScanValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}
