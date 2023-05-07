//
//  StockTableViewCell.swift
//  Stocks
//
//  Created by sidkotha on 06/05/23.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    var stock: StockModel? {
            didSet {
                guard let stockItem = stock else {return}
                
                symbolLabel.text = stockItem.symbol
                quantityLabel.text = String(stockItem.quantity)
                
                ltpLabel.text = "LTP: " + (Locale.current.currencySymbol ?? "") + String(stockItem.ltp)
                
                let profitLoss = (stockItem.ltp - (Double(stockItem.avgPrice) ?? 0.0)) * Double(stockItem.quantity)
                profitLossLabel.text = "P/L: " + (Locale.current.currencySymbol ?? "") +  String(format: "%.2f", profitLoss)
            
            }
        }
    
    let leftContainerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let quantityLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
      label.textAlignment = .left
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let rightContainerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()

    let ltpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profitLossLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .justified
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        leftContainerView.addSubview(symbolLabel)
        leftContainerView.addSubview(quantityLabel)
        
        rightContainerView.addSubview(ltpLabel)
        rightContainerView.addSubview(profitLossLabel)
        
        self.contentView.addSubview(leftContainerView)
        self.contentView.addSubview(rightContainerView)
        
        setConstraints()
     }
    
    func setConstraints() {
        leftContainerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        leftContainerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        leftContainerView.trailingAnchor.constraint(equalTo:self.rightContainerView.leadingAnchor, constant:-10).isActive = true
        leftContainerView.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        
        symbolLabel.topAnchor.constraint(equalTo:self.leftContainerView.topAnchor, constant: 5).isActive = true
        symbolLabel.leadingAnchor.constraint(equalTo:self.leftContainerView.leadingAnchor).isActive = true
        symbolLabel.trailingAnchor.constraint(equalTo:self.leftContainerView.trailingAnchor).isActive = true
        
        quantityLabel.topAnchor.constraint(equalTo:self.symbolLabel.bottomAnchor, constant: 5).isActive = true
        quantityLabel.leadingAnchor.constraint(equalTo:self.leftContainerView.leadingAnchor).isActive = true
        quantityLabel.trailingAnchor.constraint(equalTo:self.leftContainerView.trailingAnchor).isActive = true
        
        
        rightContainerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        rightContainerView.leadingAnchor.constraint(equalTo:self.leftContainerView.trailingAnchor, constant:10).isActive = true
        rightContainerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        rightContainerView.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        
        ltpLabel.topAnchor.constraint(equalTo:self.rightContainerView.topAnchor, constant: 5).isActive = true
        ltpLabel.leadingAnchor.constraint(equalTo:self.rightContainerView.leadingAnchor).isActive = true
        ltpLabel.trailingAnchor.constraint(equalTo:self.rightContainerView.trailingAnchor).isActive = true
        
        profitLossLabel.topAnchor.constraint(equalTo:self.ltpLabel.bottomAnchor, constant: 5).isActive = true
        profitLossLabel.leadingAnchor.constraint(equalTo:self.rightContainerView.leadingAnchor).isActive = true
        profitLossLabel.trailingAnchor.constraint(equalTo:self.rightContainerView.trailingAnchor).isActive = true
        
    }
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
