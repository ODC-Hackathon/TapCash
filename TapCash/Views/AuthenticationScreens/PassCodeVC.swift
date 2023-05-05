//
//  PassCodeVC.swift
//  TapCash
//
//  Created by Adham Samer on 05/05/2023.
//

import UIKit

class PassCodeVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pinTxtField: UITextField!{
        didSet{
            pinTxtField.delegate = self
            pinTxtField.layer.cornerRadius = 10
            pinTxtField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            pinTxtField.layer.borderWidth = 0.7
        }
    }
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

    @IBAction func nextBtn(_ sender: Any) {
    }
    @IBAction func deleteBtn(_ sender: Any) {
        
        var txt = pinTxtField.text
        if txt?.count != 0{
            txt?.removeLast()
            pinTxtField.text = txt
        }
        
    }
    @IBAction func clearBtn(_ sender: Any) {
        pinTxtField.text = ""
    }
    @IBAction func numsBtns(_ sender: UIButton) {
        if pinTxtField.text!.count < 4 {
            switch(sender.tag){
                case 0:
                    pinTxtField.text?.append("0")
                case 1:
                    pinTxtField.text?.append("1")
                case 2:
                    pinTxtField.text?.append("2")
                case 3:
                    pinTxtField.text?.append("3")
                case 4:
                    pinTxtField.text?.append("4")
                case 5:
                    pinTxtField.text?.append("5")
                case 6:
                    pinTxtField.text?.append("6")
                case 7:
                    pinTxtField.text?.append("7")
                case 8:
                    pinTxtField.text?.append("8")
                case 9:
                    pinTxtField.text?.append("9")
                    
                default:
                    print("no")
            }
        }
        
    }
}
