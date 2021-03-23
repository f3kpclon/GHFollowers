//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import UIKit

//subclass of GFItemInfoViewController
class GFRepoItemVC: GFItemInfoViewController {
    
    
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
