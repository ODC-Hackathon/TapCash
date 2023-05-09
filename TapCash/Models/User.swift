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
    let token: String?
}

// MARK: - Datum
struct Datum : Codable{
    var userId: Int?
    var email: String?
    var user: User?
}

// MARK: - User
struct User : Codable{
    let id: Int?
    let name, userName: String?
    let family: [Family]?
}

// MARK: - Family
struct Family : Codable{
    var userName, name: String?
    var sponsorId: Int?
}
