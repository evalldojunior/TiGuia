//
//  Category.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation
import SwiftUI


class Category {
    var title:String
    var content:String
    var image:Image?
    var links:[Link]
    
    init() {
        self.title = ""
        self.content = ""
        self.links = []
    }
    
    init(title:String,content:String,links:[Link]) {
        self.title = title
        self.content = content
        self.links = links
    }
}
