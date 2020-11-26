//
//  CardCategoryViewController.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 26/11/20.
//

import Foundation
import SwiftUI
import UIKit

class CardCategoryViewController: UIViewController {
    
    var macroAreaUIHost: UIHostingController<CategoryView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        macroAreaUIHost = UIHostingController(rootView: CategoryView())
        macroAreaUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(macroAreaUIHost!.view)
        
        let constraints = [
            macroAreaUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            macroAreaUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            macroAreaUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            macroAreaUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            macroAreaUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
