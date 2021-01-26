//
//  FaceBookVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit
import WebKit

class FaceBookVC :
    UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    let logoButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "facebookjobs-logo"), for: .normal)
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(handleLogoButton), for: .touchUpInside)
        return button
    }()
    
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  .white
        setUpLogo()
//        setUpGradientLayer()
    }
    
    @objc func handleLogoButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.logoButton.alpha = 0
        }, completion: { done in
            if done {
                self.setupWebView()
            }
        })
    }
     
    func setupWebView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: "https://www.facebook.com/groups/1427710550830058/about")!
        webView.load(URLRequest(url: url))
    }
    
    func setUpLogo() {
   
        view.addSubview(logoButton)
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setUpGradientLayer() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

