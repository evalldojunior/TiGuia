//
//  ChatUI.swift
//  TiGuia
//
//  Created by Palloma Ramos on 23/11/20.
//

import SwiftUI
import PhotosUI

struct MessageData: Identifiable {
    enum DataType {
        case image(imageIndex: Int)
        case text(message: String)
    }
    let isMine: Bool
    let dataType: DataType
    let id = UUID()
}

struct ChatUI : View {
    static var pickerResult: [UIImage] = []
    @State private var fullText: String = ""
    @State private var messageData: [MessageData] = []
    @StateObject private var keyboard = KeyboardResponder()
    var scrollToid = 99
    @State private var isPickerPresented: Bool = false
    var config: PHPickerConfiguration  {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images //videos, livePhotos...
        config.selectionLimit = 0 //0 => any, set 1-2-3 for hard limit
        return config
    }
    func Scroll(reader :ScrollViewProxy) -> some View {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            withAnimation {
                reader.scrollTo(scrollToid)
            }
        }
        return EmptyView()
    }
    
    var body: some View {
        HStack {
            Button(action: {
                isPickerPresented.toggle()
            }) {
                Image(systemName: "chevron.backward")}
//            }.sheet(isPresented: $backButton) {
//                PhotoPicker(configuration: self.config, pickerResult: { (imageArray) in
//                    var index = ChatUI.pickerResult.count
//                    for image in imageArray {
//                        ChatUI.pickerResult.append(image)
//                        messageData.append(MessageData(isMine: true, dataType: .image(imageIndex: index)))
//                        index += 1
//                    }
//                }, isPresented: $isPickerPresented)
//        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                //                        Image(systemName: "person.circle.fill")
                Text("Mentoria com Dara")
                    .font(.custom("Raleway-Bold", size: 30))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Text("Professora de Computação")
                    .font(.custom("Raleway-Regular", size: 20))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
            ZStack {
                //                                VStack(alignment: .leading) {
                //                                    //                        Image(systemName: "person.circle.fill")
                //                                    Text("Mentoria com Dara")
                //                                        .font(.custom("Raleway-Bold", size: 30))
                //                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                //                                    Text("Professora de Computação")
                //                                        .font(.custom("Raleway-Regular", size: 20))
                //
                //
                //                                }
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { reader in
                        LazyVStack(spacing: 0.5) {
                            ForEach(messageData) {  message in
                                ChatBubble(direction: message.isMine ? .right : .left) {
                                    switch message.dataType {
                                    case .text(let userMessage):
                                        Text(userMessage)
                                            .padding(.all, 10)
                                            .foregroundColor(Color.white)
                                            .background(message.isMine ? Color.blue : Color.gray)
                                    case .image(let imageIndex):
                                        Image(uiImage: ChatUI.pickerResult[imageIndex])
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width - 70,
                                                   height: 200).aspectRatio(contentMode: .fill)
                                    }
                                }
                            }
                            Rectangle()
                                .frame(height: 50, alignment: .center)
                                .foregroundColor(Color.white).id(scrollToid)//padding from bottom
                            Scroll(reader: reader)
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            isPickerPresented.toggle()
                        }) {
                            //                                Image(systemName: "plus")
                        }.sheet(isPresented: $isPickerPresented) {
                            PhotoPicker(configuration: self.config, pickerResult: { (imageArray) in
                                var index = ChatUI.pickerResult.count
                                for image in imageArray {
                                    ChatUI.pickerResult.append(image)
                                    messageData.append(MessageData(isMine: true, dataType: .image(imageIndex: index)))
                                    index += 1
                                }
                            }, isPresented: $isPickerPresented)
                            
                            
                        }
                        TextField("Mensagem", text: $fullText)
                            .frame(width: UIScreen.main.bounds.width - 70)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.blue)
                            .cornerRadius(3)
                            .padding(.trailing)
                        Spacer()
                            .frame(width: -10.0)
                            
                        Button(action: {
                            messageData.append(MessageData.init(isMine: true, dataType: .text(message: fullText)))
                            messageData.append(MessageData.init(isMine: false, dataType: .text(message: "reply to:" + fullText)))
                            fullText = ""
                        }) {
                            Image(systemName: "paperplane")
                                .foregroundColor(.white)
                                .padding(.all, 6)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .cornerRadius(3)
                            
                        }.disabled(fullText.isEmpty)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top, .bottom], 10)
//                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                    
                }
            }
            .padding(.top)
            
        }
        //            .navigationBarTitleDisplayMode(.inline)
        //            .toolbar(content: {
        //                ToolbarItem(placement: .principal) {
//        HStack {
//            //                        Image(systemName: "person.circle.fill")
//            Text("Mentoria com Dara")
//                .font(.custom("Raleway-Bold", size: 30))
//                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//        }
    }
}
//)
//}
    }
//}

struct ChatUI_Previews: PreviewProvider {
    static var previews: some View {
        ChatUI()
    }
}
