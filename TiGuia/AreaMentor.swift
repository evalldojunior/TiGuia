//
//  AreaMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 01/12/20.
//

import Foundation
import SwiftUI

struct AreaMentorView: View {
    @State private var presented: Bool = false
    
    var category = Data().returnCategory()
//    static var areasEscolhidas: [Subcategory] = []
    static var mentor = Mentor()
    
    let titleColor = Color("titleColor")
    let btnColor = Color("btnColor")
    let lightColor = Color("lightColor")
    let textColor = Color("darkColor")
    
    var columns = [
        // define number of caullum here
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 75.0)
            HStack {
                //título
                Text("Em quais áreas você tem conhecimento para mentorar?")
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(width: 350.0, alignment: .leading)
                    .foregroundColor(.darkColor)
                Spacer()
                
            }
            
            ScrollView {
                
                VStack {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<category.subcategories.count, id: \.self) { count in
                            CardsAreaMentorView(category: category, count: count)
                        }
                    }
                    
                } .padding()
                
                Button(action: {
                    self.presented.toggle()

                }, label: {
                    Spacer()
                    Text("Continuar")
                        .font(.custom("Raleway-Bold", size: 18))
                        .foregroundColor(lightColor)
                        .frame(alignment: .center)
                    Spacer()
                    
                }).padding()
                .clipped()
                .background(btnColor)
                .cornerRadius(10)
                .padding()
                .shadow(radius: 10)
                .fullScreenCover(isPresented: $presented, content: {
                    SubAreaMentorView(subAreasEscolhidas: AreaMentorView.mentor.subAreas)
                })
            }
        }
        
    }
    
}

struct AreaMentorView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMentorView()
    }
}
