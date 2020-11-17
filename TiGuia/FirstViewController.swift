//
//  FirstViewController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 16/11/20.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var studentViewButton: UIView!
    @IBOutlet weak var viewImage1: UIView!
    
    @IBOutlet weak var mentorViewButton: UIView!
    @IBOutlet weak var viewImage2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tornar os botoes arredondados e com sombras
        buttons(button: studentViewButton)
        buttons(button: mentorViewButton)
        
        // tornar os quadrados brancos arredondados e com sombras
        buttons(button: viewImage1)
        buttons(button: viewImage2)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapStudent(sender:)))
        studentViewButton.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapStudent(sender: UITapGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(identifier: "secondVC")
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true)
    }
    
    // funcao para colocar as pontas redondas e sombras
    func buttons(button: UIView) {
        //codigo melhorado, porem nao rodando, a sombra fica na frente do botao
        //        let shadowLayer = CAShapeLayer()
        //
        //        button.layer.cornerRadius = 10
        //        shadowLayer.path = UIBezierPath(roundedRect: button.bounds,
        //                                        cornerRadius: button.layer.cornerRadius).cgPath
        //        shadowLayer.shadowPath = shadowLayer.path
        //        shadowLayer.fillColor = view.backgroundColor?.cgColor
        //        shadowLayer.shadowColor = UIColor.black.cgColor
        //        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        //        shadowLayer.shadowOpacity = 0.25
        //        shadowLayer.shadowRadius = 17
        //        button.layer.insertSublayer(shadowLayer, at: 0)
        
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowRadius = 17
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
