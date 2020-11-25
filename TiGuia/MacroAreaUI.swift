//
//  MacroArea.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 17/11/20.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Macro Area
struct MacroAreaUI: View {
    
    // @State var didTap = false
    @State private var presented = false
    
    var image = ["desktopcomputer", "paintbrush", "desktopcomputer", "paintbrush", "desktopcomputer", "paintbrush"]
    var title = ["Computação", "Design", "Computação", "Design", "Computação", "Design"]
    var descrip = ["Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade...", "Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade...", "Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade..."]
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 75.0)
            HStack {
                Text("O que você deseja explorar?")
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(width: 280.0, alignment: .leading)
                    .foregroundColor(.darkColor)
                Spacer()
            }
            // scrollview com as macroareas
            ScrollView{
                LazyVStack {
                    ForEach((0..<title.count)){ index in
                        Button(action: {
                            // falta implementar as funcoes dos botoes.
                        }, label: {
                            HStack {
                                Image(systemName: "\(image[index])")
                                    .resizable()
                                    .padding(.all, 30.0)
                                    .scaledToFit()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                                    .background(Color.lightColor)
                                    .cornerRadius(10)
                                    .foregroundColor(.orangeColor)
                                    .shadow(radius: 8)
                                VStack(alignment: .leading) {
                                    Text(title[index])
                                        .font(.custom("Raleway-Bold", size: 24))
                                        .padding([.leading, .bottom, .trailing], 5.0)
                                        .foregroundColor(.lightColor)
                                    
                                    Text(descrip[index])
                                        .font(.custom("Raleway", size: 14))
                                        .padding([.leading, .bottom, .trailing], 5.0)
                                        .foregroundColor(.lightColor)
                                    
                                }
                                Spacer()
                            }
                            .padding()
                            .clipped()
                            .background(Color.btnColor)
                            .cornerRadius(10)
                        }).padding(.bottom, 20.0)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
    }
}

// preview
struct MacroAreaUI_Previews: PreviewProvider {
    static var previews: some View {
        MacroAreaUI()
    }
}
