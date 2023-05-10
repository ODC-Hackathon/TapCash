//
//  OperationsVC.swift
//  TapCash
//
//  Created by Mahmoud on 08/05/2023.
//

import UIKit
import AudioToolbox
class OperationsVC: UIViewController {
    
    @IBOutlet weak var amount: UILabel!
    var totalAmount : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.amount.textColor = .systemGray5
            self.amount.text! += " \(self.totalAmount)"
        }
        
        
    }
    
    
    @IBAction func addNumber(_ sender: UIButton) {
        if sender.tag == 0 && totalAmount == 0{
            
        }
        else if(totalAmount <= 80000)
        {
             self.amount.textColor = UIColor(named: "AccentColor")
            totalAmount = (totalAmount * 10) + sender.tag
            print(totalAmount)
            print(sender.tag)
            DispatchQueue.main.async {
                self.amount.text = "EGP"
                self.amount.text! += " \(self.totalAmount)"
                
            }
        }
        else{
            AudioServicesPlaySystemSound(1521)
        }
        
    }
    
    
    @IBAction func deleteNumber(_ sender: UIButton) {
        if(totalAmount == 0){
            AudioServicesPlaySystemSound(1521)
        }
        else if totalAmount < 10{
            totalAmount = 0
            DispatchQueue.main.async {
                self.amount.textColor = .systemGray5
                self.amount.text = "EGP"
                self.amount.text! += " \(self.totalAmount)"
                
            }
        }
        else{
            totalAmount = totalAmount / 10
            DispatchQueue.main.async {
                self.amount.textColor = UIColor(named: "AccentColor")
                self.amount.text = "EGP"
                self.amount.text! += " \(self.totalAmount)"
                
            }
        }
        
    }
    
    @IBAction func sendRequest(_ sender: UIButton) {
        if totalAmount < 5 {
            let alert = UIAlertController(title: "Restriction", message: "minimum amount is 5", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else{
            let requestScreen = self.storyboard?.instantiateViewController(withIdentifier: "requestScreen") as! RequestVC
            requestScreen.from = sender.tag
            requestScreen.amount = totalAmount
            self.navigationController?.pushViewController(requestScreen, animated: true)
        }
    }
    
}
