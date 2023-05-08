//
//  Protocols.swift
//  TapCash
//
//  Created by Adham Samer on 02/05/2023.
//

import Foundation

protocol GET_DATA{
    static func fetch<T: Decodable>(url: String?, compiletionHandler: @escaping (T?) -> Void)
}

protocol POST_DATA {
    static func postMethod(url: String, parameters: [String: Any],token:String?, completionHandler: @escaping ([String:Any]?)->Void)
}

protocol PUT_DATA {
    static func putMethod(url: String, parameters: [String: Any],token:String?, handler: @escaping ([String: Any]?) -> Void)
}

protocol DELTE_DATA {
    static func delete(url: String)
}
