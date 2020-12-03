//
//  AreaMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 30/11/20.
//

import Foundation
import SwiftUI
import UIKit

class MacroAreaMentorViewController: UIViewController {
    
    var macroAreaMentorUIHost: UIHostingController<MacroAreaMentorUIView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        macroAreaMentorUIHost = UIHostingController(rootView: MacroAreaMentorUIView())
        macroAreaMentorUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(macroAreaMentorUIHost!.view)
        
        let constraints = [
            macroAreaMentorUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            macroAreaMentorUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            macroAreaMentorUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            macroAreaMentorUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            macroAreaMentorUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
