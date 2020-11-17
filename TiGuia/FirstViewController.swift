//
//  FirstViewController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 16/11/20.
//

import Foundation
import UIKit
import SwiftUI

class FirstViewController: UIViewController {
    
    var studentMentorUIHost: UIHostingController<StudentMentorUI>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentMentorUIHost = UIHostingController(rootView: StudentMentorUI())
        studentMentorUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(studentMentorUIHost!.view)
        
        let constraints = [
            studentMentorUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            studentMentorUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            studentMentorUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            studentMentorUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            studentMentorUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
//    @objc func tapStudent(sender: UITapGestureRecognizer) {
//        let vc = storyboard?.instantiateViewController(identifier: "secondVC")
//        vc!.modalPresentationStyle = .fullScreen
//        present(vc!, animated: true)
//    }
    
}
