//
//  User.swift
//  TapCash
//
//  Created by Adham Samer on 02/05/2023.
//

import Foundation

// MARK: - Users
struct Users {
    let data: [Datum]
    let token: String
}

// MARK: - Datum
struct Datum {
    let userId: Int
    let email: String
    let user: User
}

// MARK: - User
struct User {
    let id: Int
    let name, userName: String
    let family: [Family]
}

// MARK: - Family
struct Family {
    let userName, name: String
    let sponsorId: Int
}
