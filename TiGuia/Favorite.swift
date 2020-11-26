//
//  Favorite.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation
import SwiftUI

class Favorites {
    
    var subcategories: [Subcategory]
    var subcategory: Subcategory
    
    init() {
        subcategories = []
        subcategory = Subcategory()
    }
    
    func returnSubcategories() -> [Subcategory] {
        return self.subcategories
    }
    
    func addSubcategory(subcategory: Subcategory) {
        self.subcategories.append(subcategory)
        print("adicionou caralho")
    }
    
    func removeSubcategory(subcategory: Subcategory) {
        for index in 0...(self.subcategories.count-1) {
            if(self.subcategories[index].title == subcategory.title) {
                self.subcategories.remove(at: index)
                print("removeu")
                break
            }
        }
    }
}
