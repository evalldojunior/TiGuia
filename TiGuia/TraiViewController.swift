//
//  TraiViewController.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 20/11/20.
//

import UIKit

class TraiViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createLine1()
        createRetangle()
        createLine2()
        let button = UIButton(frame: CGRect(x: 33, y: 608, width: 35, height: 35))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setImage(UIImage(named: "selectedButton"), for: .normal)
        self.view.addSubview(button)
        
        let button2 = UIButton(frame: CGRect(x: 33, y: 475, width: 35, height: 35))
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setImage(UIImage(named: "unselectedButton"), for: .normal)
        self.view.addSubview(button2)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    func createRetangle() {
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 50, y: 750))
        //Cria uma linha entre o ponto inicial e o ponto direito
        path1.addLine(to: CGPoint(x: 60, y: 760))
        // cria uma linha entre o ponto direito e o ponto debaixo
        path1.addLine(to: CGPoint(x: 50, y: 770))
        // cria uma linha entre o ponto debaixo e o ponto esquerdo
        path1.addLine(to: CGPoint(x: 40, y: 760))
        // Fecha o caminho, criando a ultima linha.
        path1.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path1.cgPath
        shapeLayer.fillColor = UIColor(named: "raisinBlack")?.cgColor
        
        view.layer.addSublayer(shapeLayer)
    }
    func createLine1() {
        let path2 = UIBezierPath()
        //ponto que começa
        path2.move(to: CGPoint(x: 50, y: 650))
        //ponto que vai ligar a linha
        path2.addLine(to: CGPoint(x: 50, y: 760))
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.blue.cgColor
        shapeLayer2.strokeColor = UIColor(named: "blueGreen")?.cgColor
        shapeLayer2.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer2)
    }
    func createLine2() {
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: 50, y: 490))
        path3.addLine(to: CGPoint(x: 50, y: 600))
        
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.path = path3.cgPath
        shapeLayer3.fillColor = UIColor.blue.cgColor
        shapeLayer3.strokeColor = UIColor(named: "blueGreen")?.cgColor
        shapeLayer3.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer3)
    }
    
}
