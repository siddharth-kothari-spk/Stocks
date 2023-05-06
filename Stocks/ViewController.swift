//
//  ViewController.swift
//  Stocks
//
//  Created by sidkotha on 06/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    let stocksTableView = UITableView()
    let aggregateView = UIView()
    var aggregateData: Stocks!
    var stocksData: [StockModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksTableView.backgroundColor = .red
        aggregateView.backgroundColor = .green
        // Do any additional setup after loading the view.
        view.addSubview(stocksTableView)
        stocksTableView.dataSource = self
        stocksTableView.delegate = self
        stocksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "stockCell")
        view.addSubview(aggregateView)
        setConstraints()
        getData()
    }
    
    func getData() {
        NetworkManager().startLoad { result in
            switch result {
            case .success(let data):
                self.aggregateData = data
                self.stocksData = self.aggregateData.data
                DispatchQueue.main.async {
                    self.stocksTableView.reloadData()
                }
                print("success data: \(data)")
            case .failure(let error):
                print("error : \(error.localizedDescription)")
            }
        }
    }
    
    func setConstraints() {
        stocksTableView.translatesAutoresizingMaskIntoConstraints = false
        stocksTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        stocksTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stocksTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stocksTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        
        aggregateView.translatesAutoresizingMaskIntoConstraints = false
        aggregateView.topAnchor.constraint(equalTo: stocksTableView.bottomAnchor).isActive = true
        aggregateView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        aggregateView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        aggregateView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stocksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        cell.textLabel?.text = self.stocksData[indexPath.row].companyName
          return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
}
