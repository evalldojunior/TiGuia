//
//  PaginaConteudoMentor.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 08/12/20.
//

import Foundation
import SwiftUI
//titulo, conteúdo, links, cards subcategorias, btn favorito
public struct PaginaConteudoMentor: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    //var category = Data().returnCategory()
    
    //var index:Int
    
    var category:Subcategory
    
    static var favorite = Favorites()
    //var index:Int
    
    @Environment(\.openURL) private var openURL
    var collums = [
        // define number of caullum here
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    
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
                            .lineSpacing(3)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding()
                    
                    HStack{
                        Text("Links úteis")
                            .multilineTextAlignment(.leading)
                            .font(.custom("Raleway-Bold", size: 20))
                            .foregroundColor(.titleColor)
                        Spacer()
                    }.padding([.top, .leading, .trailing])
                    
                    VStack{
                        LazyVGrid(columns: collums, alignment: .center, spacing: 0) {
                            ForEach(0..<category.links.count, id: \.self) { count in
                                Button(action: {
                                    let stringUrl = (category.links[count].url).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                    openURL(URL(string: stringUrl!)!)
                                }, label: {
                                    Image(category.links[count].image!)
                                        .resizable()
                                        .frame(width: (geometry.size.width/2) - 25, height: 170)
                                        .cornerRadius(10)
                                        //.shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                                        .overlay(ImageOverlayCardLink(title: category.links[count].titulo), alignment: .bottomLeading)
                                })
                                
                            }.padding(.bottom)
                            .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 8, x: 0.0, y: 4.0)
                        }.padding()
                    }
                    
                }//.edgesIgnoringSafeArea(.top)
                //.navigationBarTitle("", displayMode: .inline)
                //.statusBar(hidden: true)
            }.navigationBarTitle("", displayMode: .inline)
            //.navigationTitle(Text(""))
            //.navigationBarHidden(true)
            .statusBar(hidden: true)
            
        }
        
        
    }
    
}
