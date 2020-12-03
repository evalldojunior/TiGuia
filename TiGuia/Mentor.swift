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
    var subAreas: [Subcategory]
    var login:String
    var password:String
    
    init(name:String,area:String, login:String, password:String) {
        self.name = name
        self.area = area
        self.subAreas = []
        self.login = login
        self.password = password
    }
    
    init() {
        self.name = ""
        self.area = ""
        self.subAreas = []
        self.login = ""
        self.password = ""
    }
    
    func addSubArea(subcategory: Subcategory) {
        self.subAreas.append(subcategory)
    }
    
    func removeSubArea(subcategory: Subcategory) {
        for index in 0...(self.subAreas.count-1) {
            if(self.subAreas[index].title == subcategory.title) {
                self.subAreas.remove(at: index)
                break
            }
        }
        
    }
    
}
