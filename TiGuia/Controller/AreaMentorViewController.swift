//
//  SubareaMentorViewController.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 01/12/20.
//

//import Foundation
//import SwiftUI
//
//class AreaMentorViewController: UIViewController {
//
//    var areaMentorUIHost: UIHostingController<AreaMentorView>?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        areaMentorUIHost = UIHostingController(rootView: AreaMentorView())
//        areaMentorUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(areaMentorUIHost!.view)
//
//        let constraints = [
//            areaMentorUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            areaMentorUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
//            areaMentorUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            areaMentorUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            areaMentorUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
//
//}

import Foundation
import UIKit
import SwiftUI

class AreaMentorViewController: UIHostingController<AreaMentorView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: AreaMentorView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
