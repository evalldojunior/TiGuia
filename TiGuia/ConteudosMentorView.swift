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

struct ConteudoMentor: View {
    
    @State var presented = false
    
    let subcategory = Favorites().returnSubcategories()
        
    var imageFavorite = ["seguranca","cienciadedados","firewall","robotica"]
    
    var titleFavorite = ["Segurança \nda Informação", "Ciência de dados", "Gerenciamento \nde Firewall", "Robótica"]
    
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
                    ForEach(0..<imageFavorite.count, id: \.self) { count in
                        Button(action: {
                            self.presented.toggle()
                        }, label: {
                            Image(imageFavorite[count])
                                .resizable()
                                .frame(width: 176, height: 170)
                                .cornerRadius(10)
                                .padding(14)
                                .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                                .overlay(ImageOverlayConteudo(title: titleFavorite[count]), alignment: .bottomLeading)
                        })
                        .fullScreenCover(isPresented: $presented, content: {
                            NxtUI()
                        })
                    }
                }
            }
            .offset(y: -40)
        }
    }
}
 
// codigo para mostrar a view controller junto com o .fullScreenCover mostrado acima no botao
struct NxtUI: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return FavoriteViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct ConteudoMentor_Previews: PreviewProvider {
    static var previews: some View {
        ConteudoMentor()
    }
}
