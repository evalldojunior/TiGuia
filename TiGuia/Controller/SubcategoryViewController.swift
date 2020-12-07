//
//  SubcategoryVieeController.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 27/11/20.
//
//
//import SwiftUI
//
//class SubcategoryViewController: UIViewController {
//    
//    var subcategory: UIHostingController<SubcategoryView>?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        subcategory = UIHostingController(rootView: SubcategoryView(index: 0))
//        subcategory?.view.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.view.addSubview(subcategory!.view)
//        
//        let constraints = [
//            subcategory!.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            subcategory!.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
//            subcategory!.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            subcategory!.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            subcategory!.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
//    
//}
//
//struct SubcategoryViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        Text("Hello, World!")
//    }
//}
