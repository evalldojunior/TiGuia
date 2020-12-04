//
//  MacroAreaStudentHostingController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 03/12/20.
//

import Foundation
import SwiftUI
import UIKit

protocol MacroAreaDelegate{
    func finishMacroArea()
}

class MacroAreaStudentHostingController: UIHostingController<MacroAreaUI>, MacroAreaDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: MacroAreaUI());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func finishMacroArea() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "tabBar_vc", case let nextVC = segue.destination as? TabBarViewController {
//            }
//        }
}
