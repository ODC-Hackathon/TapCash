//
//  ProfilesVC.swift
//  TapCash
//
//  Created by Adham Samer on 07/05/2023.
//

import UIKit

class ProfilesVC: UIViewController {
    
    @IBOutlet weak var profilesCollectionView: UICollectionView!{
        didSet{
            profilesCollectionView.delegate = self
            profilesCollectionView.dataSource = self
            let nib = UINib(nibName: "ProfilesCVCell", bundle: nil)
            profilesCollectionView.register(nib, forCellWithReuseIdentifier: "profilesCVCell")
        }
    }
    var profiles : [Family] = []
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
    
}

extension ProfilesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profilesCVCell", for: indexPath) as! ProfilesCVCell
        cell.configName(profiles[indexPath.row].name ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 20 , height: (collectionView.frame.width / 2)  )
    }
}
