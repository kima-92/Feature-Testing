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
 
 
 -  Since we are not using the Storyboards for this App, we have to construct it from
    scratch in the SceneDelegate file :
        
        Go to the SceneDelegate file
 
        Inside the "willConnectTo" function :
        
            1.   Name the property in the guard-let statement as -> "windowScene"
            2.   Create a new window -> which will hold/display our ViewControllers,
                with the frame/bounds of the windowScene
            3.   Set the window's windoScene
            4.   Add some Root ViwController to the window
            5.   Make the window visible
            6.
            7.
            8.
 */
