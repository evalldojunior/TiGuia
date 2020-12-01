//
//  CategoryView.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 16/11/20.
//

//import Foundation
import SwiftUI
//titulo, conteúdo, links, cards subcategorias, btn favorito
struct CategoryView: View {
    @State private var favorito: Bool = false
    @State private var presented: Bool = false
    
    let category = Data().returnCategory()
    
    var categoryIndex: Int
    
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
            }.padding()
            //
            //MARK: -inicio do conteúdo
            //
            
            ScrollView{
                //VStack{
                VStack {
                    Text(category.content)
                        .font(.custom("Raleway-Regular", size: 15))
                        .multilineTextAlignment(.leading)
                        //.padding()
                        .foregroundColor(.darkColor)
                    
                    
                }.padding()
                //.frame(width: 372, height: 148, alignment: .leading)
                
                HStack{
                    Text("Links úteis")
                        .multilineTextAlignment(.leading)
                        .font(.custom("Raleway-Bold", size: 20))
                        .foregroundColor(.titleColor)
                    Spacer()
                }.padding([.top, .leading, .trailing])
                //
                //MARK: -"colection" de links
                //
                CardLink(category: category)
                
                //
                //MARK: -subcategorias
                //
                HStack{
                    Text("Categorias")
                        .font(.custom("Raleway-Bold", size: 20))
                        .foregroundColor(.titleColor)
                    Spacer()
                }.padding([.top, .leading, .trailing])
                
                
                CardsCategory(category: category)
                
                
                
                //
                //MARK: -botao de pedir ajuda
                //
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
                //.edgesIgnoringSafeArea(.bottom)
                
                //  }
                //.padding(.trailing)
                //Spacer()
                
            }
            
        }//.edgesIgnoringSafeArea(.bottom)
        
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(categoryIndex: 0)
    }
}
