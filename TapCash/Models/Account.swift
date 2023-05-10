//
//  Account.swift
//  TapCash
//
//  Created by Mahmoud on 10/05/2023.
//

import Foundation
struct Welcome: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let account: [Account]?
    let token: String?
}

// MARK: - Account
struct Account: Codable {
    let userID: Int?
    let email: String?
    let user: User?

}

// MARK: - passCodeResonse
struct PassCodeResponse :Codable{
    var data : [UserPass]?
    var errors : String?
}
struct UserPass : Codable{
    var user : [Userss]?
    var token :String?
}
struct Userss : Codable{
    var user_name : String?
    var phone_number : String?
    var name : String?
}
