//
//  NoFluffJobsVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit
import WebKit

class NoFluffJobsVC : UIViewController,WKNavigationDelegate {
    
    var webView: WKWebView!
    let background = UIColor(displayP3Red: 63/255, green: 195/255, blue: 233/255, alpha: 1)
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = background
        
        let url = URL(string: "https://nofluffjobs.com/pl/jobs/swift?criteria=seniority%3Dtrainee,junior")!
        webView.load(URLRequest(url: url))
        
    }
}
