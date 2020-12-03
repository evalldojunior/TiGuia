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
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
                .frame(width: 176, height: 170)
                .cornerRadius(10)
                .offset(x: 14, y: -14)
            
            VStack(alignment: .leading) {
                Text(title)
                    .offset(x: 25, y: -25)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ConteudoMentorView: View {
    
    @State var presented = false
    
    var category = Data().returnCategory()
    var subAreasEscolhidas: [Subcategory]
    
    var collums = [
        // define number of caullum here
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Temas de mentoria")
                .padding()
                .font(.custom("Raleway-Bold", size: 30))
                .foregroundColor(Color("ColorTitles"))
            
            Text("Áreas que você tem conhecimento para ajudar")
                .padding()
                .font(.custom("Raleway-Regular", size: 15))
                .offset(y: -30)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: collums) {
                    ForEach(0..<subAreasEscolhidas.count, id: \.self) { count in
                        Button(action: {
                            self.presented.toggle()
                        }, label: {
                            Image(subAreasEscolhidas[count].image ?? "")
                                .resizable()
                                .frame(width: 176, height: 170)
                                .cornerRadius(10)
                                .padding(14)
                                .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                                .overlay(ImageOverlayConteudo(title: subAreasEscolhidas[count].title), alignment: .bottomLeading)
                        })
                        .fullScreenCover(isPresented: $presented, content: {
                            PaginaConteudoView(category: subAreasEscolhidas[count])
                        })
                    }
                }
            }
            .offset(y: -40)
        }
    }
}
