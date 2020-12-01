//
//  CardCategory.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 17/11/20.
//

import SwiftUI

//struct CardCategory: View {
//    let lightColor = Color("lightColor")
//    let textColor = Color("darkColor")
//
//    var imageFavorite = ["qual-curso-escolher","qual-curso-escolher","qual-curso-escolher","qual-curso-escolher"]
//
//    var titleFavorite = ["Segurança \nda Informação", "Ciência de dados", "Gerenciamento \nde Firewall", "Robótica"]
//
//    var conteudo = ["aaaaaaaaaaaaaaão", "jhbduhsdbuhsbduvhsbfgydfhgdhfg", "Gerenciamento \ndjdgsaudfgusydhufdhsudyfe Firewall", "Robjhisjdhfiushfuhbfjhgbdhjfbgfjgótica"]
//
//    var row = [
//        // define number of caullum here
//        GridItem(.flexible())
//    ]
//    var body: some View {
//        VStack{
//            HStack{
//                Image("qual-curso-escolher")
//                    .resizable()
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .scaledToFill()
//                    .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
//                    .cornerRadius(10)
//                VStack(alignment: .leading){
//                    Text("Segurança da Informação")
//                        .font(.custom("Raleway-SemiBold", size: 16))
//                        .padding([.leading, .bottom, .trailing], 5.0)
//                        .foregroundColor(textColor)
//
//                    Text("É a área responsável por montar uma  barreira de segurança para que dados não estejam ao alcance de golpistas e ataques digitais.")
//                        .font(.custom("Raleway-Regular", size: 14))
//                        .padding(.horizontal, 5.0)
//                        .foregroundColor(textColor)
//
//                }
//
//            }
//            .padding()
//            .clipped()
//            .background(lightColor)
//            .cornerRadius(10)
//
//
//
//        }
//
//    }
//}

struct CardsCategory: View {
    
    let category:Category
    @State var presented = false
    
    //    var imageFavorite = ["qual-curso-escolher","qual-curso-escolher","qual-curso-escolher","qual-curso-escolher"]
    //
    //    var titleFavorite = ["Segurança da Informação", "Ciência de dados", "Gerenciamento de Firewall", "Robótica"]
    //
    //    var conteudo = ["É a área responsável por montar uma  barreira de segurança para que dados não estejam ao alcance de golpistas e ataques digitais.", "jhbduhsdbuhsbduvhsbfgydfhgdhfg", "Gerenciamento \ndjdgsaudfgusydhufdhsudyfe Firewall", "Robjhisjdhfiushfuhbfjhgbdhjfbgfjgótica"]
    //
    var columns = [
        // define number of caullum here
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack {
            LazyVStack {
                ForEach(0..<category.subcategories.count, id: \.self) { count in
                    Button(action: {
                        self.presented.toggle()
                        
                    }, label: {
                        HStack{
                            Image(category.subcategories[count].image!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                                .cornerRadius(10)
                                .shadow(radius: 8)
                            VStack(alignment: .leading){
                                Text(category.subcategories[count].title)
                                    .font(.custom("Raleway-SemiBold", size: 16))
                                    .padding([.leading, .bottom, .trailing], 5.0)
                                    .foregroundColor(.darkColor)
                                
                                
                                Text(category.subcategories[count].content)
                                    .font(.custom("Raleway-Regular", size: 14))
                                    .lineLimit(4)
                                    .padding([.leading, .bottom, .trailing], 5.0)
                                    .foregroundColor(.darkColor)
                            }
                            Spacer()
                        }.padding()
                        .clipped()
                        .background(Color.bgcardColor)
                        .cornerRadius(10)
                        
                        
                    }).padding(.bottom, 10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .fullScreenCover(isPresented: $presented, content: {
                        SubcategoryView(index: count)
                    })
                }
            }.padding(.all)
        }
    }
}
