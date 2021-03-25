//
//  FavoriteCel.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 23-03-21.
//

import UIKit

class FavoriteCell: UITableViewCell {

    static let reuseID = "FavoriteCell"
    let avatarImage = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleField(textAlignment: .left , fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FavoriteCell {
    
    private func configure() {
        addSubviewUI()
        setConstraints()
        
    }
    
    private func addSubviewUI() {
        addSubViews(avatarImage,usernameLabel )
        accessoryType = .disclosureIndicator
    }
    
    private func setConstraints() {
        let padding : CGFloat = 12

        NSLayoutConstraint.activate([
            avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImage.heightAnchor.constraint(equalToConstant: 60),
            avatarImage.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])

    }
    func set(favorite : Follower)  {
        usernameLabel.text = favorite.login
        downloadImage(for: favorite.avatarUrl)
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
