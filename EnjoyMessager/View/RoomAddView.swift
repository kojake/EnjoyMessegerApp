//
//  RoomAddView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/18.
//

import SwiftUI
import FirebaseFirestore

struct RoomAddView: View {
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    
    //Userinformation
    @Binding var Email: String
    @Binding var Username: String
    @State var UserRoomList: [String] = []
    
    @State var NewRoomName = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("部屋を作成 🏨").font(.title).fontWeight(.black).padding()
                Spacer()
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(Color.black)
                }.padding()
            }
            Spacer()
            TextField("新しい部屋の名前", text: $NewRoomName)
                .font(.title3).fontWeight(.black)
                .frame(width: 250, height: 60)
                .background(Color.purple.opacity(0.3))
                .foregroundColor(Color.black)
                .cornerRadius(10)
            Button(action: {
                UserRoomList.append(NewRoomName)
                UserRoomListUpdate()
                RoomAdd(Username: Username, NewRoomName: NewRoomName)
                dismiss()
            }){
                Text("部屋を作成").font(.title3).fontWeight(.black).frame(width: 140, height: 50).background(Color.black).foregroundColor(Color.white).cornerRadius(10)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            UserRoomListGet()
        }
    }
    private func UserRoomListGet(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserList").document(Email)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let userroomlist = document.data()?["RoomList"] as? [String] {
                    UserRoomList = userroomlist
                }
            }
        }
    }
    private func UserRoomListUpdate(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserList").document(Email)
        
        docRef.updateData(["RoomList": UserRoomList]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
