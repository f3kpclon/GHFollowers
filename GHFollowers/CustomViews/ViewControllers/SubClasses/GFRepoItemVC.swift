//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import UIKit

//subclass of GFItemInfoViewController
class GFRepoItemVC: GFItemInfoViewController {
    
    //    must be weak due to avoid retain cycles
        weak var delegate: GFRepoItemVCDelegate!
    
    init(user: User, delegate: GFRepoItemVCDelegate) {
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

extension GFRepoItemVC {
    
     func configItems() {
        itemInfoViewOne.set(itemCaseType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemCaseType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
        
}
//MARK: PROTOCOL
protocol GFRepoItemVCDelegate: AnyObject {
    func didTapGithubProfile(for user: User)
}
