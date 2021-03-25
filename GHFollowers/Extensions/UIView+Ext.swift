//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 24-03-21.
//



import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
