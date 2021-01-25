//
//  Extension.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 25/01/2021.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func nfjColor() -> UIColor {
        return UIColor.rgb(red: 63, green: 195, blue: 233)
    }
    static func bjColor() -> UIColor {
        return UIColor.rgb(red: 246, green: 85, blue: 5)

    }
}
