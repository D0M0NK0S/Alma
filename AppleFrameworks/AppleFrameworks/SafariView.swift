//
//  SafariView.swift
//  AppleFrameworks
//
//  Created by Domonkos Kenesi on 2025. 02. 23..
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL

    //Creates an automatic SafariView from UIKit
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        
        SFSafariViewController(url: url)
    }
    
    //Needed to update the existing safari view
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
