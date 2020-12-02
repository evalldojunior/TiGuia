//
//  SubArea.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 02/12/20.
//

import Foundation
import SwiftUI

struct SubAreaMentorView: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    var category = Data().returnCategory()
    var subAreasEscolhidas: [Subcategory]
        
    let titleColor = Color("titleColor")
    let btnColor = Color("btnColor")
    let lightColor = Color("lightColor")
    let textColor = Color("darkColor")
    
    var columns = [
        // define number of caullum here
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 75.0)
            HStack {
                //título
                Text("Em quais áreas você tem conhecimento para mentorar?")
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(width: 350.0, alignment: .leading)
                    .foregroundColor(.darkColor)
                Spacer()
                
            }
            
            ScrollView {
                ForEach(0..<subAreasEscolhidas.count, id: \.self) { index in
                    HStack {
                        Text(subAreasEscolhidas[index].title)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .font(.custom("Raleway-Bold", size: 20))
                            .foregroundColor(titleColor)
                        Spacer()
                    }
                    VStack {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<subAreasEscolhidas[index].subcategories.count, id: \.self) { count in
                                CardsSubAreaMentor(category: subAreasEscolhidas[index], count: count)
                            }
                        }
                        
                    } .padding()
                }
                
                Button(action: {
                    self.presented.toggle()
                    
                }, label: {
                    Spacer()
                    Text("Finalizar")
                        .font(.custom("Raleway-Bold", size: 18))
                        .foregroundColor(lightColor)
                        .frame(alignment: .center)
                    Spacer()
                    
                }).padding()
                .clipped()
                .background(btnColor)
                .cornerRadius(10)
                .padding()
                .shadow(radius: 10)
                
            }
        }
        
    }
    
}

struct SubAreaMentorView_Previews: PreviewProvider {
    static var previews: some View {
        SubAreaMentorView(subAreasEscolhidas: AreaMentorView.areasEscolhidas)
    }
}
