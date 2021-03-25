//
//  FavoritesListViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 23-03-21.
//

import UIKit

class FavoritesListViewController: GFDataLoadingVC {

    let tableView = UITableView()
    var favorites: [Follower] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavortes()
        
    }
    
}

extension FavoritesListViewController {
    
    func configureViewController()  {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFavortes()  {
        
        GFPersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success (let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No favorites??\nAdd one on the follower screen", in: self.view)
                }else{
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, btnTitle: "OK!")
            }
            
        }
    }
    
    func configureTableView()  {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeExcessCells()
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
}


extension FavoritesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC = FollowerListViewController()
        
        destVC.username = favorite.login
        destVC.title = favorite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        GFPersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else {return}
            
            guard let error = error else {
                
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
                
            }
            
            self.presentGFAlertOnMainThread(title: "unable to remove", message: error.rawValue, btnTitle: "OK!!")
        }
        
        
    }
}
