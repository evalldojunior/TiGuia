//
//  FavoriteList.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 17/11/20.
//

import Foundation
import SwiftUI

struct ImageOverlay: View {
    
    var titleFavorite = ["aaa", "aaaaa", "aaaa", "aaaaaaaa"]
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                Text("aaaaaaaadsafasfas")
//                ForEach(0..<titleFavorite.count, id: \.self) { count in
//                    Text(titleFavorite[count])
                    .offset(x: 25, y: -25)
                    .foregroundColor(.white)
                }
            }
        }
    }
    
    struct Favorite: View {
        
        var imageFavorite = ["seguranca","cienciadedados","firewall","robotica"]
        
        var collums = [
            // define number of caullum here
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        var body: some View {
            
            VStack(alignment: .leading) {
                Text("Favoritos")
                    .padding()
                    .font(.custom("Raleway-Bold", size: 30))
                    .foregroundColor(Color("ColorTitles"))
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: collums) {
                        ForEach(0..<imageFavorite.count, id: \.self) { count in
                            Image(imageFavorite[count])
                                .resizable()
                                .frame(width: 176, height: 170)
                                .cornerRadius(10)
                                .padding(14)
                                .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: 0.0, y: 4.0)
                                .overlay(ImageOverlay(), alignment: .bottomLeading)
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    struct Favorite_Previews: PreviewProvider {
        static var previews: some View {
            Favorite()
        }
        
    }
