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
    
    var logoImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "binarjobs-logo"))
        image.contentMode = .scaleToFill
        return image
    }()
    
    let logoButton : UIButton = {
        let button = UIButton()
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
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: "https://binarjobs.com/pl/38,14/any/any/1,2/any/any/any#offer-list-box")!
        webView.load(URLRequest(url: url))
    }
    
    func setUpLogo() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        view.addSubview(logoButton)
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
    }
    
    func setUpGradientLayer() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.bjColor().cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
// https://binarjobs.com/pl/38,14/any/any/1,2/any/any/any#offer-list-box
