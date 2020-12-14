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
    
    var cardCategoryUIHost: UIHostingController<CategoryView>?
    var categoryInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCategoryUIHost = UIHostingController(rootView: CategoryView(categoryIndex: categoryInt))
        cardCategoryUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(cardCategoryUIHost!.view)
        
        let constraints = [
            cardCategoryUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            cardCategoryUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            cardCategoryUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            cardCategoryUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            cardCategoryUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
        
//        self.view.insetsLayoutMarginsFromSafeArea = false
//        let constraints2 = [
//            cardCategoryUIHost!.view.topAnchor.constraint(equalTo: self.view.topAnchor),
//            //cardCategoryUIHost!.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            cardCategoryUIHost!.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            cardCategoryUIHost!.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            cardCategoryUIHost!.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//        ]
        //NSLayoutConstraint.activate(constraints2)
        
//        cardCategoryUIHost!.view.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
//        cardCategoryUIHost!.view.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
//        cardCategoryUIHost!.view.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
//        cardCategoryUIHost!.view.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
//
        
        
    }
}
