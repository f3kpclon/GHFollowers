//
//  GFAlertViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 11-03-21.
//

import UIKit

class GFAlertViewController: UIViewController {
    
    let containerView = GFAlertViewContainer()
    let titleLabel = GFTitleField(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionBtn = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle : String?
    var message : String?
    var btnTitle : String?
    var padding : CGFloat = 20
    
    
    init(title: String, message: String, btnTitle : String) {
//        init viewController
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        self.btnTitle = btnTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configContainerAlertVC()
        configTitleLabel()
        configActionBtn()
        configMessageLabel()
        
    }
  
}

private extension GFAlertViewController {
    
    func configContainerAlertVC()   {
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 200)
    
        ])
        
    }
    
    func configTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Somthing went wrong"
//        Constraints for labels
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configActionBtn()  {
        containerView.addSubview(actionBtn)
        actionBtn.setTitle(btnTitle ?? "OK", for: .normal)
        actionBtn.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configMessageLabel () {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionBtn.topAnchor, constant: -12)
        
        ])
    }
    
    @objc func dismissVC () {
        dismiss(animated: true)
    }
}
