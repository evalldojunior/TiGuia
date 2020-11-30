//
//  ConteudosMentorViewController.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 30/11/20.
//

import Foundation
import SwiftUI
import UIKit

class ConteudoViewController: UIViewController {
    
    var conteudoUIHost: UIHostingController<ConteudoMentor>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conteudoUIHost = UIHostingController(rootView: ConteudoMentor())
        conteudoUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(conteudoUIHost!.view)
        
        let constraints = [
            conteudoUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            conteudoUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            conteudoUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            conteudoUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            conteudoUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
