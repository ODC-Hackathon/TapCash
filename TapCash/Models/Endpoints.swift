//
//  Endpoints.swift
//  TapCash
//
//  Created by Adham Samer on 09/05/2023.
//

import Foundation
var baseUrl: String = "http://127.0.0.1:8000/api"
enum Endpoints {
    case register
    case login
    case forgetPW
    case getProfiles
    case sendMoney
    var path: String {
        switch self {
            case .register:
                return "\(baseUrl)/register"
            case .login:
                return "\(baseUrl)/login"
            case .forgetPW:
                return "\(baseUrl)/password/reset"
            case .getProfiles:
                return "\(baseUrl)/profiles"
        case .sendMoney:
            return "\(baseUrl)/user/send-money"
                
        }
    }
}
