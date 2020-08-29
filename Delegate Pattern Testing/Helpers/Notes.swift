//
//  Notes.swift
//  Delegate Pattern Testing
//
//  Created by macbook on 8/29/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

/*
 
 MARK: - Delegate Protocol
 
    Its a one-to-one communication pattern
 
    If your interested in a one-to-many communication pattern, look up Notifications and Observers
 
 
 * You NEED some setup in both the BOSS screen and the INTERN screen:
 
    In the BOSS screen:
 
        1. Make the Protocol            -> A list of functions the INTERN needs to have, in order to conform to this protocol
 
        2. No code inside the Protocol  -> these functions will not have code inside, this protocol is just a LIST of functions
 
        3. A Delegate variable          -> This delegate will act as the INTERN, inside the BOSS VC
 
    In the INTERN screen:
 
        1. Set the INTERN as the BOSS's delegate -> Either in the prepare(for segue), or however you segued to the BOSS VC
 
        2. Conform to the Protocol you created in the BOSS VC
 
        3. Code these new functions     -> Code what you want to execute in the INTERN VC, based on what you got from the BOSS VC
 
 
 
    * When the function is called inside the BOSS VC, it will excecute the code you wrote for this function in the INTERN VC.
    * What ever parameters you gave this function inside the BOSS VC, you will have (the same parameters) in the INTERN VC when this function is called

 */
