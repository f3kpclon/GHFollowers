//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import UIKit

class GFFollowerItemVC: GFItemInfoViewController {
    
    //    must be weak due to avoid retain cycles
    weak var delegate: GFFollowerItemVCDelegate!
    
    init(user: User, delegate: GFFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

//MARK: PROTOCOL
protocol GFFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
    
}
