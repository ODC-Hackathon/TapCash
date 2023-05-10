//
//  ProfileVC.swift
//  TapCash
//
//  Created by Adham Samer on 04/05/2023.
//

import UIKit

class ProfileVC: UIViewController, ProfileTVControllerDelegate{
    func showPassAlert() {
        //Will be replaced with an alert containing textfield to check pincode
        showAlert(title: "Done", msg: "Passcode Selected", handler: { _ in })
    }
    

    @IBOutlet weak var ppImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var tvController: ProfileTVController?
    override func viewDidLoad() {
        super.viewDidLoad()
        tvController = self.children[0] as? ProfileTVController
        tvController?.delegate = self
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

}
extension ProfileVC {
    func showAlert(title: String, msg: String, handler: @escaping (UIAlertAction?) -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            handler(action)
        }))

        present(alert, animated: true, completion: nil)
    }
}
