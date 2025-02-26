//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Domonkos Kenesi on 2025. 02. 24..
//

import Foundation
import AVFoundation
import UIKit


//Here we create the optional errors I will use during the code to send back as a message if an error occurs
enum CameraError{
    case invalidDeviceInput
    case invaildScanValue
}



protocol ScannerVCDelegate: class {
    //This func check if a barcode is find or not
    func didFind(barcode: String)
    
    //This function happens when there is an error found
    func didSurface(error: CameraError)
}


//Final class if we wil not subclass this class in the project
final class ScannerVC: UIViewController{
    
    let captureSession = AVCaptureSession()
    //This contains what the camera see -> this will be displayed in the rectangle
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    //This is self.scannerDelegate
    weak var scannerDelegate: ScannerVCDelegate!
    
    init(scannerDelegate: ScannerVCDelegate){
        
        super.init(nibName: nil, bundle: nil)
        //self.scannerDelegate means the scannerDelegate in this file defined above
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        
        //Error if previewLayer is not existant
        guard let previewLayer = previewLayer else { scannerDelegate?.didSurface(error: .invalidDeviceInput); return }
        
        previewLayer.frame = view.layer.bounds
    }
    
    
    //this is the main function where we set up the camera, looking for the barcode
    private func setupCaptureSession(){
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else{
            
            //Send back the error with the function didSurface
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch{
            //Send back the error with the function didSurface
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        }else{
            
            //Send back the error with the function didSurface
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        //This checks if te capture session is valid and good
        if captureSession.canAddOutput(metaDataOutput){
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            //Set the type of data that i want to scan
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        }else{
            
            //Send back the error with the function didSurface
            scannerDelegate.didSurface(error: .invaildScanValue)
            return
        }
        
        
        //[[[ This block is the setup of the previewLayer
        //We set the previewLayer to the previusly checl captureSession
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        //This makes sure the video will fill the container but it will keep it aspect ratio !!!!
        // ! means force unwrap => it will use the data without checkin if it is a nill value(crashed the app) --> this is okay becuse we check before and we jsut created the previreLayer above
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        //]]]
        
        //this starts the captureSession
        captureSession.startRunning()
    }
}

//Conforming the delegate => delegates pass the action to the SwiftUI
//This is what happens when we scan a barcode
extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        
        //Guard let/var creates an object with an else statemen to avoid neseted checks and early returns => an else statement should always exist
        
        
        
        //We take the first element of the list that the barcode search found
        guard let object = metadataObjects.first else{
            scannerDelegate?.didSurface(error: .invaildScanValue)
            return
        }
        
        //We interpret the data object == the first elment of the list
        guard let machineReadableCodeObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurface(error: .invaildScanValue)
            return
        }
        
        //We take the string element of the interpretation above
        guard let barcode = machineReadableCodeObject.stringValue else {
            scannerDelegate?.didSurface(error: .invaildScanValue)
            return
        }
        
        
        //this sends the result to the delegate which will send it to SwiftUI
        scannerDelegate?.didFind(barcode: barcode)
    }
}
