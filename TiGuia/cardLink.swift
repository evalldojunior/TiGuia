//
//  CardLink.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 16/11/20.
//

import SwiftUI

struct CardLink: View {
    var body: some View {
       Image("qual-curso-escolher")
        .resizable()
       // .scaledToFit()
        .frame(width: 164, height: 121, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .clipShape(Rectangle())
        .cornerRadius(10)
        .scaledToFill()
        

        
    
        
    }
}

struct CardLink_Previews: PreviewProvider {
    static var previews: some View {
        CardLink()
    }
}
