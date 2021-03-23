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
        static let imgPlaceholder = UIImage(named: "avatar-placeholder")!
        static let logoEmptyState = UIImage(named: "empty-state-logo")!
        
    }
    
    enum SFSymbols {
        static let location = "mappin.and.ellipse"
        static let repos = "folder.badge.person.crop"
        static let gists = "text.alignleft"
        static let followers = "suit.heart"
        static let following = "person.circle"
    }
    enum ItemCaseType {
        case repos, gists, followers, following
    }
}
