//
//  CardLink.swift
//  
//
//  Created by Dara Vasconcelos on 16/11/20.
//

import SwiftUI

struct ImageOverlayCardLink: View {
    
    var title: String
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1.0), Color.black.opacity(0.2)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Rectangle().fill(gradient)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.lightColor)
                        .font(.custom("Raleway-Regular", size: 14))
                        .lineLimit(3)
                        //.frame(width: 140, height: 55, alignment: .bottomLeading)
                        .padding(9.0)
                }
            }
        }
    }
}

struct CardLink: View {
    
    @Environment(\.openURL) private var openURL
    var category:Category
    
    var body: some View {
        //  ZStack{
        HStack{
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<category.links.count, id: \.self) { count in
                        Button(action: {
                            let stringUrl = (category.links[count].url).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                            openURL(URL(string: stringUrl!)!)
                        }, label: {
                            Image(category.links[count].image!)
                                .resizable()
                                .frame(width: 164, height: 121)
                                .cornerRadius(10)
                                .overlay(ImageOverlayCardLink(title: category.links[count].titulo), alignment: .bottomLeading)
                        })
                        
                    }.padding(.trailing, 5.0)
                    .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 8, x: 0.0, y: 4.0)
                }
                .padding(.all)
            }
        }
    }
}

//struct CardLink_Previews: PreviewProvider {
//    static var previews: some View {
//        //CardLink()
//    }
//}
