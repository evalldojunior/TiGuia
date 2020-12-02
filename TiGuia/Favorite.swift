//
//  Favorite.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation
import SwiftUI

class Favorite {
    
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
    }
}
