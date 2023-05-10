//
//  DashboardVC.swift
//  TapCash
//
//  Created by Adham Samer on 04/05/2023.
//

import UIKit
import TinyConstraints
import Charts

class DashboardVC: UIViewController {
    let dummyData : [ChartDataEntry] = [
    
        BarChartDataEntry(x: 1.0, y: 10 / 100),
        BarChartDataEntry(x: 2.0, y: 20 / 100),
        BarChartDataEntry(x: 3.0, y: 30 / 100),
        BarChartDataEntry(x: 4.0, y: 40 / 100),
        BarChartDataEntry(x: 5.0, y: 50 / 100),
        BarChartDataEntry(x: 6.0, y: 60 / 100)
    ]

    
    @IBOutlet weak var chartCollection: UICollectionView!{
        didSet{
            chartCollection.dataSource = self
            chartCollection.delegate = self
            
            let nib = UINib(nibName: "ChartCVCell", bundle: nil)
            chartCollection.register(nib, forCellWithReuseIdentifier: "ChartCell")
        }
    }
    @IBOutlet weak var categoriesTV: UITableView!{
        didSet{
            categoriesTV.dataSource = self
            categoriesTV.delegate = self
            
            let nib = UINib(nibName: "CategoriesTVCell", bundle: nil)
            categoriesTV.register(nib, forCellReuseIdentifier: "CategoriesCell")
            
        }
    }
    lazy var barChartView :  BarChartView = {
        let chartView = BarChartView()
        chartView.backgroundColor = .systemBlue
        return chartView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
}
//MARK: -  TableView Extensions
extension DashboardVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DashboardVC : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesTVCell
        
        
        
        return cell
    }
    
    
}
//MARK: -  CollectionView Extensions
extension DashboardVC : UICollectionViewDelegate{
    
}
extension DashboardVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChartCell", for: indexPath) as! ChartCVCell
        self.barChartView.pinchZoomEnabled = false
        self.barChartView.dragEnabled = false
        self.barChartView.dragDecelerationEnabled = false
        self.barChartView.scaleXEnabled = false
        self.barChartView.scaleYEnabled = false
        self.barChartView.zoomOut()
    
        cell.addSubview(barChartView)
        barChartView.centerInSuperview()
        barChartView.width(to:cell)
        barChartView.heightToWidth(of: cell)
        setData()
        return cell
    }
    
    
}
extension DashboardVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height: self.view.frame.height * 0.22)
    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // set the spacing around the cells here
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - Chart Extensions

extension DashboardVC : ChartViewDelegate{
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    func setData(){
        let set = BarChartDataSet(entries: dummyData, label: "for test")
        let data = BarChartData(dataSet: set)
        barChartView.data = data
    }
}
