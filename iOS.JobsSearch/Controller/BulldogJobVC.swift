//
//  BulldogJobVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
  
import UIKit
import WebKit

class BulldogJobVC: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
        
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  .systemPurple
        
        let url = URL(string: "https://bulldogjob.pl/companies/jobs/s/experience_level,junior/skills,Swift")!
        webView.load(URLRequest(url: url))
        
        
    }
}

//https://bulldogjob.pl/companies/jobs/s/experience_level,junior/skills,Swift
