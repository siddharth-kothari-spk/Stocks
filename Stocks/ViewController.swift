//
//  ViewController.swift
//  Stocks
//
//  Created by sidkotha on 06/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let stocksTableView = UITableView()
    var aggregateData: Stocks!
    var stocksData: [StockModel] = []
    
    @IBOutlet weak var aggregateView: UIView!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var totalInvestmentLabel: UILabel!
    @IBOutlet weak var todayProfitAndLossLabel: UILabel!
    @IBOutlet weak var totalProfitAndLossLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setTable()
        view.bringSubviewToFront(aggregateView)
        getData()
    }
    
    func setTitle() {
        view.addSubview(titleLabel)
        titleLabel.text = "Upstox holdings"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.backgroundColor = .purple
        titleLabel.textColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
    }
    
    func setTable() {
        view.addSubview(stocksTableView)
        stocksTableView.dataSource = self
        stocksTableView.delegate = self
        stocksTableView.register(StockTableViewCell.self, forCellReuseIdentifier: "stockCell")
        
        stocksTableView.translatesAutoresizingMaskIntoConstraints = false
        stocksTableView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor).isActive = true
        stocksTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stocksTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stocksTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }
    
    func getData() {
        NetworkManager().startLoad { result in
            switch result {
            case .success(let data):
                self.aggregateData = data
                self.stocksData = self.aggregateData.data
                DispatchQueue.main.async {
                    self.stocksTableView.reloadData()
                    self.currentValueLabel.text = "Test"
                    self.totalInvestmentLabel.text = "Investment"
                    self.todayProfitAndLossLabel.text = "Today P/L"
                    self.totalProfitAndLossLabel.text = "Total P/L"
                }
                print("success data: \(data)")
            case .failure(let error):
                print("error : \(error.localizedDescription)")
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stocksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! StockTableViewCell
        cell.stock = self.stocksData[indexPath.row]
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
