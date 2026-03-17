//
//  DetailViewController.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 17/03/26.
//

import UIKit
import WebKit

final class DetailViewController: UIViewController {
    
    private var webView: WKWebView!
    
    var petition: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContent()
    }
    
    private func loadContent() {
        guard let petition = petition else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body { font-size: 150%; }
        h1 { font-size: 180%; }
        </style>
        </head>
        <body>
        <h1>\(petition.title)</h1>
        <p>\(petition.body)</p>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}


