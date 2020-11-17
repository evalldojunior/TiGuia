//
//  CardLink.swift
//  
//
//  Created by Dara Vasconcelos on 16/11/20.
//

import SwiftUI

struct CardLink: View {
    var cor1 = Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1)
    var cor2 = Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 0)
    let lightColor = Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0)
    
    var body: some View {
        ZStack{
            VStack (alignment: .leading){
                Image("qual-curso-escolher")
                 .resizable()
                // .scaledToFit()
                 .frame(width: 164, height: 121, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                 .clipShape(Rectangle())
                 .scaledToFill()
                    .overlay(LinearGradient(gradient: Gradient(colors: [cor2, cor1]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(10)
                Text("Qual curso escolher")
                    .foregroundColor(lightColor)
                    .font(.custom("Raleway-SemiBold", size: 14))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .offset(y: -50)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 155, maxWidth: 155, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 32, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    
            }
                
        }
            
            
    }
}

struct CardLink_Previews: PreviewProvider {
    static var previews: some View {
        CardLink()
    }
}
