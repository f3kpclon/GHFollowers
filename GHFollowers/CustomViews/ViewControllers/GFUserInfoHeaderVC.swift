//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 18-03-21.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avatarImgView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleField(textAlignment: .left, fontSize: 34)
    let nameLAbel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImgView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user : User!
    
    init(user : User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViewsUI()
        layaoutUUI()
        configUIElements()
    }
    
}

extension GFUserInfoHeaderVC {
    
    
    func configUIElements()  {
        downloadImage()
        usernameLabel.text = user.login
        nameLAbel.text = user.name ?? "N/A"
        locationLabel.text = user.location ?? "N/A"
        bioLabel.text = user.bio ?? "N/A"
        bioLabel.numberOfLines = 3
        
//        location image
        locationImgView.image = Constants.SFSymbols.location
        locationImgView.tintColor = .secondaryLabel
    }
    func downloadImage()  {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let  self = self else {return}
            
            DispatchQueue.main.async {
                self.avatarImgView.image = image
            }
        }
    }
    func addSubViewsUI()  {
        view.addSubViews(avatarImgView,
                         usernameLabel,
                         nameLAbel,
                         locationLabel,
                         locationImgView,
                         bioLabel)
    }
    
    func layaoutUUI() {
        let textImagePadding: CGFloat   = 12
        locationImgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImgView.topAnchor.constraint(equalTo: view.topAnchor),
            avatarImgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImgView.widthAnchor.constraint(equalToConstant: 90),
            avatarImgView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImgView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLAbel.centerYAnchor.constraint(equalTo: avatarImgView.centerYAnchor, constant: 8),
            nameLAbel.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor, constant: textImagePadding),
            nameLAbel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLAbel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImgView.bottomAnchor.constraint(equalTo: avatarImgView.bottomAnchor),
            locationImgView.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor, constant: textImagePadding),
            locationImgView.widthAnchor.constraint(equalToConstant: 20),
            locationImgView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImgView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImgView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImgView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImgView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
    }
    
}
