//
//  DoubtSentUI.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 07/12/20.
//

import Foundation
import SwiftUI

struct DoubtSentUI: View {
    
    @Binding var completed: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            
            ZStack(alignment: .center) {
                
                GeometryReader { gmt in
                    Rectangle().fill(Color.black.opacity(0.5))
                        .frame(height: gmt.size.height, alignment: .center)
                }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .center){
                    Text("Sua solicitação foi enviada!")
                        .font(.custom("Raleway-Bold", size: 18.0))
                        .foregroundColor(.darkColor)
                        .padding()
                    Text("Assim que o mentor(a) estiver disponível, o chat entrará na aba de Mentoria.")
                        .font(.custom("Raleway-Regular", size: 15.0))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20.0)
                        .lineSpacing(2)

                    
                    Button(action: {
                        self.completed = false
                    }, label: {
                        Text("Fechar")
                            .font(.custom("Raleway-Bold", fixedSize: 18.0))
                            .foregroundColor(.lightColor)
                            .padding(.horizontal)
                    }).padding()
                    .clipped()
                    .background(Color.btnColor)
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                }.padding()
                .clipped()
                .background(Color.bgcardColor)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.clear, lineWidth: 2.0)
//                        .shadow(radius: 10))
            }
        }
        
    }
}


//struct DoubtSentUI_Previews: PreviewProvider {
//    static var previews: some View {
//        DoubtSentUI()
//    }
//}
