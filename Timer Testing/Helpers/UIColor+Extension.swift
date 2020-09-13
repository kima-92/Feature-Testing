//
//  UIColor+Extension.swift
//  Timer Testing
//
//  Created by macbook on 9/13/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        let red: CGFloat = .random(in: 0...1)
        let green: CGFloat = .random(in: 0...1)
        let blue: CGFloat = .random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
