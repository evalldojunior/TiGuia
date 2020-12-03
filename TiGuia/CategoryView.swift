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
    var socorro = Data()
    
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                var category = Data.categories[categoryIndex] //nao sei se é aqui, mas acho que sim pq nos outros lugares nao pegava
                ScrollView {
                    VStack {
                        Rectangle().fill(Color.blue)
                            .frame(height: geometry.size.height / 4 + 30, alignment: .center)
                            .edgesIgnoringSafeArea(.top)
                            //.padding(.bottom, -(geometry.safeAreaInsets.top))
                    }
                    
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
