//
//  Mentor.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation

class Mentor {
   var name:String
    var area:String
    //temporário 
   var login:String
    var password:String
    
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
