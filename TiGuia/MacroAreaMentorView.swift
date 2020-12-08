//
//  areaMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 30/11/20.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Area Mentor
struct MacroAreaMentorUIView: View {
    
    // @State var didTap = false
    @State private var presented = false
    var teste = Data() //acho que vai precisar apagar essa linha aqui. é que precisa iniciar a classe Data pra poder pegar o arrey de categorias
    var image = ["desktopcomputer", "paintbrush", "desktopcomputer", "paintbrush", "desktopcomputer", "paintbrush"]
    var title = ["Computação", "Design", "Computação", "Design", "Computação", "Design"]
    var descrip = ["Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade...", "Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade...", "Estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas...", "Desenvolve conceitos visuais para peças gráficas e materiais. Se preocupa com funcionalidade..."]
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 75.0)
            HStack {
                Text("O que você deseja mentorar?")
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(width: 300.0, alignment: .leading)
                    .foregroundColor(.darkColor)
                Spacer()
            }
            // scrollview com as macroareas
            ScrollView {
                LazyVStack {
                    ForEach((0..<Data.categories.count)){ index in
                        Button(action: {
                            self.presented.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "\(image[index])") //mudar depois que adicionar uma imagem na categoria no arquivo DATA
                                    .resizable()
                                    .padding(.all, 30.0)
                                    .scaledToFit()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .clipShape(Rectangle(), style: FillStyle())
                                    .background(Color.lightColor)
                                    .cornerRadius(10)
                                    .foregroundColor(.orangeColor)
                                    .shadow(radius: 8)
                                VStack(alignment: .leading) {
                                    Text(Data.categories[index].title)
                                        .font(.custom("Raleway-Bold", size: 24))
                                        .padding([.leading, .bottom, .trailing], 5.0)
                                        .foregroundColor(.lightColor)
                                    
                                    Text(Data.categories[index].content)
                                        .font(.custom("Raleway", size: 14))
                                        .lineLimit(3)
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
                        .shadow(radius: 10)
                        .fullScreenCover(isPresented: $presented, content: {
                            AreaMentorView()
                        })
                        
                    }
                }
                .padding(.all)
                Spacer()
            }
        }
    }
}

//struct NextMentorUI: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        return AreaMentorView()
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//    }
//}

// preview
struct AreaMentorUI_Previews: PreviewProvider {
    static var previews: some View {
        MacroAreaMentorUIView()
    }
}
