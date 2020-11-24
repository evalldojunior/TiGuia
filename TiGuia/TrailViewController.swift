//
//  TrailViewController.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 23/11/20.
//

import UIKit

class TrailViewController: UIViewController {
    lazy var contentViewSize = CGSize(width: self.view.frame.width + 380, height: self.view.frame.height + 400)
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.setContentOffset(CGPoint(x: 0, y: 425), animated: true)
        return view
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        //toda linha tem 110 de comprimento (diferença de x ou y)
        //sempre vai ter
        createTickLine(point: CGPoint(x: 50, y: 1210), point2: CGPoint(x: 50, y: 1100))
        createRetangle()
        let button = UIButton(frame: CGRect(x: 33, y: 1060, width: 35, height: 35))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setImage(UIImage(named: "selectedButton"), for: .normal)
        containerView.addSubview(button)
        label(text: "Computação", x: 65, y: 1095)
        //a partir daqui vai depender de onde a pessoa aperta
        //subcategoria 1
        createTickLine(point: CGPoint(x: 50, y: 1055), point2: CGPoint(x: 50, y: 945))
        let button2 = UIButton(frame: CGRect(x: 32, y: 910, width: 35, height: 35))
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setImage(UIImage(named: "unselectedButton"), for: .normal)
        containerView.addSubview(button2)
        principalBranchSub(point: CGPoint(x: 50, y: 910), point2: CGPoint(x: 50, y: 800), X: 45, Y: 800)
        secundaryBranchSub(point: CGPoint(x: 70, y: 930), point2: CGPoint(x: 180, y: 930), point3: CGPoint(x: 180, y: 930), point4: CGPoint(x: 180, y: 820), X: 175, Y: 820)
        secundaryBranchSub(point: CGPoint(x: 180, y: 930), point2: CGPoint(x: 290, y: 930), point3: CGPoint(x: 290, y: 930), point4: CGPoint(x: 290, y: 820), X: 285, Y: 820)
        //subcategoria 2
        createTickLine(point: CGPoint(x: 72, y: 1080), point2: CGPoint(x: 400, y: 1080))
        createTickLine(point: CGPoint(x: 400, y: 1080), point2: CGPoint(x: 400, y: 970))
        let button3 = UIButton(frame: CGRect(x: 382, y: 935, width: 35, height: 35))
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.setImage(UIImage(named: "unselectedButton"), for: .normal)
        containerView.addSubview(button3)
        principalBranchSub(point: CGPoint(x: 400, y: 935), point2: CGPoint(x: 400, y: 825), X: 395, Y: 825)
        secundaryBranchSub(point: CGPoint(x: 420, y: 955), point2: CGPoint(x: 530, y: 955), point3: CGPoint(x: 530, y: 955), point4: CGPoint(x: 530, y: 845), X: 525, Y: 845)
        secundaryBranchSub(point: CGPoint(x: 530, y: 955), point2: CGPoint(x: 640, y: 955), point3: CGPoint(x: 640, y: 955), point4: CGPoint(x: 640, y: 845), X: 635, Y: 845)
        
        //linhas finas - teste
        createWeakLine(point: CGPoint(x: 50, y: 800), point2: CGPoint(x: 50, y: 470))
        createWeakLine(point: CGPoint(x: 50, y: 580), point2: CGPoint(x: 160, y: 580))
        createWeakLine(point: CGPoint(x: 160, y: 580), point2: CGPoint(x: 160, y: 470))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    //nao vou automatizar o quadrado, porque so tem um, ele sempre vai ficar no mesmo ponto
    func createRetangle() {
        //45 graus
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 50, y: 1200))
        path1.addLine(to: CGPoint(x: 60, y: 1210))
        path1.addLine(to: CGPoint(x: 50, y: 1220))
        path1.addLine(to: CGPoint(x: 40, y: 1210))
        path1.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path1.cgPath
        shapeLayer.fillColor = UIColor(named: "darkColor")?.cgColor
        containerView.layer.addSublayer(shapeLayer)
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
        containerView.layer.addSublayer(shapeLayer)
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
        containerView.layer.addSublayer(shapeLayer)
    }
    //circulo pequeno no fim da trilha
    func endCircle(X: Int, Y: Int) {
        let path = UIBezierPath(ovalIn: CGRect(x: X, y: Y, width: 10, height: 10))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor(named: "titleColor")?.cgColor
        containerView.layer.addSublayer(shapeLayer)
    }
    //Braço da trilha que fica em cima do botao
    func principalBranchSub(point: CGPoint, point2: CGPoint, X: Int, Y: Int) {
        createTickLine(point: point, point2: point2)
        endCircle(X: X, Y: Y)
    }
    //braços que ficam ao lado do botao
    func secundaryBranchSub(point: CGPoint, point2: CGPoint, point3: CGPoint, point4: CGPoint, X: Int, Y: Int) {
        createTickLine(point: point, point2: point2)
        createTickLine(point: point3, point2: point4)
        endCircle(X: X, Y: Y)
    }
    //qualquer label
    func label(text: String, x: Int, y: Int) {
        let label = UILabel(frame: CGRect(x: x, y: y, width: 100, height: 20))
        label.text = text
        label.textColor = UIColor(red: 33/255, green: 158/255, blue: 188/255, alpha: 1.0)
        label.font = UIFont(name: "Raleway-Bold", size: 15)
        containerView.addSubview(label)
    }
    
}
