//
//  SendMessageModel.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/17.
//

import Foundation
import FirebaseFirestore

func SendMessage(){
    let uploaddata: [String: Any] = [
        "Roommessage": ""
    ]
    let db = Firestore.firestore()
    // Firestoreにデータを代入
    db.collection("FriendRoomList").document("test").updateData(uploaddata) { error in
        if let error = error {
            print("Error writing document: \(error)")
        } else {
            print("Document successfully written")
        }
    }
}


