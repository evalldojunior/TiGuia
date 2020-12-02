//
//  Student.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 18/11/20.
//

import Foundation

class Student{
    var name:String
     //temporário
    var login:String
     var password:String
    var percurse:[Subcategory]
    
    init() {
        self.name = ""
        self.login = ""
        self.password = ""
        self.percurse = []
    }
    init(name:String,login:String,password:String) {
        self.name = name
        self.login = login
        self.password = password
        self.percurse = []
    }
    
}
