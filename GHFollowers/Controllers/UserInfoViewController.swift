//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 16-03-21.
//

import UIKit

class UserInfoViewController: UIViewController {

    let headerView = UIView()
    let cardViewOne = UIView()
    let cardViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)

    var username : String!
    weak var delegate : UserInfoVCDelegate!
    var itemViews : [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        getUserInfo()
        layaoutUI()
}
}

extension UserInfoViewController {
    
    func configViewController()  {
        
        view.backgroundColor = .systemBackground
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneBtn
    }
    func getUserInfo()  {
        
        //        network call
                NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
                    guard let self = self else {return}
                    
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {self.configureUIElements(with: user)}
                    case .failure(let error):
                        self.presentGFAlertOnMainThread(title: "Somthing went wrong", message: error.rawValue, btnTitle: "OK")
                    }
                    
                }
            }
            
    
    
    @objc func dismissVC()  {
        dismiss(animated: true)
    }
    
    func layaoutUI()  {
        itemViews = [headerView, cardViewOne, cardViewTwo,dateLabel]
        
        let padding : CGFloat = 20
        let cardHeight : CGFloat = 140
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: padding),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            cardViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            cardViewOne.heightAnchor.constraint(equalToConstant: cardHeight),
            
            cardViewTwo.topAnchor.constraint(equalTo: cardViewOne.bottomAnchor, constant: padding),
            cardViewTwo.heightAnchor.constraint(equalToConstant: cardHeight),
            
            dateLabel.topAnchor.constraint(equalTo: cardViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
    
    func add(childVC: UIViewController,to containerView: UIView)  {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func configureUIElements(with user: User)  {

        let repoItemVC = GFRepoItemVC(user: user, delegate: self)
        
        let followerItemVC = GFFollowerItemVC(user: user, delegate: self)
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.cardViewOne)
        self.add(childVC: followerItemVC, to: self.cardViewTwo)
        self.dateLabel.text = "Github since \(user.createdAt.convertToDisplayFormat())"
    }
}

extension UserInfoViewController: GFRepoItemVCDelegate{
    
    func didTapGithubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl ) else
        { presentGFAlertOnMainThread(title: "Invalid URL", message: "The url is invalid", btnTitle: "OK"); return }
        presentSafariVC(with: url)
    }
}

extension UserInfoViewController: GFFollowerItemVCDelegate {
    func didTapGetFollowers(for user : User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers", btnTitle: "OK")
            return
        }
        delegate.didRequestFollower(for: user.login)
        dismissVC()
    }
}

protocol UserInfoVCDelegate: AnyObject {
    func didRequestFollower(for username: String)
}

