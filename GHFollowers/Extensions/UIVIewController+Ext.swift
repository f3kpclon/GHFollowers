//
//  UIVIewController+Ext.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 11-03-21.
//

import UIKit


extension UIViewController {
    func presentGFAlertOnMainThread (title: String, message: String, btnTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(title: title, message: message, btnTitle: btnTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
        
    }
}
