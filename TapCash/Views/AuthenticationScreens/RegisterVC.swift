//
//  RegisterVC.swift
//  TapCash
//
//  Created by Adham Samer on 03/05/2023.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet var registerBtn: UIButton! {
        didSet {
            registerBtn.layer.cornerRadius = 20
        }
    }

    var registerTVController: RegisterTVController?
    var name: String?
    var userName: String?
    var nationalNumber: String?
    var phone: String?
    var email: String?
    var password: String?
    var pinCodeTxt: String?
    var pinCode: Int?

    var userVM: UserOperations?
    var indicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTVController = children[0] as? RegisterTVController
        registerTVController?.delegate = self
        userVM = UserOperations()
    }

    @IBAction func registerBtn(_ sender: UIButton) {
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
        if isEmpty() {
            indicator.stopAnimating()
            showAlert(title: "Missing Fields", msg: "Data is missing ! \n all fields are required", handler: { _ in self.clearTxtFields() })
        } else {
            let body: [String: Any] = [
                "SSN": nationalNumber ?? "",
                "name": name ?? "",
                "user_name": userName ?? "",
                "phone_number": phone ?? "",
                "email": email ?? "",
                "password": password ?? "",
                "pincode": pinCode ?? 000 
            ]
            userVM?.addCustomer(url: .register, parameters: body)
            userVM?.bindingLogInData = {
                DispatchQueue.main.async {
                    print(self.userVM?.userResponse?.values.first ?? "")
                    print((self.userVM?.userResponse!.keys.formatted()) ?? "")
                    // let response = self.userVM?.userResponse
                    // print("RESPONSE : \(response)")
                    switch self.userVM?.userResponse?.keys.formatted() {
                    case "data":
                        self.indicator.stopAnimating()
                        self.showAlert(title: "Done", msg: "Registered Successfully", handler: { _ in
                            let main = UIStoryboard(name: "HomeSB", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as? HomeVC
                            
                        })

                    case "errors":
                        guard let errorsDict = self.userVM?.userResponse?["errors"] else {
                            return
                        }
                        let errors: String? = self.decodeErrors(dict: errorsDict as? [String: Any])
                            print( "PinCode: \(Int(self.registerTVController?.pinCodeTxtField.text ?? "") ?? 0)")
                        self.indicator.stopAnimating()
                        self.showAlert(title: "Error", msg: errors ?? "", handler: { _ in
                            self.clearTxtFields()
                        })

                    default:
                        print("Done")
                    }
                }
            }
        }
    }
}

extension RegisterVC {
    func isEmpty() -> Bool {
        if
            registerTVController?.userNameTxtField.text == "" &&
            registerTVController?.nameTxtField.text == "" &&
            registerTVController?.nationalNumberTxtField.text == "" &&
            registerTVController?.phoneTxtField.text == "" &&
            registerTVController?.emailTxtField.text == "" &&
            registerTVController?.passwordTxtField.text == "" &&
            registerTVController?.pinCodeTxtField.text == ""
        {
            return true
        } else {
            return false
        }
    }

    func clearTxtFields() {
        registerTVController?.userNameTxtField.text = ""
        registerTVController?.nameTxtField.text = ""
        registerTVController?.nationalNumberTxtField.text = ""
        registerTVController?.phoneTxtField.text = ""
        registerTVController?.emailTxtField.text = ""
        registerTVController?.passwordTxtField.text = ""
        registerTVController?.pinCodeTxtField.text = ""
    }

    func decodeErrors(dict: [String: Any]?) -> String {
        var errorMessages = ""

        if let errors = dict {
            for (field, messages) in errors {
                errorMessages += "\(field.capitalized): "
                if let messages = messages as? [String] {
                    for message in messages {
                        errorMessages += " \(message)\n"
                    }
                }
            }
        }

        return errorMessages
    }

    func showAlert(title: String, msg: String, handler: @escaping (UIAlertAction?) -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            handler(action)
        }))

        present(alert, animated: true, completion: nil)
    }
}

extension RegisterVC: RegisterTVControlDelegate {
    func getTxtFields() {
        userName = registerTVController?.userNameTxtField.text
        name = registerTVController?.nameTxtField.text
        nationalNumber = registerTVController?.nationalNumberTxtField.text
        phone = registerTVController?.phoneTxtField.text
        email = registerTVController?.emailTxtField.text
        password = registerTVController?.passwordTxtField.text
        pinCodeTxt = registerTVController?.pinCodeTxtField.text
        
        if let pin = Int(pinCodeTxt ?? "") {
            print("Casted")
            pinCode = pin
        }else{
            print("Failed")
        }
    }
}
