//
//  SubAreaMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 01/12/20.
//

import Foundation
import SwiftUI

struct AreaMentorView: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    var category = Data().returnCategory()
//    var index:Int
    
    let titleColor = Color("titleColor")
    let btnColor = Color("btnColor")
    let lightColor = Color("lightColor")
    let textColor = Color("darkColor")
    
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
                
                VStack {
                    CardsAreaMentor(category: category)
                        .padding(.bottom, 10.0)
                        .shadow(radius: 10, x: 0, y: 4)
                } .padding([.bottom, .trailing])
                
                Button(action: {
                    self.presented.toggle()
                }, label: {
                    Spacer()
                    Text("Continuar")
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

struct AreaMentorView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMentorView()
    }
}
