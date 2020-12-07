//
//  CategoryView.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 16/11/20.
//

//import Foundation
import SwiftUI
//titulo, conteúdo, links, cards subcategorias, btn favorito
struct CategoryView: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    var categoryIndex: Int = 0 //tirar o =0 depois 
    //let category = Data.categories[categoryIndex]
    
    // VARIAVEL QUE INICIALIZA TODOS OS DADOS - MOVER E APAGAR DEPOIS
    // ta sendo inicalizada na macroarea ate agora
    var socorro = Data()
    
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                var category = Data.categories[categoryIndex] //nao sei se é aqui, mas acho que sim pq nos outros lugares nao pegava
                ScrollView {
                    GeometryReader { gmt in
                        Rectangle().fill(Color.gray.opacity(0.5))
                            .frame(height: geometry.size.height, alignment: .center) // aqui antes era  geometry.size.height / 4 + 30
                            .edgesIgnoringSafeArea(.top)
                            .offset(y: gmt.frame(in: .global).minY > 0 ? -gmt.frame(in: .global).minY : 0)
                    }.frame(height: geometry.size.height / 4 + 30)
//                    VStack {
//                        Rectangle().fill(Color.gray.opacity(0.5))
//                            .frame(height: geometry.size.height / 4 + 30, alignment: .center)
//                            .edgesIgnoringSafeArea(.top)
//                            //.padding(.bottom, -(geometry.safeAreaInsets.top))
//                    }
                    VStack {
                        //
                        //MARK: -Header - titulo + botao de favoritos
                        //
                        HStack {
                            //título
                            Text(category.title)
                                .foregroundColor(.titleColor)
                                .font(.custom("Raleway-Bold", size: 30))
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }.padding()
                        //
                        //MARK: -inicio do conteúdo
                        //
                        
                        VStack {
                            ScrollView{
                                //VStack{
                                VStack {
                                    Text(category.content)
                                        .font(.custom("Raleway-Regular", size: 15))
                                        .multilineTextAlignment(.leading)
                                        //.padding()
                                        .foregroundColor(.darkColor)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    
                                }.padding()
                                //.frame(width: 372, height: 148, alignment: .leading)
                                
                                HStack{
                                    Text("Links úteis")
                                        .multilineTextAlignment(.leading)
                                        .font(.custom("Raleway-Bold", size: 20))
                                        .foregroundColor(.titleColor)
                                    Spacer()
                                }.padding([.top, .leading, .trailing])
                                //
                                //MARK: -"colection" de links
                                //
                                CardLink(category: category)
                                
                                //
                                //MARK: -subcategorias
                                //
                                HStack{
                                    Text("Categorias")
                                        .font(.custom("Raleway-Bold", size: 20))
                                        .foregroundColor(.titleColor)
                                    Spacer()
                                }.padding([.top, .leading, .trailing])
                                
                                
                                VStack {
                                    LazyVStack {
                                        ForEach(0..<category.subcategories.count, id: \.self) { count in
                                            CardsCategory(category: category, count: count)
                                        }
                                    }
                                }.padding()
                                
                                
                                
                                //
                                //MARK: -botao de pedir ajuda
                                //
                                VStack {
                                    Button(action: {
                                        self.presented.toggle()
                                    }, label: {
                                        Spacer()
                                        Image(systemName: "ellipses.bubble")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.lightColor)
                                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Text("Pedir ajuda")
                                            .font(.custom("Raleway-Bold", size: 18))
                                            .foregroundColor(.lightColor)
                                        Spacer()
                                        
                                    }).padding()
                                    .clipped()
                                    .background(Color.btnColor)
                                    .cornerRadius(10)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .fullScreenCover(isPresented: $presented, content: {
                                        //HelpUI()
                                    })
                                }.padding()
                                //.edgesIgnoringSafeArea(.bottom)
                                
                                //  }
                                //.padding(.trailing)
                                //Spacer()
                                
                                Spacer(minLength: 20)
                            }

                        }//.frame(height: geometry.size.height - ((geometry.size.height / 5)))
                        //.frame(height: geometry.size.height - ((geometry.size.height / 4) + 30))
                        
                    }//.frame(height: geometry.size.height - ((geometry.size.height / 5)))
                    .clipped()
                    .background(Color.backgroundColor) // ta mostrando o fundo de cores diferentes
                    .cornerRadius(25, corners: [.topLeft, .topRight])
//                    .offset(x: 0, y: -35)
                    .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 15, x: 0.0, y: -5.0)
                    
                }.edgesIgnoringSafeArea(.top)
                //.navigationBarTitle("", displayMode: .inline)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                //.navigationBarBackButtonHidden(true)
                
            }
        }.accentColor(.titleColor)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear(perform: {
//            let appearance = UINavigationBarAppearance()
//            appearance.shadowColor = .clear
//            UINavigationBar.appearance().standardAppearance = appearance
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            //UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        })
        
        
    }
}

//codigo pra apresentar a view controller de pedir ajuda
//    struct HelpUI: UIViewControllerRepresentable {
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return //view de pedir ajuda
//        }
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//        }
//    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(categoryIndex: 0)
    }
}

// MARK: - arrendondar bordas especificas
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
