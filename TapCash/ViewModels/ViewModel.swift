//
//  ViewModel.swift
//  TapCash
//
//  Created by Adham Samer on 02/05/2023.
//

import Foundation


class UserOperations{
    var bindingLogInData : (()->()) = {}
    var usersResult : Users!{
        didSet{
            bindingLogInData()
        }
    }
    func postCustomer (url : String,  data : [String : Any],complition :  @escaping (Result<Data, Error>) -> Void)
    {
        NetworkServices.postMethod(url: url, parameters: data, token: nil) { data in
            print(data)
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                  //  print(jsonString)
                    if let jsonData = jsonString.data(using: .utf8) {
                        do {
                            let myModel = try JSONDecoder().decode(Users.self, from: jsonData)
                            self.usersResult = myModel
                            //print(myModel) // Output: MyModel(id: 1, name: "John Doe")
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                 //   print(jsonString) // Output: {"name":"John","isEmployed":true,"age":30}
                }
            } catch {
                print("Error converting dictionary to JSON string: \(error.localizedDescription)")
            }
           
        }
    }
    
}
