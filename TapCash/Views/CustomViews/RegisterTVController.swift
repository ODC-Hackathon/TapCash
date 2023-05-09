//
//  RegisterTVController.swift
//  TapCash
//
//  Created by Adham Samer on 09/05/2023.
//

import UIKit

class RegisterTVController: UITableViewController {
    

    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var nationalNumberTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var pinCodeTxtField: UITextField!
    var delegate:RegisterTVControlDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        renderTextFields(txtFields: [userNameTxtField,nationalNumberTxtField, emailTxtField,phoneTxtField,nameTxtField,passwordTxtField,pinCodeTxtField])
    
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Personal Details"
            case 1:
                return "Account Details"
            default:
                return ""
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0:
                return 4
            case 1:
                return 3
            default:
                return 0
        }
    }
    
    //MARK: - Useful functions
    /*
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    */
}

extension RegisterTVController {
    func renderTextFields(txtFields:[UITextField]){
        for txtField in txtFields {
            txtField.delegate = self
            txtField.layer.cornerRadius = 10
            txtField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            txtField.layer.borderWidth = 1
        }
    }
}

protocol RegisterTVControlDelegate {
    func getTxtFields()
}

extension RegisterTVController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let delegate = delegate{
            delegate.getTxtFields()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let delegate = delegate{
            delegate.getTxtFields()
        }
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let delegate = delegate{
            delegate.getTxtFields()
        }
    }
}
