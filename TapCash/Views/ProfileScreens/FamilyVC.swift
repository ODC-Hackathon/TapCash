//
//  FamilyVC.swift
//  TapCash
//
//  Created by Adham Samer on 07/05/2023.
//

import UIKit

class FamilyVC: UIViewController {
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var membersTable: UITableView! {
        didSet {
            membersTable.delegate = self
            membersTable.dataSource = self
            let nib = UINib(nibName: "FamilyTVCell", bundle: nil)
            membersTable.register(nib, forCellReuseIdentifier: "familyTVCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBtn = UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(gotToMemberDetails) )
        navigationItem.rightBarButtonItem = rightBtn
        // Do any additional setup after loading the view.
    }

    @objc func gotToMemberDetails(){
        let addMmbrVC = self.storyboard?.instantiateViewController(withIdentifier: "addMemberVC") as! AddMemberVC
        navigationController?.pushViewController(addMmbrVC, animated: true)
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

extension FamilyVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyTVCell", for: indexPath) as! FamilyTVCell
        switch indexPath.row {
            case 0:
                cell.name.text = "Adham"
                cell.type.text = "Admin"
                cell.ppImage.image = UIImage(named: "avatar")
            case 1,2:
                cell.name.text = "Mahmoud"
                cell.type.text = "Child"
                cell.ppImage.image = UIImage(named: "Netflix")
            default:
                print("Default")
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mmbrVC = self.storyboard?.instantiateViewController(withIdentifier: "memberDetailsVC") as! MemberDetailsVC
        navigationController?.pushViewController(mmbrVC, animated: true)
    }
    
}
