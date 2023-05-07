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
        let rightBtn = UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(printOne) )
        navigationItem.rightBarButtonItem = rightBtn
        // Do any additional setup after loading the view.
    }

    @objc func printOne(){
        print("Onee")
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyTVCell", for: indexPath) as! FamilyTVCell
        cell.name.text = "Adham"
        cell.type.text = "Admin"
        cell.ppImage.image = UIImage(named: "Netflix")
        return cell
    }
    
    
}
