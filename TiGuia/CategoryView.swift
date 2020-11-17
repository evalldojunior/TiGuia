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
    let titleColor = Color(red: 0.12, green: 0.62, blue: 0.74, opacity: 1.0)
    let btnColor = Color(red: 0.11, green: 0.46, blue: 0.54, opacity: 1.0)
    let lightColor = Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0)
    let textColor = Color(red: 0.12, green: 0.13, blue: 0.15, opacity: 1.0)
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            HStack {
                Text("Computação")
                   // .fontWeight(.bold)
                    .foregroundColor(titleColor)
                    //.font(.title)
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "star")
                        .resizable()
                        .padding(8)
                        .background(btnColor)
                        .foregroundColor(lightColor)
                        .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                })
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .offset(y: -10)
            }
            ScrollView(){
                
            
            Text("Ciência da Computação é a ciência que estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas, que automatizem os processos e desenvolvam soluções de processamento de dados de entrada e saída pautado no computador, de forma que se transforme em informação.")
                .font(.custom("Raleway-Regular", size: 15))
                .padding([.leading, .bottom, .trailing])
                .foregroundColor(textColor)
                Text("Links úteis")
                    .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .font(.custom("Raleway-Bold", size: 20))
                .foregroundColor(titleColor)
            ScrollView(.horizontal){
                HStack{
                    CardLink()
                        .padding([.leading, .top])
                    CardLink()
                        .padding([.leading, .bottom, .top])
                    CardLink()
                        .padding([.leading, .bottom, .top])
                    
                }
            }
            
            Text("Categorias")
                .padding(.horizontal)
                .font(.custom("Raleway-Bold", size: 20))
                .foregroundColor(titleColor)
                
            CardCategory()
                .padding()
                .shadow(radius: 10, x: 0, y: 4)
            CardCategory()
                .padding()
                .shadow(radius: 10, x: 0, y: 4)
                CardCategory()
                    .padding()
                    .shadow(radius: 10, x: 0, y: 4)
           
        Spacer()

        }
            
        }
       
    }
    
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
