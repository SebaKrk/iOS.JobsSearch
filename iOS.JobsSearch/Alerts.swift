//
//  Alerts.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 28/01/2021.
//

import UIKit

struct Alert {
    private static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    static func showInternetAlert(on vc: UIViewController) {
        showAlert(on: vc, with: "Error", message: "Lost internet conecion")
    }
}
