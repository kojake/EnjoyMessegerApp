//
//  AccountCreateModel.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import UIKit
import Firebase
import FirebaseFirestore

func AccountCreate(NewUsername: String, NewEnjoyMessagerID: String, NewEmail: String, NewPassword: String) {
    let db = Firestore.firestore()
    
    let collectionReference = db.collection("UserList")
    
    let NewAccountData: [String: Any] = [
        "Username": NewUsername,
        "NewEnjoyMessagerID": NewEnjoyMessagerID,
        "Email": NewEmail,
        "Password": NewPassword,
        "FriendList": [String](),
        "RoomList": [String]()
    ]
    
    collectionReference.document(NewEmail).setData(NewAccountData) { error in
        if let error = error {
            print("\(error)")
        } else {
            print("document add faile")
        }
    }
}

func DatabaseEnjoyMessagerIDAdd(NewUsername: String, NewEnjoyMessagerID: String, NewEmail: String){
    let db = Firestore.firestore()
    
    let collectionReference = db.collection("EnjoyMessagerIDList")
    
    let EnjoyMessagerIDData: [String: Any] = [
        "Username": NewUsername,
        "Email": NewEmail
    ]
    
    collectionReference.document(NewEnjoyMessagerID).setData(EnjoyMessagerIDData) { error in
        if let error = error {
            print("\(error)")
        } else {
            print("document add file")
        }
    }
}
