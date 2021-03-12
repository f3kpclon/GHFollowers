//
//  FavsListViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 10-03-21.
//

import UIKit

class FavsListViewController: UIViewController {
    
    var userName : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }
  

}
