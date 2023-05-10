//
//  PersonalDetailsVC.swift
//  TapCash
//
//  Created by Adham Samer on 07/05/2023.
//

import UIKit

class PersonalDetailsVC: UIViewController {

    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        renderTextFields(txtFields: [phoneTxtField,emailTxtField,userNameTxtField])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveBtn(_ sender: Any) {
    }
}
extension PersonalDetailsVC {
    func renderTextFields(txtFields:[UITextField]){
        for txtField in txtFields {
            txtField.layer.cornerRadius = 10
            txtField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            txtField.layer.borderWidth = 0.7
        }
    }
}
