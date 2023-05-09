//
//  LogInViewController.swift
//  TapCash
//
//  Created by Mahmoud on 03/05/2023.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 10
        }
    }
    var userMV : UserOperations?
    override func viewDidLoad() {
        super.viewDidLoad()
        userMV = UserOperations()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        renderTextField(textFields: [emailText, passwordText])
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        let email = emailText.text ?? ""
        let password = passwordText.text ?? ""
        
        let body : [String : Any] = [
            "email":email,
            "password":password,
            "type":"user"
        ]
        if(isEmpty()){
            let alert = UIAlertController(title: "Missing Data", message: "Please Fill all Fields", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else{
            userMV?.postCustomer(url: .login, data: body, complition: { _ in
            })
            userMV?.bindingLogInData = {
                print(self.userMV?.usersResult.data?[0].user?.family?.count ?? 0)
                print(self.userMV?.usersResult.data?[0].token ?? "")
                if self.userMV?.usersResult.data?[0].token != nil{
                    DispatchQueue.main.async {
                        let profileScreen = self.storyboard?.instantiateViewController(withIdentifier: "profiles") as! ProfilesVC
                        var masterUser = Family()
                        masterUser.name = self.userMV?.usersResult.data?[0].user?.name
                        masterUser.sponsorId = self.userMV?.usersResult.data?[0].user?.id
                        masterUser.userName = self.userMV?.usersResult.data?[0].user?.userName
                        profileScreen.profiles.append(masterUser)
                        for user in self.userMV?.usersResult.data?[0].user?.family ?? []
                        {
                            profileScreen.profiles.append(user)
                            
                        }
                        self.navigationController?.pushViewController(profileScreen, animated: true)
                    }
                }
                else{
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: "invalid email or password", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                        
                    }
                    
                }
            }
        }
    }
    }



extension LoginVC {
    func renderTextField(textFields: [UITextField]) {
        for textField in textFields {
            textField.layer.masksToBounds = true
            textField.layer.cornerRadius = 10
            textField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            textField.layer.borderWidth = 0.7
        }
    }
    func isEmpty()->Bool{
        if emailText.text == "" || passwordText.text == ""{
            return true
        }
        else{
            return false
        }
    }
}
