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
    var image:Image?
    var links:[Link]
    var favorite:Bool
    var visited:Bool
    
    init() {
        self.title = ""
        self.content = ""
        self.links = []
        self.favorite = false
        self.visited = false
    }
    
    init(title:String,content:String,links:[Link]) {
        self.title = title
        self.content = content
        self.links = links
        self.favorite = false
        self.visited = false
    }
    
    func visite(){
        self.visited = true
    }
    
    func makeFavorite(){
        self.favorite = true
    }
}
