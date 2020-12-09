//
//  SubcategoryView.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 24/11/20.
//

import Foundation

import SwiftUI
//titulo, conteúdo, links, cards subcategorias, btn favorito
public struct SubcategoryView: View {
    @State var favorito: Bool
    @State private var presented: Bool = false
    @State var showModal: Bool = false
    @State var completed: Bool = false
    
    //var category = Data().returnCategory()
    
    //var index:Int
    
    var category:Subcategory
    
    //static var favorite = Favorites()
    //var index:Int
    
    
    public var body: some View {
        GeometryReader { geometry in
            
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
                    
                    Button(action: {
                        self.favorito.toggle()
                        if (self.favorito) {
                            Data.favorite.addSubcategory(subcategory: category)
                        } else {
                            Data.favorite.removeSubcategory(subcategory: category)
                        }
                        category.favorite = favorito
                        
                    }, label: {
                        Image(systemName: self.favorito == true ? "star.fill" : "star")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .background(Color.btnColor)
                            .foregroundColor(.lightColor)
                            .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                    })
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .offset(y: -10) // realmente necessario?
                    
                }.padding()
                
                //
                //MARK: -inicio do conteúdo
                //
                
                ScrollView{
                    VStack {
                        Text(category.content)
                            .font(.custom("Raleway-Regular", size: 15))
                            .multilineTextAlignment(.leading)
                            //.padding()
                            .foregroundColor(.darkColor)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding()
                    
                    HStack{
                        Text("Links úteis")
                            .multilineTextAlignment(.leading)
                            .font(.custom("Raleway-Bold", size: 20))
                            .foregroundColor(.titleColor)
                        Spacer()
                    }.padding([.top, .leading, .trailing])
                    
                    SubCardLink(category: category)
                    
                    if !category.subcategories.isEmpty {
                        HStack{
                            Text("Categorias")
                                .font(.custom("Raleway-Bold", size: 20))
                                .foregroundColor(.titleColor)
                            Spacer()
                        }.padding([.top, .leading, .trailing])
                        
                        VStack {
                            LazyVStack {
                                ForEach(0..<category.subcategories.count, id: \.self) { count in
                                    SubCardsCategory(category: category, count: count)
                                }
                            }
                        }.padding()
                    } else {
                        Spacer(minLength: 30)
                    }
                    
                    VStack {
                        Button(action: {
                            self.showModal.toggle()
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
//                        .fullScreenCover(isPresented: $presented, content: {
//                            //HelpUI()
//                        })
                    }.padding()
                    
                    Spacer(minLength: 20)
                    
                }//.edgesIgnoringSafeArea(.top)
                .navigationBarTitle("", displayMode: .inline)
                //.navigationTitle(Text(""))
                //.navigationBarHidden(true)
                .statusBar(hidden: true)
                
            }//.edgesIgnoringSafeArea(.top)
            .overlay(HelpUI(showModal: $showModal, completed: $completed).opacity(showModal ? 1 : 0).frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).animation(.easeInOut(duration: 0.3)))
            .overlay(DoubtSentUI(completed: $completed).opacity(completed ? 1 : 0).frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).animation(.easeInOut(duration: 0.3)))
        }
        
        
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

//    var helloColor: UIColor{
//        if didTap {
//            return .red
//        }else{
//            return .blue
//        }
//    }


//struct Subcategory_Previews: PreviewProvider {
//    static var previews: some View {
//        SubcategoryView()
//    }
//}
