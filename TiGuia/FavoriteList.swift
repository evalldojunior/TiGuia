//
//  FavoriteList.swift
//  TiGuia
//
//  Created by Meyrillan Silva on 17/11/20.
//

import Foundation
import SwiftUI

struct ImageOverlay: View {
    
    var title: String
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Rectangle().fill(gradient)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(10)
                //.offset(x: 14, y: -14)
                
                VStack(alignment: .leading) {
                    Text(title)
                        //.offset(x: 25, y: -25)
                        .foregroundColor(.lightColor)
                        .padding([.leading, .bottom], 9.0)
                }
            }
        }
    }
}

struct Favorite: View {
    
    @State var presented = false
    @ObservedObject var subcategory = Data.favorite
    @State var selection: Int? = nil
    
    
     //   var imageFavorite = ["seguranca","cienciadedados","firewall","robotica"]
    
     //   var titleFavorite = ["Segurança \nda Informação", "Ciência de dados", "Gerenciamento \nde Firewall", "Robótica"]
    
    var collums = [
        // define number of caullum here
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Rectangle().fill(Color.blue)
                        .frame(height: geometry.size.height / 3, alignment: .center)
                        .edgesIgnoringSafeArea(.top)
                        .padding(.bottom, -(geometry.safeAreaInsets.top))
                    
                    HStack{
                        Text("Favoritos")
                            .font(.custom("Raleway-Bold", size: 30))
                            .foregroundColor(.titleColor)
                        Spacer()
                    }.padding([.top, .leading, .trailing])
                    
                    ScrollView(.vertical) {
                        VStack {
                            LazyVGrid(columns: collums, alignment: .center, spacing: 0) {
                                ForEach(0..<subcategory.subcategories.count, id: \.self) { count in
                                    
                                    NavigationLink(destination: PaginaConteudoView(category: subcategory.subcategories[count]), tag: count, selection: $selection) {
                                        Button(action: {
                                            //self.presented.toggle()
                                            self.selection = count
                                        }, label: {
                                            Image(subcategory.subcategories[count].image ?? "seguranca" )
                                                .resizable()
                                                .frame(width: (geometry.size.width/2) - 25, height: 170)
                                                .cornerRadius(10)
                                                .overlay(ImageOverlay(title: subcategory.subcategories[count].title), alignment: .bottomLeading)
                                        })
                                        
                                    }
//                                    .fullScreenCover(isPresented: $presented, content: {
//                                        PaginaConteudoView(category: subcategory.subcategories[count])
//
//                                    })
                                }.padding(.bottom)
                                .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 10, x: 0.0, y: 4.0)
                            }
                            .aspectRatio(1, contentMode: .fit)
                        }.padding(.all)
                        
                    }
                    //.offset(y: -15)
                    .edgesIgnoringSafeArea(.bottom)
                    //Spacer()
                }.edgesIgnoringSafeArea(.bottom)
                //.offset(y: -50)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
            
        }.accentColor(.titleColor)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear(perform: {
//            let appearance = UINavigationBarAppearance()
//            appearance.shadowColor = .clear
//            UINavigationBar.appearance().standardAppearance = appearance
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            //UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        })
    }
}

// codigo para mostrar a view controller junto com o .fullScreenCover mostrado acima no botao
struct OtherUI: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return FavoriteViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}
