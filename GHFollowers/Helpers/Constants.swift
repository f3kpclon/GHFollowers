//
//  Constants.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 12-03-21.
//

import Foundation
import UIKit
struct Constants {
    
    struct GHUrl {
        
        static let apiUrl = "https://api.github.com"
    }
    
    struct Image {
        static let imgPlaceholder = UIImage(named: "avatar-placeholder")
        static let logoEmptyState = UIImage(named: "empty-state-logo")
        static let emptyState = UIImage(named: "gh-logo")
        
    }
    
    enum SFSymbols {
        static let location = UIImage(systemName: "mappin.and.ellipse")
        static let repos = UIImage(systemName:"folder.badge.person.crop")
        static let gists = UIImage(systemName:"text.alignleft")
        static let followers = UIImage(systemName:"suit.heart")
        static let following = UIImage(systemName:"person.circle")
    }
    enum ItemCaseType {
        case repos, gists, followers, following
    }
}
