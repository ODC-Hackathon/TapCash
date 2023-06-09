//
//  NetworkServices.swift
//  TapCash
//
//  Created by Adham Samer on 02/05/2023.
//

import Foundation
import Alamofire


class NetworkServices: GET_DATA {
    static func fetch<T>(url: String?, compiletionHandler: @escaping (T?) -> Void) where T: Decodable {
        let request = AF.request(url ?? "")

        request.responseDecodable(of: T.self) { response in
            guard let resultOfAPI = response.value else {
                compiletionHandler(nil)
                return
            }
            compiletionHandler(resultOfAPI)
        }
    }
}

// MARK: POST

extension NetworkServices: POST_DATA {
    
    static func postMethod(url: String, parameters: [String: Any],token:String?, completionHandler: @escaping ([String : Any]?) -> Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false

        print(parameters)

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }

        // HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")

        session.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)

                print("POST :\(response)")
                completionHandler(response as? [String:Any])
            } catch {
                print(error)
            }
        }.resume()
    }
}

// MARK: DELETE

extension NetworkServices: DELTE_DATA {
    static func delete(url: String) {
        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "application/json")
        headers.add(name: "Accept", value: "application/json")
        headers.add(name: "Accept", value: "application/json")
        
        

        AF.request(url, method: .delete, headers: headers).response { response in
            switch response.result {
            case .success:
                print("Deleted")
            case .failure:
                print("Failed to delete")
            }
        }
    }
}

// MARK: PUT

extension NetworkServices: PUT_DATA {
    static func putMethod(url: String, parameters: [String: Any],token:String?, handler: @escaping ([String: Any]?) -> Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false

        print(parameters)

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }

        // HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")

        session.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)

                print("PUT:\(response)")
                handler(response as? [String: Any])
            } catch {
                print(error)
            }
        }.resume()
    }
}
