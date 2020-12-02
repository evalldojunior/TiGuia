//
//  ContentView.swift
//  TiGuia
//
//  Created by Palloma Ramos on 01/12/20.
//

import SwiftUI
import Firebase

let buttonColor = Color(red: 28/255, green: 118/255, blue: 144/255, opacity: 1.0)
let lightColor = Color(red: 252/255, green: 252/255, blue: 252/255, opacity: 1.0)
let orangeColor = Color(red: 251/255, green: 153/255, blue: 28/255, opacity: 1.0)
let blackColor = Color(red: 32/255, green: 34/255, blue: 38/255, opacity: 1.0)
let lightBlueColor = Color(red: 33/255, green: 158/255, blue: 188/255, opacity: 1.0)
let messageBlueColor = Color(red: 31/255, green: 145/255, blue: 173/255, opacity: 1.0)
let greyColor = Color(red: 224/255, green: 230/255, blue: 236/255, opacity: 1.0)
let lightGreyColor = Color(red: 247/255, green: 249/255, blue: 250/255, opacity: 1.0)
let darkGreyColor = Color(red: 151/255, green: 151/255, blue: 151/255, opacity: 1.0)

struct ContentView: View {
    
    @State var name = ""
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                lightColor
                
                VStack{
                    Image(systemName: "person.circle.fill").resizable().frame(width: 60, height: 60).padding(.top)
                        .foregroundColor(darkGreyColor)
                    TextField("Nome",text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(lightBlueColor, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .cornerRadius(3)
                        .padding()
                        .font(.custom("Raleway-Regular", size: 17))
                    
                    if self.name != ""{
                        
                        NavigationLink(destination: MsgPage(name: name)){
                            
                            HStack{
                                Text("Join")
                                    .font(.custom("Raleway-Bold", size: 17))
                                    .border(lightBlueColor)
                                Image(systemName: "arrow.right.circle.fill").resizable().frame(width: 20, height: 20)
                            }
                        }.frame(width:100, height:44)
                        .background(buttonColor)
                        .foregroundColor(lightColor)
                        .cornerRadius(10)
                        .padding(.bottom,15)
                    }
                    
                }
                .background(lightColor)
                .cornerRadius(20)
                .padding()
                
            }.edgesIgnoringSafeArea(.all)
        }
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MsgPage: View {
    
    var name = ""
    @ObservedObject var msg = Observer()
    @State var typedmsg = ""
    
    var body: some View{
        
        VStack(alignment: .leading) {
                Text("Mentoria com Dara")
                    .font(.custom("Raleway-Bold", size: 25))
                    .foregroundColor(lightBlueColor)
                    .padding(.horizontal)
                Text("Professora de Computação")
                    .font(.custom("Raleway-Regular", size: 15))
                    .foregroundColor(blackColor)
                    .padding(.horizontal)
                
                VStack {
                    Text("Hoje")
                        .multilineTextAlignment(.center)
                        .background(lightColor)
                        .cornerRadius(3)
                        .padding(.top)
                        .padding(.leading,25)
                        .font(.custom("Raleway-Regular", size: 15))
                        .foregroundColor(blackColor)
                    
                    VStack {
                        
                        Text("Essa conversa é sobre Segurança da Informação")
                            .multilineTextAlignment(.center)
                            .background(lightGreyColor)
                            .cornerRadius(3)
                            .padding(.top)
                            .padding(.leading,40)
                            .font(.custom("Raleway-Regular", size: 17))
                            .foregroundColor(blackColor)
                        
                    }
                    VStack{
                        List(msg.msgs){ i in
                            
                            List(msg.msgs){i in
                                
                                if i.name == self.name{
                                    MsgRow(msg: i.msg, myMsg: true, user: i.name)
                                }
                                else {
                                    MsgRow(msg: i.msg, myMsg: false, user: i.name)
                                }
                            }
                            
                        }
//                        .navigationBarTitle("Mentorias",displayMode: .inline).font(.custom("Raleway-Bold", size: 20))
                        .navigationBarBackButtonHidden(false)
                        
                    HStack{
                        
                        TextField("Mensagem", text: $typedmsg).textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(.custom("Raleway-Regular", size: 17))
                            .border(lightBlueColor, width: 1)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        
                        Button(action: {
                            self.msg.addMsg(msg: self.typedmsg, user: self.name)
                            self.typedmsg = ""
                        }) {
                            //                    Text("Send")
                            Image(systemName: "paperplane")
                                .foregroundColor(lightColor)
                                .padding(.all, 6)
                                .background(buttonColor)
                                .cornerRadius(3)
                        }
                    } .padding()
                }
            }
        }
    }
}
    
    class Observer: ObservableObject {
        
        
        @Published var msgs = [Datatype]()
        
        init() {
            
            let db = Firestore.firestore()
            
            db.collection("msgs").addSnapshotListener {(snap, err) in
                
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                for i in snap!.documentChanges{
                    
                    if i.type == .added{
                        //                    let name = i.document.get("name") as! String
                        //                    let msg = i.document.get("msg") as! String
                        guard let name = i.document.get("name") as? String else {
                            print("erro")
                            return
                        }
                        guard let msg = i.document.get("msg") as? String else {
                            print("erro")
                            return
                        }
                        let id = i.document.documentID
                        
                        self.msgs.append(Datatype(id: id, name: name, msg: msg))
                    }
                    
                }
            }
        }
        
        func  addMsg(msg:String, user: String){
            let db = Firestore.firestore()
            db.collection("msgs").addDocument(data: ["msg":msg, "name":user]){ (err) in
                
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                print("sucess")
                
            }
        }
    }
    
    struct Datatype: Identifiable {
        
        var id: String
        var name: String
        var msg: String
    }
    
    struct MsgRow: View {
        var msg = ""
        var myMsg = false
        var user = ""
        
        var body: some View {
            
            let lightGreyColor = Color(red: 247/255, green: 249/255, blue: 250/255, opacity: 1.0)
            
            HStack{
                
                if myMsg{
                    Spacer()
                    Text(msg).padding(10).background(messageBlueColor).cornerRadius(10).foregroundColor(lightColor)
                        .font(.custom("Raleway-ExtraLight", size: 17))
                        .padding(.bottom)
                }
                else {
                    
                    VStack(alignment: .leading){
                        
                        Text(msg).padding(8).background(greyColor).cornerRadius(6).foregroundColor(.black)
                            .font(.custom("Raleway-ExtraLight", size: 17))
                        Text(user)
                    }
                    Spacer()
                }
            }
        }
    }
