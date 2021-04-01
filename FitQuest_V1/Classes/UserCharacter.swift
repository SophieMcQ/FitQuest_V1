//
//  UserCharacter.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 4/1/21.
//

import Foundation
import SwiftUI
import Firebase


class UserCharacter: ObservableObject{
    
    // Players will start out with default clothing items, but they can change them later. These include...
    //
    //      hat/helmet
    //      top or top-armour
    //      bottoms or bottom-armour
    //      shoes
    //      weapon (sword, hammer, etc...)
    //
    // Integer values associated with each clothing item will represent which clothing item the player's charactre is currently wearing. The default item is Int = 0
    
    @Published var hat = 0
    @Published var top = 0
    @Published var bottom = 0
    @Published var shoes = 0
    @Published var weapon = 0
        
    init()  {
        
    }
    
    // This function will be called to change the player's outfit
    //
    // typeOfClothing = a string that is equal to one of the above types of clothing
    // newClothingPiece represents the name of the new piece of clothing
    func changeOutfit(typeOfClothing: String, newClothingPiece: String){
           
    }
}
