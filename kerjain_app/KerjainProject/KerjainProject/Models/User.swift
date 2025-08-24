//
//  User.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 1/8/25.
//

import Foundation

struct User: Codable {
    let id: String
    let fullname: String
    let email: String
    let joined: TimeInterval
}
