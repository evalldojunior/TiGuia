//
//  PageViewController.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 19/11/20.
//

import Foundation
import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var texto = ["Socorro", "Por favor pega logo", "que inferno mermao"]
    
    static var previews: some View {
        ContainerView(["0", "1", "2"])
    }
}


struct TitlePage: View {
    var title: String
    
    let backgroundColor = Color(red: 28/255, green: 118/255, blue: 144/255, opacity: 1.0)
    let lightColor = Color(red: 252/255, green: 252/255, blue: 252/255, opacity: 1.0)
    let orangeColor = Color(red: 251/255, green: 153/255, blue: 28/255, opacity: 1.0)
    let blackColor = Color(red: 32/255, green: 34/255, blue: 38/255, opacity: 1.0)
    let lightBlueColor = Color(red: 33/255, green: 158/255, blue: 188/255, opacity: 1.0)
    
    var titlesOnboarding = ["Explore seu futuro","Trilhe o seu caminho","Peça ajuda"]
    var descsOnboarding = ["Com TiGuia seu futuro está em suas mãos, ou melhor, no seu celular! \n Nos últimos anos, o mercado de trabalho mudou bastante e nós separamos as principais áreas em crescimento para você explorar.","Dispomos todo o conteúdo que você precisa, mas é você quem decide o que quer aprender! \n A trilha interativa registra sua evolução e te ajuda a decidir para onde deseja seguir.","Para ajudar na sua decisão, nossos mentores estarão à disposição. \n Uma conversa com profissionais e alunos da área pode sempre clarear nossa jornada, não é mesmo?"]
    var imagesOnboarding = ["screen1","screen2","screen3"]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image(imagesOnboarding[Int(title)!])
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            Text(titlesOnboarding[Int(title)!])
                .font(.custom("Raleway-Bold", size: 30))
                .foregroundColor(lightBlueColor)
                .padding()
            //Spacer()
            //.frame(height: 35)
            Text(descsOnboarding[Int(title)!])
                .font(.custom("Raleway", size: 14))
                .foregroundColor(blackColor)
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing])
            
        }
    }
}

struct ContainerView: View {
    
    var controllers: [UIHostingController<TitlePage>]
    @State var currentPage = 0
    //@Binding var teste = $currentPage
    
    init(_ titles: [String]) {
        self.controllers = titles.map { UIHostingController(rootView: TitlePage(title: $0)) }
    }
    
    var body: some View {
        VStack{
            PageViewController(controllers: self.controllers, currentPage: $currentPage)
            PageControl(numberOfPages: controllers.count, currentPage: $currentPage)
        }
        
    }
}

struct PageViewController: UIViewControllerRepresentable {
    
    
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    typealias UIViewControllerType = UIPageViewController
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        let parent: PageViewController
        
        init(_ parent: PageViewController) {
            self.parent = parent
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = self.parent.controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 {
                return self.parent.controllers.last
            }
            return self.parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = self.parent.controllers.firstIndex(of: viewController) else { return nil }
            if index == self.parent.controllers.count - 1 {
                return self.parent.controllers.first
            }
            return self.parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = parent.controllers.firstIndex(of: visibleViewController)
            {
                parent.currentPage = index
            }
        }
    }
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    let backgroundColor = Color(red: 28/255, green: 118/255, blue: 144/255, opacity: 1.0)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = #colorLiteral(red: 0.1098039216, green: 0.462745098, blue: 0.5647058824, alpha: 1)
        control.pageIndicatorTintColor = UIColor.lightGray
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

//struct PageControl: UIViewRepresentable {
//    var numberOfPages: Int
//    @Binding var currentPage: Int
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIView(context: Context) -> UIPageControl {
//        let control = UIPageControl()
//        control.numberOfPages = numberOfPages
//        control.pageIndicatorTintColor = UIColor.lightGray
//        control.currentPageIndicatorTintColor = UIColor.darkGray
//        control.addTarget(
//            context.coordinator,
//            action: #selector(Coordinator.updateCurrentPage(sender:)),
//            for: .valueChanged)
//
//        return control
//    }
//
//    func updateUIView(_ uiView: UIPageControl, context: Context) {
//        uiView.currentPage = currentPage
//    }
//
//    class Coordinator: NSObject {
//        var control: PageControl
//
//        init(_ control: PageControl) {
//            self.control = control
//        }
//        @objc
//        func updateCurrentPage(sender: UIPageControl) {
//            control.currentPage = sender.currentPage
//        }
//    }
//}
//
//struct PageView<Page: View>: View {
//    var viewControllers: [UIHostingController<Page>]
//    @State var currentPage = 0
//    init(_ views: [Page]) {
//        self.viewControllers = views.map { UIHostingController(rootView: $0) }
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            PageViewController(controllers: viewControllers, currentPage: $currentPage)
//            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
//        }
//    }
//}
//
//struct PageViewController: UIViewControllerRepresentable {
//    var controllers: [UIViewController]
//    @Binding var currentPage: Int
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> UIPageViewController {
//        let pageViewController = UIPageViewController(
//            transitionStyle: .scroll,
//            navigationOrientation: .horizontal)
//        pageViewController.dataSource = context.coordinator
//        pageViewController.delegate = context.coordinator
//
//        return pageViewController
//    }
//
//    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
//        guard !controllers.isEmpty else {
//            return
//        }
//        context.coordinator.parent = self
//        pageViewController.setViewControllers(
//            [controllers[currentPage]], direction: .forward, animated: true)
//    }
//
//    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
//        var parent: PageViewController
//
//        init(_ pageViewController: PageViewController) {
//            self.parent = pageViewController
//        }
//
//        func pageViewController(
//            _ pageViewController: UIPageViewController,
//            viewControllerBefore viewController: UIViewController) -> UIViewController? {
//            guard let index = parent.controllers.firstIndex(of: viewController) else {
//                return nil
//            }
//            if index == 0 {
//                return parent.controllers.last
//            }
//            return parent.controllers[index - 1]
//        }
//
//        func pageViewController(
//            _ pageViewController: UIPageViewController,
//            viewControllerAfter viewController: UIViewController) -> UIViewController? {
//            guard let index = parent.controllers.firstIndex(of: viewController) else {
//                return nil
//            }
//            if index + 1 == parent.controllers.count {
//                return parent.controllers.first
//            }
//            return parent.controllers[index + 1]
//        }
//
//        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//            if completed,
//                let visibleViewController = pageViewController.viewControllers?.first,
//                let index = parent.controllers.firstIndex(of: visibleViewController) {
//                parent.currentPage = index
//            }
//        }
//    }
//}
//
//struct CardView: View {
//    var album: Album
//    var body: some View {
//        URLImage(URL(string: album.albumArtWork)!)
//            .resizable()
//            .aspectRatio(3 / 2, contentMode: .fit)
//    }
//}
