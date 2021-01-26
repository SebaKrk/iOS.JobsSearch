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
    
    let logoButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "binarjobs-logo"), for: .normal)
        button.contentMode = .scaleAspectFill
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
        UIView.animate(withDuration: 1, animations: {
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
        
        let url = URL(string: "https://binarjobs.com/pl/38,14/any/any/1,2/any/any/any#offer-list-box")!
        webView.load(URLRequest(url: url))
    }
    
    func setUpLogo() {
        view.addSubview(logoButton)
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func setUpGradientLayer() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.bjColor().cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
// https://binarjobs.com/pl/38,14/any/any/1,2/any/any/any#offer-list-box
