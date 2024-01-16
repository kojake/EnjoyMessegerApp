//
//  EnjoyMessagerIDAddFriend.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/16.
//

import SwiftUI

struct EnjoyMessagerIDAddFriendView: View {
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    
    @State var SearchEnjoyMessagerID = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("EnjoyMessagerID \nで追加").font(.title2).fontWeight(.black).padding()
                Spacer()
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(Color.black)
                }.padding()
            }
            Spacer()
            TextField("EnjoyMessagerID", text: $SearchEnjoyMessagerID)
                .font(.title3)
                .fontWeight(.bold)
                .frame(width: 200, height: 60)
                .background(Color.mint)
                .cornerRadius(5)
                .keyboardType(.alphabet)
            Button(action: {
                
            }){
                Text("検索").font(.title2).fontWeight(.bold).frame(width: 100, height: 50).background(Color.black).foregroundColor(Color.white).cornerRadius(10)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("閉じる") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
    }
}

#Preview {
    EnjoyMessagerIDAddFriendView()
}
