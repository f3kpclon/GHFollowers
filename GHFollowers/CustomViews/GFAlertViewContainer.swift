//
//  GFAlertViewContainer.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 11-03-21.
//

import UIKit

class GFAlertViewContainer: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }

}
