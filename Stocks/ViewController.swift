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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksTableView.backgroundColor = .red
        aggregateView.backgroundColor = .green
        // Do any additional setup after loading the view.
        view.addSubview(stocksTableView)
        view.addSubview(aggregateView)
        setConstraints()
        getData()
    }
    
    func getData() {
        NetworkManager().startLoad { result in
            switch result {
            case .success(let data):
                print("success data: \(data)")
            case .failure(let error):
                print("error : \(error.localizedDescription)")
            }
        }
    }
    
    func setConstraints() {
        stocksTableView.translatesAutoresizingMaskIntoConstraints = false
        
        stocksTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stocksTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        stocksTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        stocksTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -200).isActive = true
        
        aggregateView.translatesAutoresizingMaskIntoConstraints = false
        aggregateView.topAnchor.constraint(equalTo: stocksTableView.bottomAnchor).isActive = true
        aggregateView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        aggregateView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        aggregateView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
    }


}

