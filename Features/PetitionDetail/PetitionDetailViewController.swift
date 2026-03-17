//
//  DetailViewController.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 17/03/26.
//

import UIKit
import WebKit

final class PetitionDetailViewController: UIViewController {
    
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
        
        let html = PetitionHTMLBuilder.makeHTML(for: petition)
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}


