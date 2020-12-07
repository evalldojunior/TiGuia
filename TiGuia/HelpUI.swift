//
//  HelpUI.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 04/12/20.
//

import Foundation
import SwiftUI

struct HelpUI: View {
    
    @State var doubt: String = ""
    
    var body: some View {
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
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.btnColor, lineWidth: 2.0)
            )
            HStack(alignment: .center) {
                Button(action: {
                    //voltar pra pagina anterior
                }){
                    Text("Cancelar")
                        .font(.custom("Raleway-Bold", fixedSize: 18.0))
                        .multilineTextAlignment(.center)
                        .padding(15)
                        .background(Color.white)
                        .foregroundColor(.btnColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.btnColor, lineWidth: 2.0)
                        )
                }.padding()
                Button(action: {
                    //enviar doubt pra um mentor
                    //chamar proxiam view
                }){
                    Text("Enviar")
                        .font(.custom("Raleway-Bold", fixedSize: 18.0))
                        .multilineTextAlignment(.center)
                        .padding(15)
                        .background(Color.btnColor)
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                }.padding()
            }
        }.padding(30)
        .overlay(RoundedRectangle(cornerRadius:10)
                .stroke(Color.clear, lineWidth: 2.0)
                .shadow(radius: 10)
        )
    }
    
}
struct HelpUI_Previews: PreviewProvider {
    static var previews: some View {
        HelpUI()
    }
}
