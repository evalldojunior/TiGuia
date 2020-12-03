//
//  TrailHosting.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 02/12/20.
//

import Foundation
import UIKit
import SwiftUI

class TrailHostingController: UIHostingController<CategoryView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: CategoryView(categoryIndex: 0));
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
