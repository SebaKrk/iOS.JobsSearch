//
//  StackOverflowVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit

class StackOverflowVC : UIViewController {
    
    let logoImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "stackOverflow"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let logoLabel : UILabel = {
        let label = UILabel()
        label.text = "stackOverFlow"
        label.textColor = .black
        label.alpha = 0.89
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    
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
