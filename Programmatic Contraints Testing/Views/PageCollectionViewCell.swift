//
//  PageCollectionViewCell.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/13/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .purple
    }
    
    // Required init Swift will have you code
    // when overriding an init in a CollectionViewcell
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
