//
//  DoubtSentUI.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 07/12/20.
//

import Foundation
import SwiftUI

struct DoubtSentUI: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 17.0){
            Text("Sua solicitação foi enviada")
                .font(.custom("Raleway-Bold", fixedSize: 18.0))
                .foregroundColor(.darkColor)
            Text("Assim que o mentor(a) estiver disponível, o chat entrará na aba de Mentoria")
                .font(.custom("Raleway-Regular", size: 15.0))
                .multilineTextAlignment(.center)
                .padding(.all, 40.0)
            
            Button(action: {
                //chamar pagina de conteudo
            }, label: {
                Text("Fechar")
                    .font(.custom("Raleway-Bold", fixedSize: 18.0))
                    .multilineTextAlignment(.center)
                    .padding(15)
                    .background(Color.btnColor)
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
                    .padding()
            })
        } .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.clear, lineWidth: 2.0)
                .shadow(radius: 10))
        
    }
}


struct DoubtSentUI_Previews: PreviewProvider {
    static var previews: some View {
        DoubtSentUI()
    }
}
