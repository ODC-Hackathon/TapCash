//
//  FaceRecognitionVC.swift
//  TapCash
//
//  Created by Adham Samer on 05/05/2023.
//

import UIKit
import LocalAuthentication

class FaceRecognitionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func faceBtn(_ sender: UIButton) {
        let context = LAContext()
        var error :AutoreleasingUnsafeMutablePointer<NSError?>?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: error ){
            let reason = "Plz Authorize"
            
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error1 in
                    DispatchQueue.main.async {
                    guard success, error1 == nil else{
                        //failed
                        print("Failed")
                        return
                    }
                        self?.showAlert(title: "Done", msg: "Authorized", handler: { action in print("Done")})
                }
                
            }
            
        }
    }
    
    
    func showAlert(title: String, msg: String, handler: @escaping (UIAlertAction?) -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            handler(action)
        }))

        present(alert, animated: true, completion: nil)
    }
}
