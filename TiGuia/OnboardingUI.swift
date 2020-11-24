//
//  OnboardingUI.swift
//  TiGuia
//
//  Created by Evaldo Garcia de Souza Júnior on 19/11/20.
//

import Foundation
import SwiftUI


struct OnboardingUI: View {
    
    // @State var didTap = false
    @State var presented = false
    
    var image = ["person", "person.2"]
    var title = ["Aluno", "Mentor"]
    var descrip = ["Se você quer explorar a área da tecnologia e ainda tirar suas dúvidas com um mentor.", "Se você quer ajudar pessoas que têm interesse na sua área."]
    
    let backgroundColor = Color(red: 28/255, green: 118/255, blue: 144/255, opacity: 1.0)
    let lightColor = Color(red: 252/255, green: 252/255, blue: 252/255, opacity: 1.0)
    let orangeColor = Color(red: 251/255, green: 153/255, blue: 28/255, opacity: 1.0)
    let blackColor = Color(red: 32/255, green: 34/255, blue: 38/255, opacity: 1.0)
    
    @State var currentPage: ContainerView = ContainerView(["0", "1", "2"])
    
    var body: some View {
        VStack(alignment: .center) {
            
            HStack{
                Spacer()
                Button(action: {
                    self.presented.toggle()
                }, label: {
                   // if currentPage.currentPage == 2 {
                        Text("Pular")
                            .font(.custom("Raleway", size: 16))
                            .foregroundColor(backgroundColor)
                        
                    //}
                }).padding([.top, .leading, .trailing])
                .opacity(currentPage.currentPage == 2 ? 0 : 1)
                .fullScreenCover(isPresented: $presented, content: {
                    NextSMUI()
                })
            }.padding([.top, .leading, .trailing])
            
            currentPage
            Text("\(currentPage.currentPage)")
            //ContainerView(["0", "1", "2"])
            //Spacer()
            VStack{
                Button(action: {
                    self.presented.toggle()
                }, label: {
                    Spacer()
                    Text("Começar")
                        .font(.custom("Raleway-Bold", size: 18))
                        .foregroundColor(lightColor)
                    Spacer()
                    
                }).padding()
                .clipped()
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .fullScreenCover(isPresented: $presented, content: {
                    NextSMUI()
                })
            }.padding()
            Spacer(minLength: 10)
            //Spacer()
               // .frame(height: 34.0)
            
        }//.padding()
        
        
    }
}

struct NextSMUI: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return StudentMentorViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct OnboardingUI_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUI()
    }
}
