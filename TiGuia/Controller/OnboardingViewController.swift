//
//  OnboardingViewController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 24/11/20.
//

import Foundation
import SwiftUI
import UIKit

class OnboardingViewController: UIViewController {
    
    var OnboardingUIHost: UIHostingController<OnboardingUI>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OnboardingUIHost = UIHostingController(rootView: OnboardingUI(["0","1","2"]))
        OnboardingUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(OnboardingUIHost!.view)
        
        let constraints = [
            OnboardingUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            OnboardingUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            OnboardingUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            OnboardingUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            OnboardingUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
