//
//  SubareaMentor.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 01/12/20.
//

import Foundation
import SwiftUI

struct CardsAreaMentor: View {
    
    @State private var checkSelected: Bool = false
    
    let lightColor = Color("lightColor")
    let textColor = Color("darkColor")
    let category:Category
    
    var check = Subcategory().checkMentor

    //    @State var presented = false
    
    //
    var columns = [
        // define number of caullum here
        GridItem(.flexible())
    ]
    
    var body: some View {
        //  ZStack{
        VStack(alignment: .leading) {
            //  ScrollView(.vertical) {
            
            LazyVGrid(columns: columns) {
                ForEach(0..<category.subcategories.count, id: \.self) { count in
                    Button(action: {
                        //                        self.presented.toggle()
                        self.checkSelected.toggle()
                        
                    }, label: {
                        
                            HStack {
                                Image(category.subcategories[count].image!)
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .scaledToFill()
                                    .clipShape(Rectangle(), style: FillStyle())
                                    .cornerRadius(10)
                                VStack(alignment: .leading) {
                                    
                                    Text(category.subcategories[count].title)
                                        .font(.custom("Raleway-SemiBold", size: 16))
                                        .padding([.leading, .bottom], 5.0)
                                        .foregroundColor(textColor)
                                    
                                    Text(category.subcategories[count].content)
                                        .font(.custom("Raleway-Regular", size: 14))
                                        .padding(.horizontal, 5.0)
                                        .foregroundColor(textColor)
                                    //Spacer()
                                    
                                } .frame(width: 250, height: 100, alignment: .topLeading)
                                
                                Image(systemName: self.checkSelected == false ? "" : "checkmark.square.fill")
                                    .frame(width: 18, height: 18, alignment: .topTrailing)
                                    .foregroundColor(.btnColor)
                                
                            }
                            .padding( )
                            .clipped()
                            .background(lightColor)
                            .cornerRadius(10)
                            .frame(minWidth: 372, idealWidth: 372, maxWidth: 372, minHeight: 121, idealHeight: 121, maxHeight: 121, alignment: .leading)
                        
                    })
                    //                    .fullScreenCover(isPresented: $presented, content: {
                    //                        SubcategoryView(index: count)
                    //                    })
                }.padding()
                // }
            }
            
            //  }
        }
    }
}
