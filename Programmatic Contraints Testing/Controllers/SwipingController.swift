//
//  SwipingController.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/13/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        // Register a Cell to this CollectionViewController
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        // Make the cells snap to the edges of the screen,
        // displaying one full cell at a time
        collectionView.isPagingEnabled = true
    }
    
    // Number of items per Section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // Cell for Items
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .red
        return cell
    }
    
    // Determine the size of each Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSize(width: 100, height: 100)
        
        // Make each cell the same size as the entire view
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
