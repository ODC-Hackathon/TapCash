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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        renderTextField(textFields: [emailText, passwordText])
    }

    @IBAction func loginAction(_ sender: UIButton) {
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
}
