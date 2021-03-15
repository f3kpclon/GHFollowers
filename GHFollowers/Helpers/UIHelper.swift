//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 15-03-21.
//

import UIKit

struct UIHelper {
   
    static func createThreeColumnFlowLayout(in view : UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimunItemSpacing: CGFloat = 10
        
        let availableWidth = width - (padding * 2) - (minimunItemSpacing * 2)
        let itemWidth      = availableWidth / 3
        
        
        let flowLayaout    = UICollectionViewFlowLayout()
        flowLayaout.sectionInset   = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayaout.itemSize       = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayaout
    }
}
