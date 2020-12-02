//
//  SubcategoryView.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 24/11/20.
//

import Foundation

import SwiftUI
//titulo, conteúdo, links, cards subcategorias, btn favorito
struct SubcategoryView: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    //var category = Data().returnCategory()
    var favorite = Favorites()
    //var index:Int
    
    var category:Subcategory
    
    var body: some View {
        
        
        VStack {
            //
            //MARK: -Header - titulo + botao de favoritos
            //
            HStack {
                //título
                Text(category.title)
                    .foregroundColor(.titleColor)
                    .font(.custom("Raleway-Bold", size: 30))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button(action: {
                    self.favorito.toggle()
                    if(self.favorito){
                        favorite.addSubcategory(subcategory: category)
                    }else{
                        favorite.removeSubcategory(subcategory: category)
                    }
                    category.favorite = favorito
                    
                }, label: {
                    Image(systemName: self.favorito == true ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .background(Color.btnColor)
                        .foregroundColor(.lightColor)
                        .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                })
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .offset(y: -10) // realmente necessario?
                
            }.padding()
            
            //
            //MARK: -inicio do conteúdo
            //
            
            ScrollView{
                VStack {
                    Text(category.content)
                        .font(.custom("Raleway-Regular", size: 15))
                        .multilineTextAlignment(.leading)
                        //.padding()
                        .foregroundColor(.darkColor)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
                
                HStack{
                    Text("Links úteis")
                        .multilineTextAlignment(.leading)
                        .font(.custom("Raleway-Bold", size: 20))
                        .foregroundColor(.titleColor)
                    Spacer()
                }.padding([.top, .leading, .trailing])
                
                SubCardLink(category: category)
                
                HStack{
                    Text("Categorias")
                        .font(.custom("Raleway-Bold", size: 20))
                        .foregroundColor(.titleColor)
                    Spacer()
                }.padding([.top, .leading, .trailing])
                
                SubCardsCategory(category: category)
                
                VStack {
                    Button(action: {
                        self.presented.toggle()
                    }, label: {
                        Spacer()
                        Image(systemName: "ellipses.bubble")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.lightColor)
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Pedir ajuda")
                            .font(.custom("Raleway-Bold", size: 18))
                            .foregroundColor(.lightColor)
                        Spacer()
                        
                    }).padding()
                    .clipped()
                    .background(Color.btnColor)
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .fullScreenCover(isPresented: $presented, content: {
                        //HelpUI()
                    })
                }.padding()
                
                Spacer(minLength: 20)
                
            }
            
        }
        
    }
    
}
//codigo pra apresentar a view controller de pedir ajuda
//    struct HelpUI: UIViewControllerRepresentable {
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return //view de pedir ajuda
//        }
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//        }
//    }

//    var helloColor: UIColor{
//        if didTap {
//            return .red
//        }else{
//            return .blue
//        }
//    }


//struct Subcategory_Previews: PreviewProvider {
//    static var previews: some View {
//        SubcategoryView()
//    }
//}
