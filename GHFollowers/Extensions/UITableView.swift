//
//  UITableView.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 25-03-21.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread()  {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    func removeExcessCells()  {
        tableFooterView = UIView(frame: .zero)
    }
}
