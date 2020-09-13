//
//  FirstViewController.swift
//  Timer Testing
//
//  Created by macbook on 9/13/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    
    let countLabel = UILabel()
    
    // MARK: - DidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        view.backgroundColor = .random()
    }
    
    // MARK: - Methods
    
    private func configureLabel() {
        view.addSubview(countLabel)
        
        countLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        countLabel.heightAnchor.constraint(equalToConstant: 300),
        countLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
