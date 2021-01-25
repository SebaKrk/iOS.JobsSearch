//
//  StackOverflowVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit
import WebKit

class StackOverflowVC : UIViewController, WKNavigationDelegate {
    
//    let logoImage : UIImageView = {
//        let image = UIImageView(image: #imageLiteral(resourceName: "stackOverflow"))
//        image.contentMode = .scaleAspectFill
//        return image
//    }()
    
    var webView: WKWebView!
    
    let logoImage : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "stackOverflow"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(handleLogoButton), for: .touchUpInside)
        return button
    }()
    let logoLabel : UILabel = {
        let label = UILabel()
        label.text = "stackOverFlow"
        label.textColor = .black
        label.alpha = 0.89
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    @objc func handleLogoButton() {
        print("press")
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: "https://stackoverflow.com/jobs?q=ios&tl=ios+swift")!
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemOrange.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        setUpLogo()
    }
    
    func setUpLogo() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 10).isActive = true
        logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

// https://stackoverflow.com/jobs?q=ios&tl=ios+swift
