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
    @State var favorito: Bool
    @State private var presented: Bool = false
    @State var isExpanded: Bool = false
    @State var truncated: Bool = false
    
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
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.systemLightDark.opacity(0.8), Color.systemLightDark.opacity(0.2)]), startPoint: .center, endPoint: .top)
    }
    
    private func determineTruncation(_ geometry: GeometryProxy) {
        // Calculate the bounding box we'd need to render the
        // text given the width from the GeometryReader.
        let total = self.category.content.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 16)],
            context: nil
        )
        
        if total.size.height > geometry.size.height {
            self.truncated = true
        }
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                //
                //MARK: -Header - titulo + botao de favoritos
                //
//                HStack {
//                    //título
//                    Text(category.title)
//                        .foregroundColor(.titleColor)
//                        .font(.custom("Raleway-Bold", size: 30))
//                        .multilineTextAlignment(.leading)
//
//                    Spacer()
//
//                }.padding()
                
                HStack(alignment: .center) {
                    //título
                    Text(category.title)
                        .foregroundColor(.titleColor)
                        .font(.custom("Raleway-Bold", size: 30))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Spacer()
                    
                    // CODIGO DO BOTAO DE FAVORITOS - apresentando bugs
//                    Button(action: {
//                        self.favorito.toggle()
//                        if (self.favorito) {
//                            Data.favorite.addSubcategory(subcategory: category)
//                        } else {
//                            Data.favorite.removeSubcategory(subcategory: category)
//                        }
//                        category.favorite = favorito
//
//                    }, label: {
//                        Image(systemName: self.favorito == true ? "star.fill" : "star")
//                            .resizable()
//                            .scaledToFit()
//                            .padding(10)
//                            .background(Color.btnColor)
//                            .foregroundColor(.lightColor)
//                            .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .cornerRadius(10)
//                    })
//                    .padding([.top, .trailing])
//                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                    //.offset(y: -10) // realmente necessario?
                    
                }//.padding()
                
                //
                //MARK: -inicio do conteúdo
                //
                
                ScrollView{
                    
                    ZStack(alignment: .bottom) {
                        
                        VStack {
                            Text(category.content)
                                .font(.custom("Raleway-Regular", size: 15))
                                .multilineTextAlignment(.leading)
                                //.padding()
                                .foregroundColor(.darkColor)
                                .lineLimit(self.isExpanded ? nil : 10)
                                .lineSpacing(3)
                                .fixedSize(horizontal: false, vertical: true)
                                .background(GeometryReader { geometry in
                                    Color.clear.onAppear {
                                        self.determineTruncation(geometry)
                                    }
                                })
                            if self.truncated {
                                Spacer(minLength: self.isExpanded ? 30 : 20)
                            }
                        }.padding([.top, .leading, .trailing])
                        
                        if self.truncated {
                            Button(action: {
                                if !isExpanded {
                                    //self.limit = 200
                                    //self.isExpanded.toggle()
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.isExpanded.toggle()
                                    }
                                } else {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        self.isExpanded.toggle()
                                    }
                                    //                                    self.limit = 10
                                    //                                    self.isExpanded.toggle()
                                }
                            }, label: {
                                if !isExpanded {
                                    ZStack (alignment: .bottom){
                                        Rectangle().fill(gradient)
                                            .frame(width: geometry.size.width, height: 50)
                                        
                                        HStack {
                                            Spacer()
                                            Text("Continuar lendo")
                                                .font(.custom("Raleway-Regular", size: 15))
                                                .foregroundColor(.btnColor)
                                            Spacer()
                                        }.padding([.leading, .trailing])
                                        
                                    }
                                } else {
                                    VStack {
                                        HStack {
                                            //Spacer()
                                            Text("Ver menos")
                                                .font(.custom("Raleway-Regular", size: 15))
                                                .foregroundColor(.btnColor)
                                                .padding(.top)
                                            Spacer()
                                        }.padding(.horizontal)
                                    }
                                    
                                }
                            })
                            
                        }
                    }
                    
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
                    
                    //Spacer(minLength: 100)
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
                //.navigationBarTitle("", displayMode: .inline)
                //.statusBar(hidden: true)
            }.navigationBarTitle("", displayMode: .inline)
            //.navigationTitle(Text(""))
            //.navigationBarHidden(true)
            .statusBar(hidden: true)
            
        }
        
        
    }
    
}
