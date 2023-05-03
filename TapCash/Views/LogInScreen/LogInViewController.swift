//
//  LogInViewController.swift
//  TapCash
//
//  Created by Mahmoud on 03/05/2023.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!{
        didSet{
            emailText.layer.cornerRadius = 20
        }
    }
    @IBOutlet var passwordText: UITextField!{
        didSet{
            passwordText.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var loginButton: UIButton!{
        didSet{
            loginButton.layer.cornerRadius = 20
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginAction(_ sender: UIButton) {
    }
    

}
