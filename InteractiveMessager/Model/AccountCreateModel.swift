//
//  AccountCreateModel.swift
//  InteractiveMessager
//
//  Created by kaito on 2024/01/15.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

func AccountCreate(NewUsername: String, NewInteractiveMessagerID: String, NewEmailTextfield: String, NewPasswordTextfield: String) {
    let db = Firestore.firestore()
    
    // 新しいコレクションを作成
    let collectionReference = db.collection("UserList")
    
    // ドキュメントを追加
    let data: [String: Any] = [
        "Username": NewUsername,
        "NewInteractiveMessagerID": NewInteractiveMessagerID,
        "Email": NewEmailTextfield,
        "Password": NewPasswordTextfield
    ]
    
    collectionReference.document(NewEmailTextfield).setData(data) { error in
        if let error = error {
            print("\(error)")
        } else {
            print("document add faile")
        }
    }
}
