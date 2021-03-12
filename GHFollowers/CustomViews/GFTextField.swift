//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 10-03-21.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure () {
        translatesAutoresizingMaskIntoConstraints = false
       
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        //white in light mode, black in dark mode
        textColor = .label
        
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        
//        //for adjust the textfield
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        keyboardType = .default
        keyboardAppearance = .dark
        returnKeyType = .go
        placeholder = "Enter a username"
        
    }
}
