//
//  GFItemInfoViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import UIKit

class GFItemInfoViewController: UIViewController {

    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    var user : User!

    init(user: User) {
       super.init(nibName: nil, bundle: nil)
       self.user = user
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgroundView()
        layaoutUI()
        configStackView()
        configActionButton()
    }
     
    

}
extension GFItemInfoViewController {
    
    func configBackgroundView()  {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
     func configStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    func configActionButton()  {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
//    stubbed ya que se hata la logica en nuestra subclase
    @objc func actionButtonTapped()  {}
    
     func layaoutUI()  {
        
        let padding: CGFloat = 20
        view.addSubViews(stackView,actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}



