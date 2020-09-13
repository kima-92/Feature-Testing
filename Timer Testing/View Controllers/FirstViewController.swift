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
    var timer: Timer!
    var counter = 0
    
    // MARK: - DidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel()
        view.backgroundColor = .random()
        
        // Setting up the Timer to fire off after 1 second,
        // and repeat is true, so you NEED to invalidate at some point
        // or it will go on forever somewhere in memory
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeBackground), userInfo: nil, repeats: true)
        
        // Invalidating the timer after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.timer.invalidate()
        }
    }
    
    // MARK: - Methods
    
    @objc private func incrementCounterLabel() {
        counter += 1
        countLabel.text = String(counter)
    }
    
    @objc private func changeBackground() {
        view.backgroundColor = .random()
    }
    
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
