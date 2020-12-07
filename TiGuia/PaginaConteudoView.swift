//
//  PaginaConteudoView.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 03/12/20.
//

import Foundation
import SwiftUI
//titulo, conteúdo, links, cards subcategorias, btn favorito
public struct PaginaConteudoView: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    //var category = Data().returnCategory()
    
    //var index:Int
    
    var category:Subcategory
    
    static var favorite = Favorites()
    //var index:Int
    
    
    public var body: some View {
        
        
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
                
//                if !category.subcategories.isEmpty {
//                    HStack{
//                        Text("Categorias")
//                            .font(.custom("Raleway-Bold", size: 20))
//                            .foregroundColor(.titleColor)
//                        Spacer()
//                    }.padding([.top, .leading, .trailing])
                    
                    //                    VStack {
                    //                        LazyVStack {
                    //                            ForEach(0..<category.subcategories.count, id: \.self) { count in
                    //                                SubCardsCategory(category: category, count: count)
                    //                            }
                    //                        }
                    //                    }.padding()
                    //                } else {
                    //                    Spacer(minLength: 30)
                    //                }
                    
                    //                VStack {
                    //                    Button(action: {
                    //                        self.presented.toggle()
                    //                    }, label: {
                    //                        Spacer()
                    //                        Image(systemName: "ellipses.bubble")
                    //                            .resizable()
                    //                            .scaledToFit()
                    //                            .foregroundColor(.lightColor)
                    //                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //                        Text("Pedir ajuda")
                    //                            .font(.custom("Raleway-Bold", size: 18))
                    //                            .foregroundColor(.lightColor)
                    //                        Spacer()
                    //
                    //                    }).padding()
                    //                    .clipped()
                    //                    .background(Color.btnColor)
                    //                    .cornerRadius(10)
                    //                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    //                    .fullScreenCover(isPresented: $presented, content: {
                    //                        //HelpUI()
                    //                    })
                    //                }.padding()
                    
//                    Spacer(minLength: 20)
//
//                }
                //            .navigationBarTitle("", displayMode: .inline)
                //.navigationTitle(Text(""))
                //.navigationBarHidden(true)
                //            .statusBar(hidden: true)
                
            }//.edgesIgnoringSafeArea(.top)
            
        }
        
    }
    
}
