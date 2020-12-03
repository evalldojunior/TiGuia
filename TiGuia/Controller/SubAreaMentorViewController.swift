//
//  SubAreaMentorViewController.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 02/12/20.
//

import Foundation
import SwiftUI

class SubAreaMentorViewController: UIViewController {
    
    var subAreaMentorUIHost: UIHostingController<SubAreaMentorView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        subAreaMentorUIHost = UIHostingController(rootView: SubAreaMentorView(subAreasEscolhidas: AreaMentorView.mentor.subAreas))
        subAreaMentorUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(subAreaMentorUIHost!.view)
        
        let constraints = [
            subAreaMentorUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            subAreaMentorUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            subAreaMentorUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            subAreaMentorUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            subAreaMentorUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
