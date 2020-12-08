//
//  ConteudosMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 30/11/20.
//

import Foundation
import SwiftUI

struct ImageOverlayConteudo: View {
    
    var title: String
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Rectangle().fill(gradient)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(10)
                //.offset(x: 14, y: -14)
                
                VStack(alignment: .leading) {
                    Text(title)
                        //.offset(x: 25, y: -25)
                        .foregroundColor(.lightColor)
                        .padding([.leading, .bottom], 9.0)
                }
            }
        }
    }
}

struct ConteudoMentorView: View {
    
    @State var presented = false
    @State var selection: Int? = nil
    
    var category = Data().returnCategory()
    var subAreasEscolhidas: [Subcategory]
    
    var collums = [
        // define number of caullum here
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                
                VStack(alignment: .leading) {
                    Spacer(minLength: 20)
                    
                    VStack (alignment: .leading){
                        Text("Temas de mentoria")
                            .font(.custom("Raleway-Bold", size: 30))
                            .foregroundColor(Color("ColorTitles"))
                        
                        Text("Áreas que você tem conhecimento para ajudar")
                            .font(.custom("Raleway-Regular", size: 15))
                    }.padding()
                    
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: collums) {
                            ForEach(0..<subAreasEscolhidas.count, id: \.self) { count in
                                NavigationLink(destination: PaginaConteudoView(category: subAreasEscolhidas[count]), tag: count, selection: $selection) {
                                    Button(action: {
                                        //self.presented.toggle()
                                        self.selection = count
                                    }, label: {
                                        Image(subAreasEscolhidas[count].image ?? "")
                                            .resizable()
                                            .frame(width: (geometry.size.width/2) - 25, height: 170)
                                            .cornerRadius(10)
                                            .overlay(ImageOverlayConteudo(title: subAreasEscolhidas[count].title), alignment: .bottomLeading)
                                    })
                                    
                                }
                                //                            .fullScreenCover(isPresented: $presented, content: {
                                //                                PaginaConteudoView(category: subAreasEscolhidas[count])
                                //                            })
                            }.padding(.bottom)
                            .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                        }.padding()
                        //.aspectRatio(1, contentMode: .fit)
                    }//.edgesIgnoringSafeArea(.bottom)
                    //.offset(y: -40)
                }.navigationBarTitle("")
                .navigationBarHidden(true)
                //.navigationBarBackButtonHidden(true)
            }
            
        }.accentColor(.titleColor)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear(perform: {
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        })
        
    }
}
