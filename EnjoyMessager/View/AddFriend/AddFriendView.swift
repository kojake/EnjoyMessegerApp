//
//  AddFriendView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI

struct AddFriendView: View {
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    @State private var Showshould_EnjoyMessagerIDAddFriendView = false
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Text("友達追加").font(.title).fontWeight(.black)
                    Text("👦").font(.system(size: 50))
                }.padding()
                Spacer()
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(Color.black).padding()
                }
            }.padding()
            Button(action: {
                
            }){
                HStack{
                    Image(systemName: "qrcode").frame(width: 60, height: 60).background(Color.gray).foregroundColor(Color.white).cornerRadius(10).padding()
                    Text("QRコードで追加").foregroundColor(Color.black)
                    Spacer()
                }
            }
            Button(action: {
                Showshould_EnjoyMessagerIDAddFriendView = true
            }){
                HStack{
                    Image(systemName: "pencil.and.outline").frame(width: 60, height: 60).background(Color.gray).foregroundColor(Color.white).cornerRadius(10).padding()
                    Text("EnjoyMessager IDで追加").foregroundColor(Color.black)
                    Spacer()
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $Showshould_EnjoyMessagerIDAddFriendView){
            EnjoyMessagerIDAddFriendView()
        }
    }
}

#Preview {
    AddFriendView()
}
