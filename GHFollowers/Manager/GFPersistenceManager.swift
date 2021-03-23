//
//  GFPersistenceManager.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 22-03-21.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}


enum GFPersistenceManager {
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static private let defaults = UserDefaults.standard
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError) -> Void) {
        retrieveFavorites { (result) in
            
            switch result {
            
            case .success(let favorites):
                var retrieveFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrieveFavorites.contains(favorite) else {
                        completed(.existsInFavorite)
                        return
                    }
                    
                    retrieveFavorites.append(favorite)
                    
                case .remove:
                    retrieveFavorites.removeAll { $0.login == favorite.login}
                    }
                completed(save(favorites: favorites)!)
                
            case .failure(let error):
                completed(error)
            }
            
        }
    }
    
    
    static func retrieveFavorites (completed: @escaping (Result<[Follower], GFError>) -> Void ){
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed (.success(favorites))
        } catch {
            completed(.failure(.unableToFavorito))
        }
        
    }
    
    static func save(favorites: [Follower] ) -> GFError? {
                
        do {
            let encoder = JSONEncoder()
            let encodeFavorites = try encoder.encode(favorites)
            defaults.set(encodeFavorites, forKey: Keys.favorites)
            
            return nil
        } catch  {
            return .unableToFavorito
        }
    }
    
}
