//
//  AreaMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 30/11/20.
//

import Foundation
import SwiftUI
import UIKit

class AreaMentorViewController: UIViewController {
    
    var areaMentorUIHost: UIHostingController<AreaMentorUI>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        areaMentorUIHost = UIHostingController(rootView: AreaMentorUI())
        areaMentorUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(areaMentorUIHost!.view)
        
        let constraints = [
            areaMentorUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            areaMentorUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            areaMentorUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            areaMentorUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            areaMentorUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
