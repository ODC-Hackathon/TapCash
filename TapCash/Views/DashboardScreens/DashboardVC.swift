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
    let dataEntries = [
        ChartDataEntry(x: 1, y: 100.0),
        ChartDataEntry(x: 2, y: 200.0),
        ChartDataEntry(x: 3, y: 150.0),
        ChartDataEntry(x: 4, y: 250.0),
        ChartDataEntry(x: 5, y: 200.0),
        ChartDataEntry(x: 6, y: 100.0),
        ChartDataEntry(x: 7, y: 200.0),
        ChartDataEntry(x: 8, y: 150.0),
        ChartDataEntry(x: 9, y: 250.0),
        ChartDataEntry(x: 10, y: 200.0),
        ChartDataEntry(x: 11, y: 100.0),
        ChartDataEntry(x: 12, y: 200.0),
        ChartDataEntry(x: 13, y: 150.0),
        ChartDataEntry(x: 14, y: 250.0),
        ChartDataEntry(x: 15, y: 200.0),
        ChartDataEntry(x: 16, y: 100.0),
        ChartDataEntry(x: 17, y: 200.0),
        ChartDataEntry(x: 18, y: 150.0),
        ChartDataEntry(x: 19, y: 250.0),
        ChartDataEntry(x: 20, y: 200.0),
        ChartDataEntry(x: 21, y: 100.0),
        ChartDataEntry(x: 22, y: 200.0),
        ChartDataEntry(x: 23, y: 150.0),
        ChartDataEntry(x: 24, y: 250.0),
        ChartDataEntry(x: 25, y: 200.0),
        ChartDataEntry(x: 26, y: 100.0),
        ChartDataEntry(x: 27, y: 200.0),
        ChartDataEntry(x: 28, y: 150.0),
        ChartDataEntry(x: 29, y: 250.0),
        ChartDataEntry(x: 30, y: 200.0),
        
        
    ]

    
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var categoriesTV: UITableView!{
        didSet{
            categoriesTV.dataSource = self
            categoriesTV.delegate = self
            
            let nib = UINib(nibName: "CategoriesTVCell", bundle: nil)
            categoriesTV.register(nib, forCellReuseIdentifier: "CategoriesCell")
            
        }
    }
    lazy var lineChart :  LineChartView = {
        let chartView = LineChartView(frame: chartView.bounds)
        chartView.backgroundColor = .white
        return chartView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.addSubview(lineChart)
        print(lineChart.bounds)
        let dataSet = LineChartDataSet(entries: dataEntries, label: "Data Set")
        dataSet.colors = [.blue]
        dataSet.circleColors = [.blue]
        dataSet.drawValuesEnabled = false

        let data = LineChartData(dataSet: dataSet)
        lineChart.data = data
        lineChart.chartDescription.text = "Line Chart"
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.granularityEnabled = true
        lineChart.xAxis.granularity = 1.0
        lineChart.rightAxis.enabled = false
        lineChart.legend.enabled = false
       
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


// MARK: - Chart Extensions

extension DashboardVC : ChartViewDelegate{
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
}
