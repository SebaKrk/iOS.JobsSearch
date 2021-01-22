//
//  BinarJobsVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit
import WebKit

class BinarJobsVC: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
        
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  .systemPurple
        
        let url = URL(string: "https://binarjobs.com/pl/38,14/any/any/1,2/any/any/any#offer-list-box")!
        webView.load(URLRequest(url: url))
        
        
    }
}
