//
//  Subcategory.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation
import SwiftUI

class Subcategory {
    var title:String
    var content:String
    var image:String?
    var links:[Link]
    var subcategories:[Subcategory]
    var favorite:Bool
    var visited:Bool
    
    init() {
        self.title = ""
        self.content = ""
        self.links = []
        self.favorite = false
        self.visited = false
        self.subcategories = []
    }
    
    init(title:String,content:String,links:[Link]) {
        self.title = title
        self.content = content
        self.links = links
        self.favorite = false
        self.visited = false
        self.subcategories = []
    }
    
    func visite(){
        self.visited = true
    }
    
    func makeFavorite(){
        self.favorite = true
    }
}
