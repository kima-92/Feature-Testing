//
//  Notes.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/11/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import Foundation

/*
 -  If you want to add a View inside another View :
 
    Remeber the "Outer" View needs to be added to another View first,
    even if it's the VC's view, before you try to add another view inside of it.
 
 -  When adding padding to a LEFT ANCHOR, your most likely gonna have to use a
    negative number for the constant.
 
    While using a positive number, your pushing it further away left. At some point
    it will desappear from the screen
 
 -  If need to constrain to the VC's SAFE AREA instead of it's entire view :
    use "safeAreaLayoutGuide" like so :
        
        "yourButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor"
 */
