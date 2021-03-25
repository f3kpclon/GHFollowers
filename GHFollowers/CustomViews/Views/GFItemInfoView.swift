//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import UIKit

class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = GFTitleField(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleField(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func configure () {
        addSubViews(symbolImageView,titleLabel ,countLabel)
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleToFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
//            its placed next to the symbolimage
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemCaseType: Constants.ItemCaseType, withCount count : Int)  {
         
        switch itemCaseType {
        case .repos:
            symbolImageView.image = Constants.SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = Constants.SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = Constants.SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image =  Constants.SFSymbols.following
            titleLabel.text = "Folowing"
        }
        
        countLabel.text = String(count)

    }
    
}


