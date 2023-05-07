//
//  AddMemberVC.swift
//  TapCash
//
//  Created by Adham Samer on 07/05/2023.
//

import UIKit

class MemberDetailsVC: UIViewController {

    @IBOutlet weak var transactionsTable: UITableView!{
        didSet{
            transactionsTable.delegate = self
            transactionsTable.dataSource = self
            
            let nib = UINib(nibName:"TransitionTVCell", bundle: nil)
            transactionsTable.register(nib, forCellReuseIdentifier: "TransitionCell")
        }
    }
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        renderTextFields(txtFields: [passwordTxtField, phoneTxtField, userNameTxtField])
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
extension MemberDetailsVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransitionCell", for: indexPath) as! TransitionTVCell
        cell.configImage()
        return cell
    }
    
    
}

extension MemberDetailsVC {
    func renderTextFields(txtFields:[UITextField]){
        for txtField in txtFields {
            txtField.layer.cornerRadius = 10
            txtField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
            txtField.layer.borderWidth = 0.7
        }
    }
}
