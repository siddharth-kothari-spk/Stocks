//
//  ViewController.swift
//  Stocks
//
//  Created by sidkotha on 06/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager().startLoad { result in
            switch result {
            case .success(let data):
                print("success data: \(data)")
            case .failure(let error):
                print("error : \(error.localizedDescription)")
            }
        }
    }


}

