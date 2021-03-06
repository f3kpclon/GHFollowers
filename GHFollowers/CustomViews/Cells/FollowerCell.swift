//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 12-03-21.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let avatarImage = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleField(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubViews(avatarImage,usernameLabel)
        setConstraints()
        
    }
    
    private func setConstraints(){
        let padding : CGFloat = 8
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
    func set(follower : Follower)  {
        usernameLabel.text = follower.login
        downloadImage(for: follower.avatarUrl)
    }
    func downloadImage(for avatarString: String)  {
        NetworkManager.shared.downloadImage(from: avatarString) { [weak self] image in
            guard let  self = self else {return}
            
            DispatchQueue.main.async {
                self.avatarImage.image = image
            }
        }
    }

}
