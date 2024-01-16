//
//  AccountCreateModel.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import UIKit
import Firebase
import FirebaseFirestore

func AccountCreate(NewUsername: String, NewEnjoyMessagerID: String, NewEmailTextfield: String, NewPasswordTextfield: String) {
    let db = Firestore.firestore()
    
    // 新しいコレクションを作成
    let collectionReference = db.collection("UserList")
    
    // ドキュメントを追加
    let data: [String: Any] = [
        "Username": NewUsername,
        "NewEnjoyMessagerID": NewEnjoyMessagerID,
        "Email": NewEmailTextfield,
        "Password": NewPasswordTextfield,
        "FriendList": [String]()
    ]
    
    collectionReference.document(NewEmailTextfield).setData(data) { error in
        if let error = error {
            print("\(error)")
        } else {
            print("document add faile")
        }
    }
}
