//
//  CardCategory.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 17/11/20.
//

import SwiftUI

struct CardCategory: View {
    let lightColor = Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0)
    let textColor = Color(red: 0.12, green: 0.13, blue: 0.15, opacity: 1.0)
    var body: some View {
        VStack{
            HStack{
                Image("qual-curso-escolher")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                VStack(alignment: .leading){
                    Text("Segurança da Informação")
                        .font(.custom("Raleway-SemiBold", size: 16))
                        .padding([.leading, .bottom, .trailing], 5.0)
                        .foregroundColor(textColor)
                        
                    Text("É a área responsável por montar uma  barreira de segurança para que dados não estejam ao alcance de golpistas e ataques digitais.")
                        .font(.custom("Raleway-Regular", size: 14))
                        .padding(.horizontal, 5.0)
                        .foregroundColor(textColor)
                        
                }
                
            }
            .padding()
            .clipped()
            .background(lightColor)
            .cornerRadius(10)


            
        }
       
    }
}

struct CardCategory_Previews: PreviewProvider {
    static var previews: some View {
        CardCategory()
    }
}
