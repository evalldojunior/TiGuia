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
    let titleColor = Color(red: 0.12, green: 0.62, blue: 0.74, opacity: 1.0)
    let btnColor = Color(red: 0.11, green: 0.46, blue: 0.54, opacity: 1.0)
    let lightColor = Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0)
    let textColor = Color(red: 0.12, green: 0.13, blue: 0.15, opacity: 1.0)
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                //título
                Text("Computação")
                    .foregroundColor(titleColor)
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
                
                //Botao de favoritos
                Button(action: {
                    self.favorito.toggle()
                }, label: {
                    Image(systemName: self.favorito == true ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .background(btnColor)
                        .foregroundColor(lightColor)
                        .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                })
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .offset(y: -10)
            }
            ScrollView{
                VStack{
                    Text("Ciência da Computação é a ciência que estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas, que automatizem os processos e desenvolvam soluções de processamento de dados de entrada e saída pautado no computador, de forma que se transforme em informação.")
                        .font(.custom("Raleway-Regular", size: 15))
                        .padding([.leading, .bottom, .trailing])
                        .foregroundColor(textColor)
                    
                    HStack{
                        Text("Links úteis")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .font(.custom("Raleway-Bold", size: 20))
                            .foregroundColor(titleColor)
                        Spacer()
                    }
                    
                    //"colection" de links
                    ScrollView(.horizontal){
                        
                        HStack{
                            
                            CardLink()
                                .padding(.trailing, 8.0)
                                .shadow(radius: 10, x: 0, y: 4)
                            CardLink()
                                .padding(.trailing, 8.0)
                                .shadow(radius: 10, x: 0, y: 4)
                            CardLink()
                                .padding(.trailing, 8.0)
                                .shadow(radius: 10, x: 0, y: 4)
                            
                        }.padding(.horizontal)
                        
                    }
                    
                    HStack{
                        Text("Categorias")
                            .padding([.leading, .bottom, .trailing])
                            .font(.custom("Raleway-Bold", size: 20))
                            .foregroundColor(titleColor)
                        Spacer()
                    }
                    
                    VStack{
                        CardCategory()
                            .padding(.bottom, 10.0)
                            .shadow(radius: 10, x: 0, y: 4)
                        CardCategory()
                            .padding(.bottom, 10.0)
                            .shadow(radius: 10, x: 0, y: 4)
                        CardCategory()
                            .padding(.bottom, 10.0)
                            .shadow(radius: 10, x: 0, y: 4)
                        
                    }.padding([.leading, .bottom, .trailing])
                    
                    
                    Button(action: {
                        self.presented.toggle()
                    }, label: {
                        Spacer()
                        Image(systemName: "ellipses.bubble")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(lightColor)
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Pedir ajuda")
                            .font(.custom("Raleway-Bold", size: 18))
                            .foregroundColor(lightColor)
                        Spacer()
                        
                    }).padding()
                    .clipped()
                    .background(btnColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .fullScreenCover(isPresented: $presented, content: {
                        //HelpUI()
                    })
                    
                }
                Spacer()
                
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
