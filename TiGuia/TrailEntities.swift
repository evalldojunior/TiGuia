//
//  TrailEntities.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation
import SwiftUI

class Mentor {
   private var name:String = ""
   private var area:String
    //temporário = ""
   private var login:String
    private var password:String
    
    init(name:String,area:String, login:String, password:String) {
        self.name = name
        self.area = area
        self.login = login
        self.password = password
    }
    
    init() {
        self.name = ""
        self.area = ""
        self.login = ""
        self.password = ""
    }
}
struct Link {
    var titulo:String = ""
    var url:String = ""
    var image:Image
}
class Category {
    var title:String
    var content:String
    var image:Image
    var links:[Link]
    
    init() {
        self.title = ""
        self.content = ""
        
    }
