//
//  StackOverflowVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

//let image = UIImage(named: "image_name")
//let button = UIButton(type: UIButton.ButtonType.custom)
//button.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
//button.setImage(image, for: .normal)
//button.addTarget(self, action: #selector(function), for: .touchUpInside)


import UIKit
import WebKit

class StackOverflowVC : UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    let logoButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "stackoverflow-logo"), for: .normal)
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(handleLogoButton), for: .touchUpInside)
        return button
    }()
    
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLogo()
        setUpGradientLayer()
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
        webView.center = view.center
        view = webView
        
        let url = URL(string: "https://stackoverflow.com/jobs?q=ios&tl=ios+swift")!
        webView.load(URLRequest(url: url))
    }
    
    func setUpLogo() {
        view.addSubview(logoButton)
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func setUpGradientLayer() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemOrange.cgColor, UIColor.darkGray.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

// https://stackoverflow.com/jobs?q=ios&tl=ios+swiftr
