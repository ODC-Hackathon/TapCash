//
//  ViewController.swift
//  TapCash
//
//  Created by Adham Samer on 02/05/2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var TransitionTV: UITableView!{
        didSet{
            TransitionTV.dataSource = self
            TransitionTV.delegate = self
            
            let nib = UINib(nibName:"TransitionTVCell", bundle: nil)
            TransitionTV.register(nib, forCellReuseIdentifier: "TransitionCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension HomeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
extension HomeVC : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransitionCell") as! TransitionTVCell
        cell.layer.cornerRadius = 25
        
        cell.configImage()
        return cell
    }
    
    
}


