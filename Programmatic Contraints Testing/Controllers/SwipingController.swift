//
//  SwipingController.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/13/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    let imageNames = ["paws", "blackHearts", "blackLeaf"]
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        // Register a Cell to this CollectionViewController
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        // Make the cells snap to the edges of the screen,
        // displaying one full cell at a time
        collectionView.isPagingEnabled = true
    }
    
    // Setup the space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Number of items per Section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageNames.count
    }
    
    // Cell for Items
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Casting the cell as a PageCollectionViewCell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? PageCollectionViewCell else { return UICollectionViewCell()
        }
        
        // Pass in the correct image 
        let imageName = imageNames[indexPath.item]
        cell.mainImageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    // Determine the size of each Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSize(width: 100, height: 100)
        
        // Make each cell the same size as the entire view
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
