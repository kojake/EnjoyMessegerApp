//
//  ContentView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    //User informaiton
    @Binding var Email: String
    @State var Username: String = ""
    
    //ScreenTransition
    @State private var Showshould_RoomAddView = false
    @State private var Showshould_AddFriendView = false
    @State private var Showshould_MessageView = false
    
    //View
    @State var HelloWord: String = ""
    @State private var SelectedIndex = 0
    @State private var Loading = false
    
    //FriendList
    @State var FriendList: [String] = []
    @State var TapFriendName: String = ""
    
    //RoomList
    @State var RoomList: [String] = []
    @State var TapRoomName: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text(HelloWord).font(.title2).fontWeight(.black).padding()
                Spacer()
            }
            Spacer()
            Picker("", selection: self.$SelectedIndex) {
                Text("ルーム")
                    .tag(0)
                Text("フレンド")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            ZStack{
                if !Loading{
                    ScrollView{
                        if SelectedIndex == 0{
                            ForEach(0..<RoomList.count, id: \.self) { index in
                                HStack{
                                    Text(RoomList[index]).font(.title2).fontWeight(.black).padding()
                                    Spacer()
                                    Button(action: {
                                        TapFriendName = FriendList[index]
                                        Showshould_MessageView = true
                                    }){
                                        Image(systemName: "message").frame(width: 50, height: 50).background(Color.white).foregroundColor(Color.black).cornerRadius(50)
                                    }.padding()
                                }.frame(width: 330, height: 70).background(Color.mint.opacity(0.6)).cornerRadius(10)
                            }
                        }
                        else if SelectedIndex == 1 {
                            ForEach(0..<FriendList.count, id: \.self) { index in
                                HStack{
                                    Text(FriendList[index]).font(.title2).fontWeight(.black).padding()
                                    Spacer()
                                }.frame(width: 330, height: 70).background(Color.pink.opacity(0.6)).cornerRadius(10)
                            }
                        }
                    }
                } else{
                    LoadingView()
                }
            }
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    Showshould_RoomAddView = true
                }){
                    Image(systemName: "plus.rectangle.fill.on.rectangle.fill").frame(width: 60, height: 60).background(Color.black).foregroundColor(Color.white).cornerRadius(50)
                }
                Button(action: {
                    Showshould_AddFriendView = true
                }){
                    Image(systemName: "person.fill.badge.plus").frame(width: 60, height: 60).background(Color.black).foregroundColor(Color.white).cornerRadius(50)
                }.padding()
            }.frame(maxWidth: .infinity, maxHeight: 100).background(Color.purple.opacity(0.3))
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $Showshould_MessageView){
            MessageView()
        }
        .sheet(isPresented: $Showshould_AddFriendView){
            AddFriendView()
        }
        .sheet(isPresented: $Showshould_RoomAddView){
            RoomAddView(Email: $Email, Username: $Username)
        }
        .onAppear{
            UsernameGet()
            Loading = true
            FriendListGet()
            RoomListGet()
            let HelloWordList: [String] = ["若者ってなんで選挙\nでないんだ？", "I Love You❤️", "蛙化現象まじで理解できない", "Hello World", "YEAH-------!!!"]
            HelloWord = HelloWordList.randomElement()!
        }
    }
    
    private func FriendListGet(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserList").document(Email)
        
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                if let friendlist = document.data()?["FriendList"] as? [String] {
                    FriendList = friendlist
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    private func RoomListGet(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserList").document(Email)
        
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                if let roomlist = document.data()?["RoomList"] as? [String] {
                    RoomList = roomlist
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    private func UsernameGet(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserList").document(Email)
        
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                if let username = document.data()?["Username"] as? String {
                    Username = username
                    Loading = false
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
