//
//  User.swift
//  TapCash
//
//  Created by Adham Samer on 02/05/2023.
//

import Foundation

// MARK: - Users
struct Users : Codable{
    let data: [Datum]?
}

// MARK: - Datum
struct Datum : Codable{
    let token: String?
    var userId: Int?
    var email: String?
    var user: User?
}

// MARK: - User
struct User : Codable{
    let id: Int?
    let name, user_name: String?
    let family: [Family]?
}

// MARK: - Family
struct Family : Codable{
    var user_name, name: String?
    var sponsorId: Int?
}
