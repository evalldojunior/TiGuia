//
//  TrailViewController.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 23/11/20.
//

import UIKit

class TrailViewController: UIViewController {
    lazy var contentViewSize = CGSize(width: self.view.frame.width + 1450, height: self.view.frame.height + 380)
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

        //sempre vai ter
        createTickLine(point: CGPoint(x: 50, y: 1210), point2: CGPoint(x: 50, y: 1100))
        createRetangle()
        let button = UIButton(frame: CGRect(x: 33, y: 1060, width: 35, height: 35))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setImage(UIImage(named: "selectedButton"), for: .normal)
        containerView.addSubview(button)
        label(text: "Computação", x: 65, y: 1095)
        //a partir daqui vai depender de onde a pessoa aperta
        inicialTrail()
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
    //braços que ficam ao lado do botao\
    //pensei um jeito de automatizar mais
    func tickSecundaryBranch(point: CGPoint, point2: CGPoint, point3: CGPoint, X: Int, Y: Int) {
        createTickLine(point: point, point2: point2)
        createTickLine(point: point2, point2: point3)
        endCircle(X: X, Y: Y)
    }
    func weakSecundarybranch(point: CGPoint, point2: CGPoint, point3: CGPoint) {
            createWeakLine(point: point, point2: point2)
            createWeakLine(point: point2, point2: point3)
    }
    //qualquer label
    func label(text: String, x: Int, y: Int) {
        let label = UILabel(frame: CGRect(x: x, y: y, width: 100, height: 20))
        label.text = text
        label.textColor = UIColor(red: 33/255, green: 158/255, blue: 188/255, alpha: 1.0)
        label.font = UIFont(name: "Raleway-Bold", size: 15)
        containerView.addSubview(label)
    }
    func inicialTrail() {
        //subcategoria 1
        createWeakLine(point: CGPoint(x: 50, y: 800), point2: CGPoint(x: 50, y: 250))
        weakSecundarybranch(point: CGPoint(x: 50, y: 360), point2: CGPoint(x: 160, y: 360), point3: CGPoint(x: 160, y: 250))
        
        createWeakLine(point: CGPoint(x: 180, y: 820), point2: CGPoint(x: 180, y: 490))
        weakSecundarybranch(point: CGPoint(x: 180, y: 600), point2: CGPoint(x: 290, y: 600), point3: CGPoint(x: 290, y: 490))
        createWeakLine(point: CGPoint(x: 290, y: 820), point2: CGPoint(x: 290, y: 710))
        weakSecundarybranch(point: CGPoint(x: 290, y: 820), point2: CGPoint(x: 400, y: 820), point3: CGPoint(x: 400, y: 710))
        createTickLine(point: CGPoint(x: 50, y: 1055), point2: CGPoint(x: 50, y: 945))
        let button2 = UIButton(frame: CGRect(x: 32, y: 910, width: 35, height: 35))
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.setImage(UIImage(named: "unselectedButton"), for: .normal)
        containerView.addSubview(button2)
        principalBranchSub(point: CGPoint(x: 50, y: 910), point2: CGPoint(x: 50, y: 800), X: 45, Y: 800)
        tickSecundaryBranch(point: CGPoint(x: 70, y: 930), point2: CGPoint(x: 180, y: 930), point3: CGPoint(x: 180, y: 820), X: 175, Y: 820)
        tickSecundaryBranch(point: CGPoint(x: 180, y: 930), point2: CGPoint(x: 290, y: 930), point3: CGPoint(x: 290, y: 820), X: 285, Y: 820)
        
        //subcategoria2
        createWeakLine(point: CGPoint(x: 510, y: 825), point2: CGPoint(x: 510, y: 275))
        weakSecundarybranch(point: CGPoint(x: 510, y: 385), point2: CGPoint(x: 620, y: 385), point3: CGPoint(x: 620, y: 275))
        
        createWeakLine(point: CGPoint(x: 640, y: 845), point2: CGPoint(x: 640, y: 495))
        weakSecundarybranch(point: CGPoint(x: 640, y: 605), point2: CGPoint(x: 750, y: 605), point3: CGPoint(x: 750, y: 495))
        
        createWeakLine(point: CGPoint(x: 750, y: 845), point2: CGPoint(x: 750, y: 735))
        weakSecundarybranch(point: CGPoint(x: 750, y: 845), point2: CGPoint(x: 860, y: 845), point3: CGPoint(x: 860, y: 735))
        createTickLine(point: CGPoint(x: 72, y: 1080), point2: CGPoint(x: 510, y: 1080))
        createTickLine(point: CGPoint(x: 510, y: 1080), point2: CGPoint(x: 510, y: 970))
        let button3 = UIButton(frame: CGRect(x: 492, y: 935, width: 35, height: 35))
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.setImage(UIImage(named: "unselectedButton"), for: .normal)
        containerView.addSubview(button3)
        principalBranchSub(point: CGPoint(x: 510, y: 935), point2: CGPoint(x: 510, y: 825), X: 505, Y: 825)
        tickSecundaryBranch(point: CGPoint(x: 530, y: 955), point2: CGPoint(x: 640, y: 955), point3: CGPoint(x: 640, y: 845), X: 635, Y: 845)
        tickSecundaryBranch(point: CGPoint(x: 640, y: 955), point2: CGPoint(x: 750, y: 955), point3: CGPoint(x: 750, y: 845), X: 745, Y: 845)
        
        //subcategoria3
        createWeakLine(point: CGPoint(x: 950, y: 825), point2: CGPoint(x: 950, y: 275))
        weakSecundarybranch(point: CGPoint(x: 950, y: 385), point2: CGPoint(x: 1060, y: 385), point3: CGPoint(x: 1060, y: 275))
        createWeakLine(point: CGPoint(x: 1060, y: 845), point2: CGPoint(x: 1060, y: 490))
        weakSecundarybranch(point: CGPoint(x: 1060, y: 600), point2: CGPoint(x: 1170, y: 600), point3: CGPoint(x: 1170, y: 490))
        createWeakLine(point: CGPoint(x: 1170, y: 845), point2: CGPoint(x: 1170, y: 735))
        weakSecundarybranch(point: CGPoint(x: 1170, y: 845), point2: CGPoint(x: 1280, y: 845), point3: CGPoint(x: 1280, y: 735))
        createTickLine(point: CGPoint(x: 510, y: 1080), point2: CGPoint(x: 950, y: 1080))
        createTickLine(point: CGPoint(x: 950, y: 1080), point2: CGPoint(x: 950, y: 970))
        let button4 = UIButton(frame: CGRect(x: 932, y: 935, width: 35, height: 35))
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button4.setImage(UIImage(named: "unselectedButton"), for: .normal)
        containerView.addSubview(button4)
        principalBranchSub(point: CGPoint(x: 950, y: 935), point2: CGPoint(x: 950, y: 825), X: 945, Y: 825)
        tickSecundaryBranch(point: CGPoint(x: 970, y: 955), point2: CGPoint(x: 1060, y: 955), point3: CGPoint(x: 1060, y: 845), X: 1055, Y: 845)
        tickSecundaryBranch(point: CGPoint(x: 1060, y: 955), point2: CGPoint(x: 1170, y: 955), point3: CGPoint(x: 1170, y: 845), X: 1165, Y: 845)
        
        //subcategoria 4
        createWeakLine(point: CGPoint(x: 1390, y: 825), point2: CGPoint(x: 1390, y: 275))
        weakSecundarybranch(point: CGPoint(x: 1390, y: 385), point2: CGPoint(x: 1500, y: 385), point3: CGPoint(x: 1500, y: 275))
        createWeakLine(point: CGPoint(x: 1520, y: 845), point2: CGPoint(x: 1520, y: 490))
        weakSecundarybranch(point: CGPoint(x: 1520, y: 600), point2: CGPoint(x: 1630, y: 600), point3: CGPoint(x: 1630, y: 490))
        createWeakLine(point: CGPoint(x: 1630, y: 845), point2: CGPoint(x: 1630, y: 735))
        weakSecundarybranch(point: CGPoint(x: 1630, y: 845), point2: CGPoint(x: 1740, y: 845), point3: CGPoint(x: 1740, y: 735))
        createTickLine(point: CGPoint(x: 950, y: 1080), point2: CGPoint(x: 1390, y: 1080))
        createTickLine(point: CGPoint(x: 1390, y: 1080), point2: CGPoint(x: 1390, y: 970))
        let button5 = UIButton(frame: CGRect(x: 1372, y: 935, width: 35, height: 35))
        button5.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button5.setImage(UIImage(named: "unselectedButton"), for: .normal)
        containerView.addSubview(button5)
        principalBranchSub(point: CGPoint(x: 1390, y: 935), point2: CGPoint(x: 1390, y: 825), X: 1385, Y: 825)
        tickSecundaryBranch(point: CGPoint(x: 1410, y: 955), point2: CGPoint(x: 1520, y: 955), point3: CGPoint(x: 1520, y: 845), X: 1515, Y: 845)
        tickSecundaryBranch(point: CGPoint(x: 1520, y: 955), point2: CGPoint(x: 1630, y: 955), point3: CGPoint(x: 1630, y: 845), X: 1625, Y: 845)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
}
