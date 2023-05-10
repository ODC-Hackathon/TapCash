//
//  RequestVC.swift
//  TapCash
//
//  Created by Adham Samer on 04/05/2023.
//

import UIKit

class RequestVC: UIViewController {

    @IBOutlet weak var requestBtn: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var contactTV: UITableView!{
        didSet{
            contactTV.delegate = self
            contactTV.dataSource = self
            let nib = UINib(nibName: "FamilyTVCell", bundle: nil)
            contactTV.register(nib, forCellReuseIdentifier: "familyTVCell")
        }
    }
    var from : Int?
    var amount : Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        if from! == 1{
            btn.isHidden = true
            requestBtn.isHidden = false
        }
        else if from! == 0{
            btn.isHidden = false
            requestBtn.isHidden = true
        }
        amountLabel.text = "EGP \(amount!)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func operateBtn(_ sender: Any) {
        if from == 1{
            btn.titleLabel?.text = "Request"
        }
        else if from == 0{
            btn.titleLabel?.text = "Send"
        }
    }
}
//MARK: - Delegate Extensions
extension RequestVC : UITableViewDelegate{
    
}
//MARK: - Data Source Extension
extension RequestVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
            case 0:
                return "Contacts"
            default:
                return "none"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyTVCell") as! FamilyTVCell
        cell.name.text = "Mahmoud"
        cell.type.text = ""
        cell.accessoryView?.isHidden = false
        cell.ppImage.image = UIImage(named: "avatar")
        return cell
    }
    
    
}
