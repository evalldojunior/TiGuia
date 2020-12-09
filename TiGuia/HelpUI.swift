//
//  HelpUI.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 04/12/20.
//

import Foundation
import SwiftUI

struct HelpUI: View {
    
    @Binding var showModal: Bool
    @State var doubt: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { gmt in
                Rectangle().fill(Color.black.opacity(0.5))
                    .frame(height: gmt.size.height, alignment: .center)
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .center, spacing: 17.0) {
                Text("Qual a sua dúvida?")
                    .font(.custom("Raleway-Bold", fixedSize: 18.0))
                    .foregroundColor(.darkColor)
                HStack(alignment: .center) {
                    TextField("Digite aqui sua dúvida", text: $doubt)
                        .lineLimit(6)
                        .multilineTextAlignment(.leading)
                        .frame(width: 284.0, height: 108.0)
                    
                }
                .padding(.all)
                //            .cornerRadius(10)
                //            .border(Color.titleColor, width: 2)
                //
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.btnColor, lineWidth: 2.0)
                )
                HStack(alignment: .center) {
                    Button(action: {
                        self.showModal = false
                    }){
                        Text("Cancelar")
                            .font(.custom("Raleway-Bold", fixedSize: 18.0))
                            .multilineTextAlignment(.center)
                            .frame(width: 125)
                            .padding(15)
                            .background(Color.white)
                            .foregroundColor(.btnColor)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.btnColor, lineWidth: 2.0)
                            )
                    }//.padding()
                    //Spacer()
                    Button(action: {
                        //enviar doubt pra um mentor
                        //chamar proxiam view
                    }){
                        Text("Enviar")
                            .font(.custom("Raleway-Bold", fixedSize: 18.0))
                            .multilineTextAlignment(.center)
                            .frame(width: 125)
                            .padding(15)
                            .background(Color.btnColor)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                    }//.padding()
                    
                }
            }.padding(30)
            .clipped()
            .background(Color.bgcardColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            //.overlay(RoundedRectangle(cornerRadius:10)
            // .stroke(Color.clear, lineWidth: 2.0)
            //.shadow(radius: 10)
            //)
            
        }
    }
    
}
//struct HelpUI_Previews: PreviewProvider {
//    static var previews: some View {
//        HelpUI()
//    }
//}
