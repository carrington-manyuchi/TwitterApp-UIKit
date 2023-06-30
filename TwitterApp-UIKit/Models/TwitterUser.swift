//
//  TwitterUser.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/30.
//

import Foundation
import Firebase

struct TwitterUser: Codable {
    
    let id: String
    var displayName: String = ""
    var username: String = ""
    var followersCount: Double = 0
    var followingCount: Double = 0
    var createdOn: Date = Date()
    var bio: String = ""
    var avatarPath: String = ""
    var isUserOnBoard: Bool = false
    
    init(from user: User) {
        self.id = user.uid
    }
    
}
