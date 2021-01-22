//
//  FaceBookVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit
import WebKit

class FaceBookVC : UIViewController,WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        let url = URL(string: "https://www.facebook.com/groups/1427710550830058/about")!
        webView.load(URLRequest(url: url))
        
    }
}
