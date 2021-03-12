//
//  SerachViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 09-03-21.
//

import UIKit

class SerachViewController: UIViewController {

//    Best way is to initialize accord to the orden of call
    let logoImageView = UIImageView()
    let userNameTxtField = GFTextField()
    let callActionBtn = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered: Bool {return !userNameTxtField.text!.isEmpty}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configLogoImageView()
        configTextField()
        configCallBtn()
        createKeyboardTapGesture()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

}

private extension SerachViewController {
    
    @objc func pushFollowerListVC() {
        
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty UserName", message: "Please enter a username 👀", btnTitle: "OK")
            return
        }
        let followersListVC = FavsListViewController()
        followersListVC.userName = userNameTxtField.text
        followersListVC.title    = userNameTxtField.text
        navigationController?.pushViewController(followersListVC, animated: true)
        
    }
    
    func createKeyboardTapGesture()  {
        let tapped = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapped)
    }
    
    
    func configLogoImageView()  {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
//            most of the time we will need four constraint
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        
        ])
    }
    func configTextField()  {
        view.addSubview(userNameTxtField)
//      comunication between controller n delegate
        userNameTxtField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTxtField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48 ),
//            pinned to the extremes
            userNameTxtField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTxtField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTxtField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configCallBtn()  {
        view.addSubview(callActionBtn)
        
        callActionBtn.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callActionBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callActionBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callActionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callActionBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SerachViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
    
}
