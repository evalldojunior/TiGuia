//
//  MacroAreaStudentHostingController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 03/12/20.
//

import Foundation
import SwiftUI
import UIKit

class MacroAreaStudentHostingController: UIHostingController<MacroAreaUI> {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: MacroAreaUI());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
