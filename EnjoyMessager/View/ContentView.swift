//
//  ContentView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @Binding var Email: String
    
    //ScreenTransition
    @State private var Showshould_AddFriendView = false
    @State private var Showshould_MessageView = false
    
    @State var HelloWord: String = ""
    
    //FriendList
    @State private var Loading = false
    @State var FriendList: [String] = []
    @State var TapFriendName: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text(HelloWord).font(.title2).fontWeight(.black).padding()
                Spacer()
            }
            Spacer()
            ZStack{
                if !Loading{
                    ScrollView{
                        ForEach(0..<FriendList.count, id: \.self) { index in
                            HStack{
                                Text(FriendList[index]).font(.title2).fontWeight(.black).padding()
                                Spacer()
                                Button(action: {
                                    TapFriendName = FriendList[index]
                                    Showshould_MessageView = true
                                }){
                                    Image(systemName: "message").frame(width: 50, height: 50).background(Color.white).foregroundColor(Color.black).cornerRadius(50)
                                }.padding()
                            }.frame(width: 330, height: 70).background(Color.pink.opacity(0.6)).cornerRadius(10)
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
                    Showshould_AddFriendView = true
                }){
                    Image(systemName: "plus").frame(width: 60, height: 60).background(Color.black).foregroundColor(Color.white).cornerRadius(50)
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
        .onAppear{
            HelloWordDecision()
            Loading = true
            FriendListGet()
        }
    }
    private func HelloWordDecision() {
        let HelloWordList: [String] = ["若者ってなんで選挙\nでないんだ？", "I Love You❤️", "蛙化現象まじで理解できない", "Hello World", "YEAH-------!!!"]
        HelloWord = HelloWordList.randomElement()!
    }
    private func FriendListGet(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserList").document(Email)
        
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                if let friendlist = document.data()?["FriendList"] as? [String] {
                    print("FriendList\(friendlist)")
                    FriendList = friendlist
                    Loading = false
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
