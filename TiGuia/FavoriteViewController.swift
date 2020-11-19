//
//  FavoriteViewController.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 16/11/20.
//

import Foundation
import SwiftUI

class FavoriteViewController: UIViewController {
    
    var favorite: UIHostingController<Favorite>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        favorite = UIHostingController(rootView: Favorite())
        favorite?.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(favorite!.view)
        
        let constraints = [
            favorite!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            favorite!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            favorite!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            favorite!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            favorite!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}

struct FavoriteViewController_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
