//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import UIKit

class GFFollowerItemVC: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configItems()
        
    }
    
    
}

extension GFFollowerItemVC {
    
     func configItems() {
        itemInfoViewOne.set(itemCaseType: .followers , withCount: user.followers)
        itemInfoViewTwo.set(itemCaseType: .following , withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
