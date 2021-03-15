//
//  FavoritesListViewController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 09-03-21.
//

import UIKit

class FavoritesListViewController: UIViewController {
    
    enum Section {case main }
    var followers : [Follower] = []
    var collectionView : UICollectionView!
    var dataSource : UICollectionViewDiffableDataSource<Section,Follower>!
    var userName : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configCollectionView()
        getFollowers()
        configDataSource()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
}

private extension FavoritesListViewController {
   
    func configViewController()  {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configCollectionView()  {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
    }
    
    func getFollowers()  {
        NetworkManager.shared.getFollowers(username: userName, page: 1) {[weak self] (result) in
            
            guard let self = self else { return }
            switch result {
            
            case .success(let followers):
                self.followers = followers
                self.updateData()
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something wrong", message: error.rawValue, btnTitle: "OK")
            }
        }
    }
    
    func configDataSource()  {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell    = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData()  {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Follower>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}
