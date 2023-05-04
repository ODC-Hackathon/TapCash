//
//  RegisterVC.swift
//  TapCash
//
//  Created by Adham Samer on 03/05/2023.
//

import UIKit

class RegisterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var registerBtn: UIButton!{
        didSet{
            self.registerBtn.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        renderTextFields(txtFields: [emailTextField,phoneTextField,nameTextField,passwordTextField])
    }

    @IBAction func registerBtn(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension RegisterVC {
    func renderTextFields(txtFields:[UITextField]){
        for txtField in txtFields {
            txtField.delegate = self
            txtField.layer.cornerRadius = 10
            txtField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            txtField.layer.borderWidth = 0.7
        }
    }
}
