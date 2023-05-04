//
//  LogInViewController.swift
//  TapCash
//
//  Created by Mahmoud on 03/05/2023.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!{
        didSet{
            loginButton.layer.cornerRadius = 20
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        renderTextField(textFields: [emailText,passwordText])
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
    }
    

}

extension LoginVC{
    func renderTextField(textFields: [UITextField]){
        for textField in textFields {
            textField.layer.masksToBounds = true
            textField.layer.cornerRadius = 20
            textField.layer.shadowRadius = 3
            
        }
        
    }
}
