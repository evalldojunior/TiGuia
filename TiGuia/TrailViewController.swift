//
//  TrailViewController.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 23/11/20.
//

import UIKit

class TrailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //esses dois primeiros sempre vao existir
        createTickLine(point: CGPoint(x: 50, y: 760), point2: CGPoint(x: 50, y: 650))
        createRetangle()
        //a partir daqui vai depender de onde a pessoa aperta
        createTickLine(point: CGPoint(x: 50, y: 600), point2: CGPoint(x: 50, y: 490))
        let button = UIButton(frame: CGRect(x: 33, y: 608, width: 35, height: 35))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setImage(UIImage(named: "selectedButton"), for: .normal)
        self.view.addSubview(button)
        
        let button2 = UIButton(frame: CGRect(x: 33, y: 470, width: 35, height: 35))
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setImage(UIImage(named: "unselectedButton"), for: .normal)
        self.view.addSubview(button2)
        //teste
        createWeakLine(point: CGPoint(x: 50, y: 40), point2: CGPoint(x: 50, y: 90))
        endCircle(X: 50, Y: 400)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    //nao vou automatizar o quadrado, porque so tem um, ele sempre vai ficar no mesmo ponto
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
        shapeLayer.fillColor = UIColor(named: "darkColor")?.cgColor
        
        view.layer.addSublayer(shapeLayer)
    }
    //funcao pra linha caminho trilhado
    func createTickLine(point: CGPoint, point2: CGPoint) {
        let path = UIBezierPath()
        path.move(to: point)
        path.addLine(to: point2)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor(named: "titleColor")?.cgColor
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
    }
    //funcao pra linha mais fraquinha
    func createWeakLine(point: CGPoint, point2: CGPoint) {
        let path = UIBezierPath()
        path.move(to: point)
        path.addLine(to: point2)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor(named: "lbColor")?.cgColor
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
    }
    func endCircle(X: Int, Y: Int) {
        let path = UIBezierPath(ovalIn: CGRect(x: X, y: Y, width: 8, height: 8))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor(named: "titleColor")?.cgColor
        view.layer.addSublayer(shapeLayer)
    }
}
