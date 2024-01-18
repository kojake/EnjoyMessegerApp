//
//  RoomAddModel.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/18.
//

import Foundation
import FirebaseFirestore

func RoomAdd(Username: String, NewRoomName: String){
    let db = Firestore.firestore()
    let collectionReference = db.collection("FriendRoomList")
    
    let NewRoomData: [String: Any] = [
        "\(Username)": ""
    ]
    
    collectionReference.document(NewRoomName).setData(NewRoomData) { error in
        if let error = error {
            print("\(error)")
        } else {
            print("document add faile")
        }
    }
}
