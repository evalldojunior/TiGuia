//
//  ViewController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 04/11/20.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var onboardingScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    // dados para o onboarding - colocar em um arquivo diferente posteriormente se necessario
    var titlesOnboarding = ["Explore seu futuro","Trilhe o seu caminho","Peça ajuda"]
    var descsOnboarding = ["Com TiGuia seu futuro está em suas mãos, ou melhor, no seu celular! \n Nos últimos anos, o mercado de trabalho mudou bastante e nós separamos as principais áreas em crescimento para você explorar.","Dispomos todo o conteúdo que você precisa, mas é você quem decide o que quer aprender! \n A trilha interativa registra sua evolução e te ajuda a decidir para onde deseja seguir.","Para ajudar na sua decisão, nossos mentores estarão à disposição. \n Uma conversa com profissionais e alunos da área pode sempre clarear nossa jornada, não é mesmo?"]
    var imagesOnboarding = ["screen1.png","screen2.png","screen3.png"]
    
    // pegar o tamanho (dinamico) da scrollView
    override func viewDidLayoutSubviews() {
        scrollWidth = onboardingScrollView.frame.size.width
        scrollHeight = onboardingScrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // chamada da funcao para estilizar o botao pra ficar biito
        buttons(button: startButton)
        
        // status inicial do botao comecar
        startButton.alpha = 0
        startButton.isHidden = true
        
        // chamar a funcao acima viewDidLayoutSubviews() para pegar os valores dinamidos da altura e largura do scrollView
        self.view.layoutIfNeeded()
        
        self.onboardingScrollView.delegate = self
        onboardingScrollView.isPagingEnabled = true
        onboardingScrollView.showsHorizontalScrollIndicator = false
        onboardingScrollView.showsVerticalScrollIndicator = false
        
        // criando as tres paginas do onboarding
        var framePage = CGRect(x: 0, y: 0, width: 0, height: 0)
        for index in 0..<titlesOnboarding.count {
            framePage.origin.x = scrollWidth * CGFloat(index)
            framePage.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let pages = UIView(frame: framePage)
            
            // imagem dda pagina
            let imagePage = UIImageView.init(image: UIImage.init(named: imagesOnboarding[index]))
            imagePage.frame = CGRect(x:0,y:0,width:360,height:380)
            imagePage.contentMode = .scaleAspectFit
            imagePage.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 90)
            
            // titulo da pagina
            let titlePage = UILabel.init(frame: CGRect(x:21,y:imagePage.frame.maxY+20,width:scrollWidth-42,height:35))
            titlePage.textAlignment = .center
            titlePage.font = UIFont(name: "Raleway-Bold", size: 30)
            titlePage.textColor = #colorLiteral(red: 0.1294117647, green: 0.6196078431, blue: 0.737254902, alpha: 1)
            titlePage.text = titlesOnboarding[index]
            
            // descricao da pagina
            let textPage = UILabel.init(frame: CGRect(x:21,y:titlePage.frame.maxY+20,width:scrollWidth-42,height:90))
            textPage.textAlignment = .center
            textPage.numberOfLines = 5
            textPage.font = UIFont(name: "Raleway-Regular", size: 14)
            textPage.text = descsOnboarding[index]
            
            pages.addSubview(imagePage)
            pages.addSubview(titlePage)
            pages.addSubview(textPage)
            onboardingScrollView.addSubview(pages)
        }
        
        // set width of scrollview to accomodate all the slides
        onboardingScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titlesOnboarding.count), height: scrollHeight)
        
        // disable vertical scroll/bounce
        self.onboardingScrollView.contentSize.height = 1.0
        
        // estado inicial
        pageControl.numberOfPages = titlesOnboarding.count
        pageControl.currentPage = 0
        
    }
    
    // botao comecar
    @IBAction func startButton(_ sender: Any) {
        nextViewController()
    }
    
    // botao pular
    @IBAction func skipButton(_ sender: Any) {
        nextViewController()
    }
    
    // funcao de comecar/pular - em teoria é a mesma funcao
    func nextViewController(){
        let vc = storyboard?.instantiateViewController(identifier: "firstVC")
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true)
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        onboardingScrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    // funcoes do scrollVIew
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    func setIndiactorForCurrentPage()  {
        let page = (onboardingScrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
        // aparecer o botao de comecar na ultima pagina
        if page == 2 {
            self.startButton.isHidden = false
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear) {
                self.startButton.alpha = 1
                self.skipButton.alpha = 0
            } completion: { _ in
                self.skipButton.isHidden = true
            }
        }
        // decidir se vai voltar o botao de pular e desaparecer o de comecar
        //        else {
        //            self.skipButton.isHidden = false
        //            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear) {
        //                self.startButton.alpha = 0
        //                self.skipButton.alpha = 1
        //            } completion: { _ in
        //                self.startButton.isHidden = true
        //            }
        //        }
    }
    
    // funcao para evitar repeticao de codigo quando for criar a sombra e a borda dos botoes
    func buttons(button: UIButton){
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

