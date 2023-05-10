//
//  PassCodeVC.swift
//  TapCash
//
//  Created by Adham Samer on 05/05/2023.
//

import UIKit

class PassCodeVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pinTxtField: UITextField!{
        didSet{
            pinTxtField.delegate = self
            pinTxtField.layer.cornerRadius = 10
            pinTxtField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            pinTxtField.layer.borderWidth = 0.7
        }
    }
    let userDefualt = UserDefaults.standard
    var pinCode : Int?
    var userName : String?
    var type : String?
    var token : String?
    var reponse : PassCodeResponse?
    var logInVM: UserOperations?
    override func viewDidLoad() {
        super.viewDidLoad()
        logInVM = UserOperations()
        reponse = PassCodeResponse()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func nextBtn(_ sender: UIButton) {
        userName = userDefualt.string(forKey:"userName") ?? ""
        type = userDefualt.string(forKey: "type") ?? ""
        pinCode = Int(pinTxtField.text ?? "") ?? 0
        if isEmpy(){
            let alert = UIAlertController(title: "Wrong", message: "something go wrong", preferredStyle: .alert)
            let okAcion = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAcion)
            self.present(alert, animated: true)
        }
        else{
            let body: [String: Any] = [
                "user_name": userName ?? "",
                "type": type ?? "",
                "pincode": pinCode ?? 0
            ]
            
            logInVM?.passCode(url: Endpoints.login, parameter: body, token: token ?? "")
            logInVM?.bindingLogInData = {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: self.logInVM?.userResponse, options: [])
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)
                        if let jsonData = jsonString.data(using: .utf8) {
                            do {
                                let myModel = try JSONDecoder().decode(PassCodeResponse.self, from: jsonData)
                                self.reponse = myModel
                                //print(myModel) // Output: MyModel(id: 1, name: "John Doe")
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        }
                  
                    }
                } catch {
                    print("Error converting dictionary to JSON string: \(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                    if(self.reponse?.data != nil){
                        self.userDefualt.set(self.reponse?.data?[0].token, forKey: "token")
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                        let alert = UIAlertController(title: "Wrong", message: "Wrong pin code", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }
                }
                
            
            }
        }
    }
            
            
            @IBAction func deleteBtn(_ sender: Any) {
                
                var txt = pinTxtField.text
                if txt?.count != 0{
                    txt?.removeLast()
                    pinTxtField.text = txt
                }
                
                
            }
            @IBAction func clearBtn(_ sender: Any) {
                pinTxtField.text = ""
            }
            @IBAction func numsBtns(_ sender: UIButton) {
                if pinTxtField.text!.count < 4 {
                    switch(sender.tag){
                    case 0:
                        pinTxtField.text?.append("0")
                    case 1:
                        pinTxtField.text?.append("1")
                    case 2:
                        pinTxtField.text?.append("2")
                    case 3:
                        pinTxtField.text?.append("3")
                    case 4:
                        pinTxtField.text?.append("4")
                    case 5:
                        pinTxtField.text?.append("5")
                    case 6:
                        pinTxtField.text?.append("6")
                    case 7:
                        pinTxtField.text?.append("7")
                    case 8:
                        pinTxtField.text?.append("8")
                    case 9:
                        pinTxtField.text?.append("9")
                        
                    default:
                        print("no")
                    }
                }
                
            }
            func isEmpy()->Bool{
                if userName == "" || pinTxtField.text == "" || type == "" {
                    return true
                }
                else{
                    return false
                }
            }
        }
    

