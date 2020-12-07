//
//  ChatHostingController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 03/12/20.
//

import Foundation
import UIKit
import SwiftUI

class ChatHostingController: UIHostingController<ContentView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: ContentView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
