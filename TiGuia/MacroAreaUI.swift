//
//  MacroArea.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 17/11/20.
//

import Foundation
import UIKit
import SwiftUI

struct MacroAreaUI: View {
    
    // @State var didTap = false
    @State private var presented = false
    
    var image = ["desktopcomputer", "paintbrush", "desktopcomputer", "paintbrush", "desktopcomputer", "paintbrush"]
    var title = ["Computação", "Design", "Computação", "Design", "Computação", "Design"]
    var descrip = ["Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade...", "Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade...", "Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade..."]
    
    let backgroundColor = Color(red: 28/255, green: 118/255, blue: 144/255, opacity: 1.0)
    let lightColor = Color(red: 252/255, green: 252/255, blue: 252/255, opacity: 1.0)
    let orangeColor = Color(red: 251/255, green: 153/255, blue: 28/255, opacity: 1.0)
    let blackColor = Color(red: 32/255, green: 34/255, blue: 38/255, opacity: 1.0)
    
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
                    .foregroundColor(blackColor)
                Spacer()
            }
            ScrollView{
                LazyVStack {
                    ForEach((0..<title.count)){ index in
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "\(image[index])")
                                    .resizable()
                                    .padding(.all, 30.0)
                                    .scaledToFit()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                                    .background(lightColor)
                                    .cornerRadius(10)
                                    .foregroundColor(orangeColor)
                                    .shadow(radius: 8)
                                VStack(alignment: .leading) {
                                    Text(title[index])
                                        .font(.custom("Raleway-Bold", size: 24))
                                        .padding([.leading, .bottom, .trailing], 5.0)
                                        .foregroundColor(lightColor)
                                    
                                    Text(descrip[index])
                                        .font(.custom("Raleway-Medium", size: 14))
                                        .padding([.leading, .bottom, .trailing], 5.0)
                                        .foregroundColor(lightColor)
                                    
                                }
                                Spacer()
                            }
                            .padding()
                            .clipped()
                            .background(backgroundColor)
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


struct MacroAreaUI_Previews: PreviewProvider {
    static var previews: some View {
        MacroAreaUI()
    }
}
