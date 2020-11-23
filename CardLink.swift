//
//  CardLink.swift
//  
//
//  Created by Dara Vasconcelos on 16/11/20.
//

import SwiftUI

struct ImageOverlay: View {
    
    var title: String
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
                .frame(width: 164, height: 121)
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


struct CardLink: View {
    var cor1 = Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1)
    var cor2 = Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 0)
    let lightColor = Color("lightColor")
    
    var imageFavorite = ["qual-curso-escolher","qual-curso-escolher","qual-curso-escolher","qual-curso-escolher"]
    
    var titleFavorite = ["Segurança \nda Informação", "Ciência de dados", "Gerenciamento \nde Firewall", "Robótica"]
    
    var row = [
        // define number of caullum here
        GridItem(.flexible())
    ]
    
    var body: some View {
      //  ZStack{
            VStack (alignment: .leading){
                ScrollView(.horizontal) {
                    LazyHGrid(rows: row) {
                        ForEach(0..<imageFavorite.count, id: \.self) { count in
                            Button(action: {
                              //  self.presented.toggle()
                            }, label: {
                                Image(imageFavorite[count])
                                    .resizable()
                                    .frame(width: 164, height: 121)
                                    .cornerRadius(10)
                                    .padding(14)
                                    .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                                    .overlay(ImageOverlay(title: titleFavorite[count]), alignment: .bottomLeading)
                            })
                          
                        }
                   // }
                }
                    
            }                
        }
    }
}

struct CardLink_Previews: PreviewProvider {
    static var previews: some View {
        CardLink()
    }
}
