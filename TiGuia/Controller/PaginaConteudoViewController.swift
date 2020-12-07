//
//  PaginaConteudoViewController.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 03/12/20.
//
//
//import Foundation
//import SwiftUI
//import UIKit
//
//class PaginaConteudoViewController: UIViewController {
//
//    var paginaConteudoUIHost: UIHostingController<PaginaConteudoView>?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        paginaConteudoUIHost = UIHostingController(rootView: PaginaConteudoView(index: ))
//        paginaConteudoUIHost?.view.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(paginaConteudoUIHost!.view)
//
//        let constraints = [
//            paginaConteudoUIHost!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            paginaConteudoUIHost!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
//            paginaConteudoUIHost!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            paginaConteudoUIHost!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            paginaConteudoUIHost!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
//}
