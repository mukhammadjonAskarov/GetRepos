//
//  GPUser.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 25/12/20.
//

import Foundation


struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    
}
