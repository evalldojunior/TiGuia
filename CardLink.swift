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
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
                .frame(width: 164, height: 121)
                .cornerRadius(10)
                //.offset(x: 8, y: -8)
            
            VStack(alignment: .leading) {
                Text(title)
                    //.offset(x: 25, y: -25)
                    .foregroundColor(.lightColor)
                    .font(.custom("Raleway-SemiBold", size: 14))
                    .frame(width: 140, height: 55, alignment: .bottomLeading)
                    .padding(9.0)
            }
        }
    }
}

struct CardLink: View {
    
    let lightColor = Color("lightColor")
    var category:Category
    
    var row = [
        // define number of caullum here
        GridItem(.flexible())
    ]
    
    var body: some View {
        //  ZStack{
        HStack{
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<category.links.count, id: \.self) { count in
                        Button(action: {
                            //  self.presented.toggle()
                        }, label: {
                            Image(category.links[count].image!)
                                .resizable()
                                .frame(width: 164, height: 121)
                                .cornerRadius(10)
                                //.shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                                .overlay(ImageOverlayCardLink(title: category.links[count].titulo), alignment: .bottomLeading)
                        })
                        
                    }.padding(.trailing, 5.0)
                    .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 8, x: 0.0, y: 4.0)
                }
                .padding(.all)
            }
        }
//        VStack(alignment: .leading) {
//            ScrollView(.horizontal) {
//                LazyHGrid(rows: row) {
//                    ForEach(0..<category.links.count, id: \.self) { count in
//                        Button(action: {
//                            //  self.presented.toggle()
//                        }, label: {
//                            Image(category.links[count].image!)
//                                .resizable()
//                                .frame(width: 164, height: 121)
//                                .cornerRadius(10)
//                                .padding(8)
//                                .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
//                                .overlay(ImageOverlayCardLink(title: category.links[count].titulo), alignment: .bottomLeading)
//                        })
//
//                    }
//                    // }
//                }
//
//            }
//        }
    }
}

//struct CardLink_Previews: PreviewProvider {
//    static var previews: some View {
//        //CardLink()
//    }
//}